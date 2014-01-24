//
//  BasicHorizontalGradient.m
//  Carts
//
//  Created by Daniela Postigo on 10/12/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicHorizontalGradient.h"

@implementation BasicHorizontalGradient {

}

- (id) initWithLeftColor: (NSColor *) aLeftColor rightColor: (NSColor *) aRightColor {
    return [self initWithLeftColor: aLeftColor rightColor: aRightColor percent: 0.5];
}

- (id) initWithLeftColor: (NSColor *) aLeftColor rightColor: (NSColor *) aRightColor percent: (CGFloat) percentage {
    self = [super initWithColorsAndLocations: aRightColor, (1.0 - percentage), aLeftColor, 1.0, nil];
    if (self) {
        self.isVertical = YES;
    }
    return self;
}

@end