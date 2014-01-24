#import "RoundedCornersView.h"
#import "SuggestionsWindowController.h"
#import "HighlightingView.h"
#import "NSImageThumbnailExtensions.h"
#import "SuggestionsWindow.h"
#import "SuggestibleTextFieldCell.h"
#import "NSImage+Utils.h"
#import "NSWindow+DPUtils.h"
#import "NSWindow+DPKit.h"

APPKIT_EXTERN NSString *kSuggestionImage;

#define kTrackerKey @"whichImageView"

#define THUMBNAIL_WIDTH 24.0f

@interface SuggestionsWindowController ()

/* declare the these properties in an anonymous category since they are private
*/
@property(assign) BOOL needsLayoutUpdate;
@property(nonatomic, strong) NSView *selectedView;

// private helper methods
- (void) layoutSuggestions;

@end


@implementation SuggestionsWindowController

@synthesize target = _target;
@synthesize action = _action;
@synthesize needsLayoutUpdate = _needsLayoutUpdate;
@synthesize selectedView = _selectedView;

@synthesize defaultImage;

@synthesize itemPrototypeName;

- (NSTextField *) currentTextField {
    return _parentTextField;
}

- (id) init {
    NSRect contentRec = {{0, 0}, {20, 20}};
    NSWindow *window = [[SuggestionsWindow alloc] initWithContentRect: contentRec defer: YES];

    self = [super initWithWindow: window];
    if (self) {
        // SuggestionsWindow is a transparent window, create RoundedCornersView and set it as the content view to draw a menu like window.
        RoundedCornersView *contentView = [[RoundedCornersView alloc] initWithFrame: contentRec];
        window.contentView = contentView;
        [contentView setAutoresizesSubviews: NO];

        window.windowThemeFrame.wantsLayer = YES;
        window.windowThemeFrame.layer.masksToBounds = NO;

        contentView.wantsLayer = YES;
        contentView.layer.masksToBounds = NO;

        self.needsLayoutUpdate = YES;
    }

    return self;
}

/* Custom selectedView property setter so that we can set the highlighted property of the old and new selected views.
*/
- (void) setSelectedView: (NSView *) view {
    if (_selectedView != view) {
        ((HighlightingView *) _selectedView).highlighted = NO;
        _selectedView = view;
    }

    ((HighlightingView *) _selectedView).highlighted = YES;
}


- (void) userSetSelectedView: (NSView *) view {
    self.selectedView = view;
    [NSApp sendAction: self.action to: self.target from: self];
}


