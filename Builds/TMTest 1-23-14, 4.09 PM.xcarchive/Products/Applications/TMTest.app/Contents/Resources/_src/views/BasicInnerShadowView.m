//
// Created by dpostigo on 2/20/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicInnerShadowView.h"
#import "BasicCenteredGradient.h"
#import "BasicDisplayView+SurrogateUtils.h"
#import "PathOptions+Utils.h"
#import "BasicShadow.h"

@implementation BasicInnerShadowView {
}

- (void) pathOptionsInit {
    [super pathOptionsInit];

    pathOptions.cornerRadius = 0.0;
    pathOptions.borderWidth = 0;
    pathOptions.borderColor = [NSColor clearColor];
    pathOptions.cornerType = CornerNone;
    pathOptions.backgroundColor = [NSColor colorWithDeviceWhite: 0.95 alpha: 1.0];

    self.innerShadow.shadowBlurRadius = 3;

}



#pragma mark NSView overrides -
//
//- (BOOL) wantsDefaultClipping {
//    return NO;
//}
//
//
//- (BOOL) isOpaque {
//    return NO;
//}


#pragma mark Getters


#pragma mark Setters


- (void) setInnerShadowColor: (NSColor *) innerShadowColor1 {
    self.innerShadow.shadowColor = innerShadowColor1;
}


@end