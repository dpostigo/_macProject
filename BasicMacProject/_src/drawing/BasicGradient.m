//
//  BasicGradient.m
//  Carts
//
//  Created by Daniela Postigo on 9/27/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicGradient.h"

@implementation BasicGradient {

}

@synthesize colors;
@synthesize topColor;
@synthesize bottomColor;

@synthesize angle;
@synthesize isVertical;



#pragma mark Horizontal gradients

+ (BasicGradient *) whiteShineGradient {
    return [[self alloc] initWithBaseColors: [NSArray arrayWithObjects: [NSColor alphaWhite: 0.5], [NSColor alphaWhite: 0.0], nil] centerColor: [NSColor whiteColor]];

    //    return [BasicGradient whiteShineGradientWithBaseColor: [NSColor colorWithDeviceWhite: 1.0 alpha: 0.5]];
    //    return [[self alloc] initWithBaseColor: [NSColor colorWithDeviceWhite: 1.0 alpha: 0.0] centerColor: [NSColor whiteColor]];
}

+ (BasicGradient *) whiteShineGradientWithBaseColor: (NSColor *) baseColor {
    return [[self alloc] initWithBaseColor: baseColor centerColor: [NSColor whiteColor]];
}

- (id) initWithBaseColor: (NSColor *) baseColor centerColor: (NSColor *) centerColor {
    return [self initWithBaseColors: [NSArray arrayWithObject: baseColor] centerColor: centerColor];
}

- (id) initWithBaseColors: (NSArray *) baseColors centerColor: (NSColor *) centerColor {
    NSMutableArray *colorArray = [[NSMutableArray alloc] initWithObjects: centerColor, nil];
    for (NSColor *baseColor in baseColors) {
        [colorArray insertObject: baseColor atIndex: 0];
        [colorArray addObject: baseColor];
    }
    return [self initWithColors: colorArray];
}


#pragma mark Vertical gradients

- (id) initWithTopColor: (NSColor *) aTopColor bottomColor: (NSColor *) aBottomColor {
    return [self initWithTopColor: aTopColor bottomColor: aBottomColor percent: 0.5];
}

- (id) initWithTopColor: (NSColor *) aTopColor bottomColor: (NSColor *) aBottomColor percent: (CGFloat) percentage {
    self = [super initWithColorsAndLocations: aBottomColor, (1.0 - percentage), aTopColor, 1.0, nil];
    if (self) {
        self.topColor = aTopColor;
        self.bottomColor = aBottomColor;
    }
    return self;
}

- (id) initWithColors: (NSArray *) colorArray {
    self = [super initWithColors: colorArray];
    if (self) {
        self.colors = colorArray;
        self.topColor = [colorArray lastObject];
        self.bottomColor = [colorArray objectAtIndex: 0];
    }

    return self;
}


- (void) setIsVertical: (BOOL) isVertical1 {
    isVertical = isVertical1;
    if (isVertical) angle = 90;
    else angle = 0;
}


@end