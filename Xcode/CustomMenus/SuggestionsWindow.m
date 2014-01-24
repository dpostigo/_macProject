#import "SuggestionsWindow.h"

@implementation SuggestionsWindow

@synthesize parentElement = _parentElement;

/* Convience initializer that removes the syleMask and backing parameters since they are static values for this class.
*/
- (id) initWithContentRect: (NSRect) contentRect defer: (BOOL) flag {
    return [self initWithContentRect: contentRect styleMask: NSBorderlessWindowMask backing: NSBackingStoreBuffered defer: YES];
}

/*  We still need to override the NSWindow designated initializer to properly setup our custom window. This allows us to set the class of a window in IB to SuggestionWindow and still get the correct properties (borderless and transparent).
*/
- (id) initWithContentRect: (NSRect) contentRect styleMask: (NSUInteger) aStyle backing: (NSBackingStoreType) bufferingType defer: (BOOL) flag {
    // Regardless of what is passed via the styleMask paramenter, always create a NSBorderlessWindowMask window
    self = [super initWithContentRect: contentRect styleMask: NSBorderlessWindowMask backing: bufferingType defer: flag];
    if (self) {
        // This window is always has a shadow and is transparent. Force those setting here.

        [self setHasShadow: NO];
        [self setBackgroundColor: [NSColor clearColor]];
        [self setOpaque: NO];
    }
    return self;
}




#pragma mark -
#pragma mark Accessibility

/* This window is acting as a popup menu of sorts.  Since this isn't semantically a window, we ignore it for accessibility purposes.  Similarly, the parent of this window is its logical parent in the parent window.  In this code sample, the text field, but essentially any UI element that is the logical 'parent' of the window. 
*/
- (BOOL) accessibilityIsIgnored {
    return YES;
}

/* If we are asked for our AXParent, return the unignored anscestor of our parent element
*/
- (id) accessibilityAttributeValue: (NSString *) attribute {
    id attributeValue;

    if ([attribute isEqualToString: NSAccessibilityParentAttribute]) {
        attributeValue = NSAccessibilityUnignoredAncestor(_parentElement);
    } else {
        attributeValue = [super accessibilityAttributeValue: attribute];
    }

    return attributeValue;
}

@end
