//
// Created by dpostigo on 2/20/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicInnerShadowView.h"


@implementation BasicInnerShadowView {
}


- (void) setup {
    [super setup];
    pathOptions.cornerRadius = 0.0;
    pathOptions.borderWidth = 0.5;
    pathOptions.borderColor = [NSColor clearColor];
    pathOptions.cornerOptions = NSBezierPathLowerLeft | NSBezierPathLowerRight | NSBezierPathUpperRight | NSBezierPathUpperLeft;
    pathOptions.backgroundColor = [NSColor colorWithDeviceWhite: 0.9 alpha: 1.0];

    pathOptions.innerShadow = [[NSShadow alloc] init];
    pathOptions.innerShadow.shadowColor = [NSColor clearColor];
    pathOptions.innerShadow.shadowBlurRadius = 3;
}

- (BOOL) isOpaque {
    return NO;
}


@end