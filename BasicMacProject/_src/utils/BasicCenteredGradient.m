//
//  BasicCenteredGradient.m
//  Carts
//
//  Created by Daniela Postigo on 10/12/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicCenteredGradient.h"

@implementation BasicCenteredGradient {

}

@synthesize baseColor;
@synthesize centerColor;

+ (id) gradientWithBaseColor: (NSColor *) baseColor centerColor: (NSColor *) aCenterColor {
    return [[self alloc] initWithBaseColor: baseColor centerColor: aCenterColor];
}

- (id) initWithBaseColor: (NSColor *) aBaseColor centerColor: (NSColor *) aCenterColor {
    return [self initWithBaseColors: [NSArray arrayWithObject: aBaseColor] centerColor: aCenterColor];
}

- (id) initWithBaseColors: (NSArray *) baseColors centerColor: (NSColor *) aCenterColor {
    NSMutableArray *colorArray = [[NSMutableArray alloc] initWithObjects: aCenterColor, nil];
    for (NSColor *aColor in baseColors) {
        [colorArray insertObject: aColor atIndex: 0];
        [colorArray addObject: aColor];
    }
    return [self initWithColors: colorArray];
}

//
//
//- (id) initWithBaseColor: (NSColor *) aBaseColor centerColor: (NSColor *) aCenterColor {
//    return [self initWithBaseColor: aBaseColor centerColor: aCenterColor centerAmount: 0.5];
//}
//
//
//- (id) initWithBaseColor: (NSColor *) aBaseColor centerColor: (NSColor *) aCenterColor centerAmount: (CGFloat) aCenterAmount {
//
//    CGFloat firstCenterAmount = 1.0 - aCenterAmount;
//
//    NSMutableArray *colorArray = [[NSMutableArray alloc] init];
//    [colorArray addObject: aBaseColor];
//    [colorArray addObject: [aBaseColor blendedColorWithFraction: 0.5 ofColor: aCenterColor]];
//    [colorArray addObject: [aBaseColor blendedColorWithFraction: 0.5 ofColor: aCenterColor]];
//    [colorArray insertObject: [baseColor color] atIndex: <#(NSUInteger)index#>];
//    for (NSColor *aBaseColor in baseColors) {
//        [colorArray insertObject: aBaseColor atIndex: 0];
//        [colorArray addObject: aBaseColor];
//    }
//
//
//    const int count = [baseColors count];
//    CGFloat locations[count] = {};
//    for (int j = 0; j < count; j++) {
//        NSColor *aColor = [baseColors objectAtIndex: j];
//        locations[j] = aColor == aCenterColor ? firstCenterAmount : (firstCenterAmount * 0.5 * j);
//
//    }
//
//
//    self = [super initWithColorsAndLocations: aBaseColor, 0.0, aCenterColor, firstCenterAmount, aCenterColor, aCenterAmount, aBaseColor, 1.0, nil];
//    if (self) {
//        self.isVertical = NO;
//        self.baseColor = aBaseColor;
//        self.centerColor = aCenterColor;
//    }
//    return self;
//}
//
////- (id) initWithBaseColors: (NSArray *) baseColors centerColor: (NSColor *) aCenterColor centerAmount: (CGFloat) aCenterAmount {
////
////    self = [super initWithColors: colorArray atLocations: locations colorSpace: [NSColorSpace genericRGBColorSpace]];
////    if (self) {
////        self.isVertical = NO;
////        self.baseColor = aBaseColor;
////        self.centerColor = aCenterColor;
////    }
////    return self;
////}
//
//
//- (id) initWithBaseColors: (NSArray *) baseColors centerColor: (NSColor *) aCenterColor {
//    NSMutableArray *colorArray = [[NSMutableArray alloc] initWithObjects: aCenterColor, nil];
//    for (NSColor *aBaseColor in baseColors) {
//        [colorArray insertObject: aBaseColor atIndex: 0];
//        [colorArray addObject: aBaseColor];
//    }
//    return [self initWithColors: colorArray];
//}
//

@end