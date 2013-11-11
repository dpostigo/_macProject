//
// Created by Daniela Postigo on 5/19/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BOIconButtonCell.h"
#import "NSColor+Utils.h"

@implementation BOIconButtonCell {
}

- (void) setup {

    self.gradient = [[NSGradient alloc] initWithColorsAndLocations:
            [NSColor colorWithDeviceWhite: 0.85 alpha: 1.0f], 0.0,
            [NSColor colorWithDeviceWhite: 0.90 alpha: 1.0f], 0.2,
            [NSColor colorWithDeviceWhite: 0.93 alpha: 1.0f], 0.5,
            [NSColor colorWithDeviceWhite: 0.94 alpha: 1.0f], 0.7,
            [NSColor colorWithDeviceWhite: 0.95 alpha: 1.0f], 1.0,
            nil];

    self.cornerRadius = 2.0;
    self.highlightedColor = [NSColor colorWithString: GOLD_COLOR];
    self.borderColor = [NSColor lightGrayColor];
    self.innerStrokeColor = [NSColor whiteColor];
    imageOptions.imageColor = [NSColor darkGrayColor];
    imageOptions.imageShadowColor = [NSColor whiteColor];

    [self setButtonType: NSMomentaryPushButton];
    self.bezelStyle = NSSmallSquareBezelStyle;
}
@end