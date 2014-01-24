#import "HighlightingView.h"

@implementation HighlightingView

@synthesize highlighted = _highlighted;

// Draw with or without a highlight style
- (void) drawRect: (NSRect) dirtyRect {
    if (self.highlighted) {
        [[NSColor alternateSelectedControlColor] set];
        NSRectFillUsingOperation(dirtyRect, NSCompositeSourceOver);
    } else {
        [[NSColor clearColor] set];
        NSRectFillUsingOperation(dirtyRect, NSCompositeSourceOver);
    }
}

/* Custom highlighted property setter because when the property changes we need to redraw and update the containing text fields.
*/
- (void) setHighlighted: (BOOL) highlighted {
    if (self.highlighted != highlighted) {
        _highlighted = highlighted;

        // Inform each contained text field what type of background they will be displayed on. This is how the txt field knows when to draw white text instead of black text.
        for (NSView *subview in [self subviews]) {
            if ([subview isKindOfClass: [NSTextField class]]) {
                [[(NSTextField *) subview cell] setBackgroundStyle: highlighted ? NSBackgroundStyleDark : NSBackgroundStyleLight];
            }
        }

        [self setNeedsDisplay: YES]; // make sure we redraw with the correct highlight style.
    }
}

#pragma mark -
#pragma mark Accessibility

/* This view groups the contents of one suggestion.  It should be exposed to accessibility, and should report itself with the role 'AXGroup'.  Because this is an NSView subclass, most of the basic accessibility behavior (accessibility parent, children, size, position, window, and more) is inherited from NSView.  Note that even the role description attribute will update accordingly and its behavior does not need to be overridden.
*/


// Make sure we are reported by accessibility.  NSView's default return value is YES.
- (BOOL) accessibilityIsIgnored {
    return NO;
}

// When asked for the value of our role attribute, return the group role.  For other attributes, use the inherited behavior of NSView.
- (id) accessibilityAttributeValue: (NSString *) attribute {
    id attributeValue;

    if ([attribute isEqualToString: NSAccessibilityRoleAttribute]) {
        attributeValue = NSAccessibilityGroupRole;
    } else {
        attributeValue = [super accessibilityAttributeValue: attribute];
    }

    return attributeValue;
}

@end

