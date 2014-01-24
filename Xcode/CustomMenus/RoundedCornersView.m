#import "RoundedCornersView.h"
#import "AppStyles.h"

@implementation RoundedCornersView

@synthesize rcvCornerRadius = _cornerRadius;

- (id) initWithFrame: (NSRect) frame {
    self = [super initWithFrame: frame];
    if (self) {
        self.rcvCornerRadius = 3.0f;

        self.wantsLayer = YES;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = self.rcvCornerRadius;
        self.shadow = [AppStyles defaultShadowWithRadius: 2.0 offset: NSMakeSize(0, 1)];
    }
    return self;
}

- (void) drawRect: (NSRect) dirtyRect {

    CGFloat inset = self.shadow.shadowBlurRadius + 3;
    NSRect bounds = NSInsetRect(self.bounds, inset, inset);
    CGFloat cornerRadius = self.rcvCornerRadius;
    NSBezierPath *borderPath = [NSBezierPath bezierPathWithRoundedRect: bounds xRadius: cornerRadius yRadius: cornerRadius];

    //    [[AppStyles defaultShadow] set];
    [[NSColor colorWithWhite: 0.97 alpha: 1.0] setFill];
    [borderPath fill];
}


- (BOOL) isFlipped {
    return YES;
}



#pragma mark -
#pragma mark Accessibility

/* This view contains the list of selections.  It should be exposed to accessibility, and should report itself with the role 'AXList'.  Because this is an NSView subclass, most of the basic accessibility behavior (accessibility parent, children, size, position, window, and more) is inherited from NSView.  Note that even the role description attribute will update accordingly and its behavior does not need to be overridden.  However, since the role AXList has a number of additional required attributes, we need to declare them and implement them.
*/


/* Make sure we are reported by accessibility.  NSView's default return value is YES.
*/
- (BOOL) accessibilityIsIgnored {
    return NO;
}

/* The suggestions will be an AXList of suggestions.  AXList requires additional attributes beyond what NSView provides.
*/
- (NSArray *) accessibilityAttributeNames {
    NSMutableArray *attributeNames = [NSMutableArray arrayWithArray: [super accessibilityAttributeNames]];
    [attributeNames addObject: NSAccessibilityOrientationAttribute];
    [attributeNames addObject: NSAccessibilityEnabledAttribute];
    [attributeNames addObject: NSAccessibilityVisibleChildrenAttribute];
    [attributeNames addObject: NSAccessibilitySelectedChildrenAttribute];
    return attributeNames;
}


/* Return a different value for the role attribute, and the values for the additional attributes declared above.
*/
- (id) accessibilityAttributeValue: (NSString *) attribute {
    // Report our role as AXList
    if ([attribute isEqualToString: NSAccessibilityRoleAttribute]) {
        return NSAccessibilityListRole;

        // Our orientation is vertical
    } else if ([attribute isEqualToString: NSAccessibilityOrientationAttribute]) {
        return NSAccessibilityVerticalOrientationValue;

        // The list is always enabled
    } else if ([attribute isEqualToString: NSAccessibilityEnabledAttribute]) {
        return [NSNumber numberWithBool: YES];

        // There is no scroll bar in this example - all children are always visible
    } else if ([attribute isEqualToString: NSAccessibilityVisibleChildrenAttribute]) {
        return [self accessibilityAttributeValue: NSAccessibilityChildrenAttribute];

        // Run through children, and if they respond to 'isHighlighted' put them in the list
    } else if ([attribute isEqualToString: NSAccessibilitySelectedChildrenAttribute]) {
        NSMutableArray *selectedChildren = [NSMutableArray array];
        for (id element in [self accessibilityAttributeValue: NSAccessibilityChildrenAttribute]) {
            if ([element respondsToSelector: @selector(isHighlighted)] && [element isHighlighted]) {
                [selectedChildren addObject: element];
            }
        }
        return selectedChildren;

        // Otherwise, return what super returns
    } else {
        return [super accessibilityAttributeValue: attribute];
    }
}

/* In addition to reporting the value for an attribute, we need to return whether value of the attribute can be set.
*/
- (BOOL) accessibilityIsAttributeSettable: (NSString *) attribute {

    // Three of the four attributes we added are not settable
    if ([attribute isEqualToString: NSAccessibilityOrientationAttribute] || [attribute isEqualToString: NSAccessibilityEnabledAttribute] || [attribute isEqualToString: NSAccessibilityVisibleChildrenAttribute] || [attribute isEqualToString: NSAccessibilitySelectedChildrenAttribute]) {
        return NO;
    }

            // Accessibility clients like VoiceOver can set the selected suggestion, so return YES
    else if ([attribute isEqualToString: NSAccessibilitySelectedChildrenAttribute]) {
        return YES;

        // Otherwise, return what super returns
    } else {
        return [super accessibilityIsAttributeSettable: attribute];
    }
}

- (void) accessibilitySetValue: (id) value forAttribute: (NSString *) attribute {
    if ([attribute isEqualToString: NSAccessibilitySelectedChildrenAttribute]) {
        NSWindowController *windowController = [[self window] windowController];
        if (windowController) {
            // Our subclass of NSWindowController has a selectedView property
            [windowController setValue: value forKey: @"selectedView"];
        }
    } else {
        [super accessibilitySetValue: value forAttribute: attribute];
    }
}

@end