/* Position and lay out the suggestions window, set up auto cancelling tracking, and wires up the logical relationship for accessibility. 
*/
- (void) beginForTextField: (NSTextField *) parentTextField {
    NSWindow *suggestionWindow = self.window;
    NSWindow *parentWindow = parentTextField.window;
    NSRect parentFrame = parentTextField.frame;
    NSRect frame = suggestionWindow.frame;
    frame.size.width = parentFrame.size.width;

    // Place the suggestion window just underneath the text field and make it the same width as th text field.
    NSPoint location = [parentTextField.superview convertPoint: parentFrame.origin toView: nil];
    location = [parentWindow convertBaseToScreen: location];
    location.y -= 2.0f; // nudge the suggestion window down so it doesn't overlapp the parent view
    [suggestionWindow setFrame: frame display: NO];
    [suggestionWindow setFrameTopLeftPoint: location];
    [self layoutSuggestions]; // The height of the window will be adjusted in -layoutSuggestions.

    // add the suggestion window as a child window so that it plays nice with Expose
    [parentWindow addChildWindow: suggestionWindow ordered: NSWindowAbove];

    // keep track of the parent text field in case we need to commit or abort editing.
    _parentTextField = parentTextField;

    // The window must know its accessibility parent, the control must know the window one of its accessibility children
    // Note that views (controls especially) are often ignored, so we want the unignored descendant - usually a cell
    // Finally, post that we have created the unignored decendant of the suggestions window
    id unignoredAccessibilityDescendant = NSAccessibilityUnignoredDescendant(parentTextField);
    [(SuggestionsWindow *) suggestionWindow setParentElement: unignoredAccessibilityDescendant];
    if ([unignoredAccessibilityDescendant respondsToSelector: @selector(setSuggestionsWindow:)]) {
        [unignoredAccessibilityDescendant setSuggestionsWindow: suggestionWindow];
    }
    NSAccessibilityPostNotification(NSAccessibilityUnignoredDescendant(suggestionWindow), NSAccessibilityCreatedNotification);

    // setup auto cancellation if the user clicks outside the suggestion window and parent text field. Note: this is a local event monitor and will only catch clicks in windows that belong to this application. We use another technique below to catch clicks in other application windows.
    _localMouseDownEventMonitor = [NSEvent addLocalMonitorForEventsMatchingMask: NSLeftMouseDownMask | NSRightMouseDownMask | NSOtherMouseDown handler: ^(NSEvent *event) {
        // If the mouse event is in the suggestion window, then there is nothing to do.
        if ([event window] != suggestionWindow) {
            if ([event window] == parentWindow) {
                /* Clicks in the parent window should either be in the parent text field or dismiss the suggestions window. We want clicks to occur in the parent text field so that the user can move the caret or select the search text.
                
                    Use hit testing to determine if the click is in the parent text field. Note: when editing an NSTextField, there is a field editor that covers the text field that is performing the actual editing. Therefore, we need to check for the field editor when doing hit testing.
                */
                NSView *contentView = [parentWindow contentView];
                NSPoint locationTest = [contentView convertPoint: [event locationInWindow] fromView: nil];
                NSView *hitView = [contentView hitTest: locationTest];
                NSText *fieldEditor = [parentTextField currentEditor];
                if (hitView != parentTextField && (fieldEditor && hitView != fieldEditor)) {
                    // Since the click is not in the parent text field, return nil, so the parent window does not try to process it, and cancel the suggestion window.
                    event = nil;
                    [self cancelSuggestions];
                }
            } else {
                // Not in the suggestion window, and not in the parent window. This must be another window or palette for this application.
                [self cancelSuggestions];
            }
        }

        return event;
    }];
    // as per the documentation, do not retain event monitors.

    // We also need to auto cancel when the window loses key status. This may be done via a mouse click in another window, or via the keyboard (cmd-~ or cmd-tab), or a notificaiton. Observing NSWindowDidResignKeyNotification catches all of these cases and the mouse down event monitor catches the other cases.
    _lostFocusObserver = [[NSNotificationCenter defaultCenter] addObserverForName: NSWindowDidResignKeyNotification object: parentWindow queue: nil usingBlock: ^(NSNotification *arg1) {
        // lost key status, cancel the suggestion window
        [self cancelSuggestions];
    }];
}

/* Order out the suggestion window, disconnect the accessibility logical relationship and dismantle any observers for auto cancel.
    Note: It is safe to call this method even if the suggestions window is not currently visible.
*/
- (void) cancelSuggestions {
    NSWindow *suggestionWindow = self.window;
    if ([suggestionWindow isVisible]) {
        // Remove the suggestion window from parent window's child window collection before ordering out or the parent window will get ordered out with the suggestion window.
        [[suggestionWindow parentWindow] removeChildWindow: suggestionWindow];
        [suggestionWindow orderOut: nil];

        // Disconnect the accessibility parent/child relationship
        [[(SuggestionsWindow *) suggestionWindow parentElement] setSuggestionsWindow: nil];
        [(SuggestionsWindow *) suggestionWindow setParentElement: nil];
    }

    // dismantle any observers for auto cancel
    if (_lostFocusObserver) {
        [[NSNotificationCenter defaultCenter] removeObserver: _lostFocusObserver];
        _lostFocusObserver = nil;
    }

    if (_localMouseDownEventMonitor) {
        [NSEvent removeMonitor: _localMouseDownEventMonitor];
        _localMouseDownEventMonitor = nil;
    }
}

/* Update the array of suggestions. The array should consist of NSDictionaries each containing the following keys:
    kSuggestionImageURL - The URL to an image file
    kSuggestionLabel - The main suggestion string
    kSuggestionDetailedLabel - A longer string that provides more detail about the suggestion
    kSuggestionImage - [optional] The image to show in the suggestion thumbnail. If this key is not provided, a thumbnail image will be created in a background que.
*/
- (void) setSuggestions: (NSArray *) suggestions {
    _suggestions = [suggestions copy];

    // We only need to update the layout if the window is currently visible.
    if ([self.window isVisible]) {
        [self layoutSuggestions];
    }
}

