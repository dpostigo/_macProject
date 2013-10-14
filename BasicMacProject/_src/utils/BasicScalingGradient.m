//
//  BasicScalingGradient.m
//  Carts
//
//  Created by Daniela Postigo on 10/13/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicScalingGradient.h"

@implementation BasicScalingGradient {

}

@synthesize baseLength;

- (id) initWithBaseColor: (NSColor *) aBaseColor centerColor: (NSColor *) aCenterColor centerAmount: (CGFloat) aCenterAmount baseLength: (CGFloat) aBaseLength {
    self = [super initWithBaseColor: aBaseColor centerColor: aCenterColor centerAmount: aCenterAmount];
    if (self) {
        self.baseLength = aBaseLength;

    }

    return self;
}


- (void) drawInBezierPath: (NSBezierPath *) path angle: (CGFloat) angle1 {

    CGFloat length = self.isVertical ? path.bounds.size.height : path.bounds.size.width;
    CGFloat basePercentage = (self.baseLength * 2) / length;

    CGFloat newCenterAmount = 1.0 - basePercentage;

    //    basePercentage = basePercentage * 2;

    BasicCenteredGradient *newGradient = [[BasicCenteredGradient alloc] initWithBaseColor: [self.baseColor colorWithAlphaComponent: 0.1] centerColor: self.centerColor centerAmount: newCenterAmount];
    [newGradient drawInBezierPath: path angle: self.angle];
}

@end