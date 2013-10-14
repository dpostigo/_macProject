//
// Created by dpostigo on 2/20/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicInnerShadowView.h"
#import "BasicCenteredGradient.h"
#import "BasicScalingGradient.h"

@implementation BasicInnerShadowView {
}

- (void) setup {
    [super setup];

    pathOptions.cornerRadius = 0.0;
    pathOptions.borderWidth = 0;
    pathOptions.borderColor = [NSColor clearColor];
    pathOptions.cornerType = CornerNone;
    pathOptions.backgroundColor = [NSColor colorWithDeviceWhite: 0.95 alpha: 1.0];

    pathOptions.innerShadow = [[NSShadow alloc] init];
    pathOptions.innerShadow.shadowColor = [NSColor colorWithWhite: 0.8];
    pathOptions.innerShadow.shadowBlurRadius = 3;

}



#pragma mark NSView overrides -

- (BOOL) wantsDefaultClipping {
    return NO;
}


- (BOOL) isOpaque {
    return NO;
}


#pragma mark Getters


- (BasicGradient *) horizontalShadowGradient {
    if (horizontalShadowGradient == nil) {
        self.horizontalShadowGradient = [[BasicGradient alloc] initWithBaseColor: [NSColor blackColor] centerColor: [NSColor clearColor]];
    }
    return horizontalShadowGradient;
}


- (BasicGradient *) verticalShadowGradient {
    if (verticalShadowGradient == nil) {
        self.verticalShadowGradient = [[BasicGradient alloc] initWithBaseColor: [NSColor blackColor] centerColor: [NSColor clearColor]];
    }
    return verticalShadowGradient;
}


#pragma mark Setters


- (void) setInnerShadowColor: (NSColor *) innerShadowColor1 {
    //    self.horizontalShadowGradient = [BasicGradient clearGradientWithBaseColor: innerShadowColor1];
    //    self.horizontalShadowGradient = [[BasicCenteredGradient alloc] initWithBaseColor: innerShadowColor1 centerColor: [NSColor clearColor] centerAmount: 0.8];
    self.horizontalShadowGradient = [[BasicScalingGradient alloc] initWithBaseColor: innerShadowColor1 centerColor: [NSColor clearColor] centerAmount: 0.9 baseLength: 5.0];
    self.verticalShadowGradient = [[BasicScalingGradient alloc] initWithBaseColor: innerShadowColor1 centerColor: [NSColor clearColor] centerAmount: 0.9 baseLength: 5.0];
}


- (void) setInnerShadowGradient: (BasicGradient *) innerShadowGradient1 {
    if (horizontalShadowGradient) [self removeGradient: horizontalShadowGradient];
    horizontalShadowGradient = innerShadowGradient1;
    [self addGradient: horizontalShadowGradient];
}


- (void) setHorizontalShadowGradient: (BasicGradient *) innerShadowGradient1 {
    if (horizontalShadowGradient) [self removeGradient: horizontalShadowGradient];
    horizontalShadowGradient = innerShadowGradient1;
    [self addGradient: horizontalShadowGradient];
}

- (void) setVerticalShadowGradient: (BasicGradient *) innerShadowGradient1 {
    innerShadowGradient1.isVertical = YES;
    if (verticalShadowGradient) [self removeGradient: verticalShadowGradient];
    verticalShadowGradient = innerShadowGradient1;
    [self addGradient: verticalShadowGradient];
}


@end