/* Returns the dictionary of the currently selected suggestion.
*/
- (id) selectedSuggestion {
    id suggestion = nil;

    // Find the currently selected view's controller (if there is one) and return the representedObject which is the NSMutableDictionary that was passed in via -setSuggestions:
    NSView *selectedView = self.selectedView;
    for (NSViewController *viewController in viewControllers) {
        if (selectedView == viewController.view) {
            suggestion = [viewController representedObject];
            break;
        }
    }

    return suggestion;
}

#pragma mark -
#pragma mark Mouse Tracking

/* Mouse tracking is easily accomplished via tracking areas. We setup a tracking area for suggestion view and watch as the mouse moves in and out of those tracking areas.
*/

/* Properly creates a tracking area for an image view.
*/
- (id) trackingAreaForView: (NSView *) view {
    // make tracking data (to be stored in NSTrackingArea's userInfo) so we can later determine the imageView without hit testing
    NSDictionary *trackerData = [NSDictionary dictionaryWithObjectsAndKeys: view, kTrackerKey, nil];

    NSRect trackingRect = [[self.window contentView] convertRect: view.bounds fromView: view];
    NSTrackingAreaOptions trackingOptions = NSTrackingEnabledDuringMouseDrag | NSTrackingMouseEnteredAndExited | NSTrackingActiveInActiveApp;
    NSTrackingArea *trackingArea = [[NSTrackingArea alloc] initWithRect: trackingRect options: trackingOptions owner: self userInfo: trackerData];

    return trackingArea;
}

// Creates suggestion views from suggestionprototype.xib for every suggestion and resize the suggestion window accordingly. Also creates a thumbnail image on a backgroung aue.
- (void) layoutSuggestions {

    NSWindow *window = self.window;
    RoundedCornersView *contentView = (RoundedCornersView *) [window contentView];

    // Remove any existing suggestion view and associated tracking area and set the selection to nil
    self.selectedView = nil;

    if (viewControllers) {
        for (NSViewController *viewController in viewControllers) {
            [viewController.view removeFromSuperview];
        }
        [viewControllers removeAllObjects];

        for (NSTrackingArea *trackingArea in _trackingAreas) {
            [contentView removeTrackingArea: trackingArea];
        }

        [_trackingAreas removeAllObjects];
    } else {
        viewControllers = [[NSMutableArray alloc] initWithCapacity: 1];
        _trackingAreas = [[NSMutableArray alloc] initWithCapacity: 1];
    }

    /* Iterate througn each suggestion creating a view for each entry.
    */

    /* The width of each suggestion view should match the width of the window. The height is determined by the view's height set in IB.
    */


    CGFloat inset = 0;
    NSRect contentFrame = contentView.frame;
    if (contentView.shadow) {
        inset = contentView.shadow.shadowBlurRadius + 3;
        contentFrame = NSInsetRect(contentFrame, inset, inset);
    }

    NSRect frame;
    frame.size.height = 0.0f;
    frame.size.width = NSWidth(contentFrame);
    frame.origin = NSMakePoint(contentFrame.origin.x, inset + contentView.rcvCornerRadius); // offset the Y posistion so that the suggetion view does not try to draw past the rounded corners.
    for (NSDictionary *entry in _suggestions) {
        frame.origin.y += frame.size.height;

        NSViewController *viewController = [[NSViewController alloc] initWithNibName: self.itemPrototypeName bundle: nil];
        HighlightingView *view = (HighlightingView *) viewController.view;

        // Make the selectedView the samee as the 0th.
        if ([viewControllers count] == 0) {
            self.selectedView = view;
        }

        // Use the height of set in IB of the prototype view as the heigt for the suggestion view.
        frame.size.height = view.frame.size.height;
        view.frame = frame;
        [contentView addSubview: view];

        // don't forget to create the tracking are.
        NSTrackingArea *trackingArea = [self trackingAreaForView: view];
        [contentView addTrackingArea: trackingArea];

        // convert the suggestion enty to a mutable dictionary. This dictionary is bound to the view controller's representedObject. The represented object is what all the subviews are bound to in IB. We must use a mutable dictionary because we may change one of its key values.
        NSMutableDictionary *mutableEntry = [entry mutableCopy];
        [viewController setRepresentedObject: mutableEntry];

        [viewControllers addObject: viewController];
        [_trackingAreas addObject: trackingArea];

        /* If the suggestion entry does not contain an NSImage (and never does in this sample code), then create a thumbnail from the fileURL on a background que
        */


        if (![mutableEntry objectForKey: kSuggestionImage]) {
            NSString *imageURL = [mutableEntry objectForKey: kSuggestionImage];

            if (imageURL && ![imageURL isEqualToString: @""]) {

                // Load the image in an operation block so that the window pops up immediatly
                [ITESharedOperationQueue() addOperationWithBlock: ^(void) {
                    NSURL *fileURL = [mutableEntry objectForKey: kSuggestionImageURL];
                    if (fileURL) {

                        NSImage *thumbnailImage = [NSImage iteThumbnailImageWithContentsOfURL: fileURL width: THUMBNAIL_WIDTH];

                        if (thumbnailImage != nil) {
                            [[NSOperationQueue mainQueue] addOperationWithBlock: ^(void) {
                                [mutableEntry setObject: thumbnailImage forKey: kSuggestionImage];
                            }];
                        } else if (defaultImage) {
                            [mutableEntry setObject: defaultImage forKey: kSuggestionImage];
                        }
                    }
                }];
            }
        }

    }

    /* We have added all of the suggestion to the window. Now set the size of the window.
    */

    // Don't forget to account for the extra room needed the rounded corners.
    contentFrame.size.height = NSMaxY(frame) + (contentView.rcvCornerRadius + inset);

    NSRect winFrame = window.frame;
    winFrame.origin.y = NSMaxY(winFrame) - NSHeight(contentFrame);
    winFrame.size.height = NSHeight(contentFrame);
    [window setFrame: winFrame display: YES];
}

