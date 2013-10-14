//
//  BasicGradient.m
//  Carts
//
//  Created by Daniela Postigo on 9/27/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicGradient.h"
#import "BasicCenteredGradient.h"

@implementation BasicGradient {

}

@synthesize colors;
@synthesize topColor;
@synthesize bottomColor;

@synthesize angle;
@synthesize isVertical;



#pragma mark Horizontal gradients -
#pragma mark White gradients

+ (BasicCenteredGradient *) whiteShineGradient {
    return [BasicCenteredGradient gradientWithBaseColor: [NSColor clearColor] centerColor: [NSColor whiteColor]];
    //    return [[self alloc] initWithBaseColors: [NSArray arrayWithObjects: [NSColor alphaWhite: 0.5], [NSColor alphaWhite: 0.1], nil] centerColor: [NSColor alphaWhite: 0.6]];
}

+ (BasicCenteredGradient *) whiteShineGradientWithBaseColor: (NSColor *) baseColor {
    return [BasicCenteredGradient gradientWithBaseColor: baseColor centerColor: [NSColor whiteColor]];
    //    return [[self alloc] initWithBaseColor: baseColor centerColor: [NSColor whiteColor]];
}


#pragma mark Clear gradients

+ (BasicCenteredGradient *) clearGradientWithBaseColor: (NSColor *) baseColor {
    return [BasicCenteredGradient gradientWithBaseColor: baseColor centerColor: [NSColor clearColor]];
    //    return [[self alloc] initWithBaseColors: [NSArray arrayWithObjects: [baseColor colorWithAlphaComponent: 0.1], baseColor, nil] centerColor: [NSColor clearColor]];
}


+ (BasicGradient *) gradientWithBaseColor: (NSColor *) baseColor centerColor: (NSColor *) centerColor {
    return [[self alloc] initWithBaseColor: baseColor centerColor: centerColor];
}



#pragma mark Vertical gradients

- (id) initWithTopColor: (NSColor *) aTopColor bottomColor: (NSColor *) aBottomColor {
    return [self initWithTopColor: aTopColor bottomColor: aBottomColor percent: 0.5];
}

- (id) initWithTopColor: (NSColor *) aTopColor bottomColor: (NSColor *) aBottomColor percent: (CGFloat) percentage {
    self = [super initWithColorsAndLocations: aBottomColor, (1.0 - percentage), aTopColor, 1.0, nil];
    if (self) {
        self.isVertical = YES;
    }
    return self;
}


- (id) initWithColors: (NSArray *) colorArray {
    self = [super initWithColors: colorArray];
    if (self) {
        self.colors = colorArray;
    }
    return self;
}


- (void) setIsVertical: (BOOL) isVertical1 {
    isVertical = isVertical1;
    if (isVertical) angle = 90;
    else angle = 0;
}


@end