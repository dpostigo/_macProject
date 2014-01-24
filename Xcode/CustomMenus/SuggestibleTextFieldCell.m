
#import "SuggestibleTextFieldCell.h"

@implementation SuggestibleTextFieldCell

@synthesize suggestionsWindow = _suggestionsWindow;

/* Force NSTextFieldCell to use white as the text color when drawing on a dark background. NSTextField does this by default when the text color is set to black. In the suggestionsprototype.xib, there is an NSTextField that has a blueish text color. In IB we set the cell of that text field to this class to get the drawing behavior we want.
*/
- (void) drawWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    NSColor *textColor = [self textColor];
    if ([self backgroundStyle] == NSBackgroundStyleDark) {
        [self setTextColor: [NSColor whiteColor]];
    }

    [super drawWithFrame: cellFrame inView: controlView];

    [self setTextColor: textColor];
}

#pragma mark -
#pragma mark Accessibility

/* The search text field in the MainMenu.xib has the class for its cell set to this class so that it will report the suggestions window as one of its accessibility children when the suggestions window is present.
*/
- (id) accessibilityAttributeValue: (NSString *) attribute {
    id attributeValue;

    if ([attribute isEqualToString: NSAccessibilityChildrenAttribute] && _suggestionsWindow) {
        attributeValue = [[super accessibilityAttributeValue: NSAccessibilityChildrenAttribute] arrayByAddingObject: NSAccessibilityUnignoredDescendant(_suggestionsWindow)];
    } else {
        attributeValue = [super accessibilityAttributeValue: attribute];
    }

    return attributeValue;
}

@end