/* The mouse is now over one of our child image views. Update selection and send action.
*/
- (void) mouseEntered: (NSEvent *) event {
    HighlightingView *view = [(__bridge NSDictionary *) [event userData] objectForKey: kTrackerKey];
    [self userSetSelectedView: view];
}

/* The mouse has left one of our child image views. Set the selection to no selection and send action
*/
- (void) mouseExited: (NSEvent *) event {
    [self userSetSelectedView: nil];
}

/* The user released the mouse button. Force the parent text field to send its return action. Notice that there is no mouseDown: implementation. That is because the user may hold the mouse down and drag into another view.
*/
- (void) mouseUp: (NSEvent *) theEvent {
    [_parentTextField validateEditing];
    [_parentTextField abortEditing];
    [_parentTextField sendAction: [_parentTextField action] to: [_parentTextField target]];
    [self cancelSuggestions];
}

#pragma mark -
#pragma mark Keyboard Tracking

/* In addition to tracking the mouse, we want to allow changing our selection via the keyboard. However, the suggestion window never gets key focus as the key focus remains on te text field. Therefore we need to route move up and move down action commands from the text field and this controller. See CustomMenuAppDelegate.m -control:textView:doCommandBySelector: to see how that is done.
*/

/* move the selection up and send action.
*/
- (void) moveUp: (id) sender {
    NSView *selectedView = self.selectedView;
    NSView *previousView = nil;
    for (NSViewController *viewController in viewControllers) {
        NSView *view = viewController.view;
        if (view == selectedView) {
            break;
        }
        previousView = view;
    }

    if (previousView) {
        [self userSetSelectedView: previousView];
    }
}

/* move the selection down and send action.
*/
- (void) moveDown: (id) sender {
    NSView *selectedView = self.selectedView;
    NSView *previousView = nil;
    for (NSViewController *viewController in [viewControllers reverseObjectEnumerator]) {
        NSView *view = viewController.view;
        if (view == selectedView) {
            break;
        }
        previousView = view;
    }

    if (previousView) {
        [self userSetSelectedView: previousView];
    }
}


#pragma mark Utility getters

- (NSString *) itemPrototypeName {
    if (itemPrototypeName == nil) {
        itemPrototypeName = @"suggestionprototype";
    }
    return itemPrototypeName;
}

@end


NSString *kSuggestionImage = @"image";
NSString *kSuggestionImageURL = @"imageUrl";
NSString *kSuggestionLabel = @"label";
NSString *kSuggestionDetailedLabel = @"detailedLabel";

