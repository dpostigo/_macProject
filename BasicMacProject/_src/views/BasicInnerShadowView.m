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
    pathOptions.borderWidth = 0;
    pathOptions.borderColor = [NSColor clearColor];
    pathOptions.cornerOptions = CornerNone;
    pathOptions.backgroundColor = [NSColor colorWithDeviceWhite: 0.95 alpha: 1.0];

    pathOptions.innerShadow = [[NSShadow alloc] init];
    pathOptions.innerShadow.shadowColor = [NSColor colorWithWhite: 0.8];
    pathOptions.innerShadow.shadowBlurRadius = 3;
//    pathOptions.innerShadow.shadowOffset = NSMakeSize(10, 0);

}


- (BOOL) wantsDefaultClipping {
    return NO;
}


- (BOOL) isOpaque {
    return NO;
}


@end