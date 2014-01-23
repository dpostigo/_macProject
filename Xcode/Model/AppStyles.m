//
// Created by Dani Postigo on 1/22/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <NSColor-Crayola/NSColor+Crayola.h>
#import <QuartzCore/QuartzCore.h>
#import "AppStyles.h"
#import "NSColor+NewUtils.h"
#import "LayerDelegate.h"
#import "CALayer+ConstraintUtils.h"

@implementation AppStyles

+ (NSShadow *) defaultShadow {
    return [AppStyles defaultShadowWithRadius: 2.0];
}




+ (NSShadow *) defaultShadowWithRadius: (CGFloat) radius {
    return [AppStyles defaultShadowWithRadius: radius offset: NSMakeSize(0, -1)];
}

+ (NSShadow *) defaultShadowWithRadius: (CGFloat) radius offset: (NSSize) offset {
    NSShadow *dropShadow = [[NSShadow alloc] init];
    dropShadow.shadowColor = [NSColor crayolaMummysTombColor];
    dropShadow.shadowOffset = offset;
    dropShadow.shadowBlurRadius = radius;
    return dropShadow;
}

+ (CAGradientLayer *) defaultGradientLayer {
    CAGradientLayer *gradient;
    gradient = [CAGradientLayer layer];
    gradient.name = @"gradient";
    gradient.colors = @[
            (__bridge id) [[NSColor crayolaMummysTombColor] mix: [NSColor whiteColor] fraction: 0.9].CGColor,
            (__bridge id) [NSColor whiteColor].CGColor,
            (__bridge id) [NSColor whiteColor].CGColor];

    gradient.delegate = [LayerDelegate sharedDelegate];
    gradient.masksToBounds = YES;
    return gradient;
}

+ (void) addDefaultGradient: (CALayer *) layer {
    CAGradientLayer *gradient = [self defaultGradientLayer];
    [layer makeSuperlayer];
    [layer addSublayer: gradient];
    [gradient superConstrain];
}
@end