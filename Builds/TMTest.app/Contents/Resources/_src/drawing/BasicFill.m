//
//  BasicFill.m
//  Carts
//
//  Created by Daniela Postigo on 10/3/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicFill.h"
#import "BasicGradient.h"

@implementation BasicFill {

}

@synthesize backgroundColor;
@synthesize gradient;

+ (id) fillWithColor: (NSColor *) color {
    return [[self alloc] initWithColor: color];
}

+ (id) fillWithGradient: (BasicGradient *) gradient {
    return [[self alloc] initWithGradient: gradient];
}


- (id) initWithColor: (NSColor *) aColor {
    self = [super init];
    if (self) {
        self.backgroundColor = aColor;
    }

    return self;
}

- (id) initWithGradient: (BasicGradient *) aGradient {
    self = [super init];
    if (self) {
        self.gradient = aGradient;
    }

    return self;
}

- (BOOL) isGradient {
    return self.gradient != nil;
}

- (BOOL) isColor {
    return self.gradient != nil;
}


- (void) drawWithPath: (NSBezierPath *) path {
    if (self.isGradient) {
        [self drawGradientWithPath: path];
    } else {
        [self drawColorWithPath: path];
    }

}

- (void) drawGradientWithPath: (NSBezierPath *) path {
    if ([self.gradient isKindOfClass: [BasicGradient class]]) {
        [self.gradient drawInBezierPath: path angle: self.gradient.angle];
    } else {
        [NSException raise: @"Invalid gradient" format: @"self.gradient of %@ is not a BasicGradient", self.gradient];
    }
}


- (void) drawColorWithPath: (NSBezierPath *) path {

    [NSGraphicsContext saveGraphicsState];
    [self.backgroundColor setFill];
    [path fill];
    [NSGraphicsContext restoreGraphicsState];

}

- (void) drawBorderWithPath: (NSBezierPath *) path borderWidth: (CGFloat) aWidth {
    [NSGraphicsContext saveGraphicsState];
    [self.backgroundColor setStroke];
    [path setLineWidth: aWidth];
    [path setLineCapStyle: NSRoundLineCapStyle];
    [path setLineJoinStyle: NSBevelLineJoinStyle];
    [path stroke];
    [NSGraphicsContext restoreGraphicsState];
}


@end