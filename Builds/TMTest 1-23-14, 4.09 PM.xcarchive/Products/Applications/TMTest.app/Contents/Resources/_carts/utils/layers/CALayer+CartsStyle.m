//
// Created by Dani Postigo on 12/29/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CALayer+CartsStyle.h"
#import "NSColor+CartsUtils.h"
#import "CALayer+ConstraintUtils.h"

@implementation CALayer (CartsStyle)

- (void) applySlateStyle {
    self.backgroundColor = [NSColor darkSlateColor].CGColor;
    self.borderColor = [NSColor blackColor].CGColor;
    self.borderWidth = 0.5;
    self.cornerRadius = 5;
}

- (CALayer *) applyInnerSlateStyle {
    CALayer *ret = nil;
    [self makeSuperlayer];
    ret = self.innerSlateLayer;
    [self addSublayer: ret];
    return ret;
}


- (CALayer *) innerSlateLayer {
    CALayer *ret = [CALayer new];
    ret.name = @"innerLayer";
    ret.borderColor = [NSColor colorWithWhite: 1.0 alpha: 0.5].CGColor;
    ret.borderWidth = 0.5;
    ret.cornerRadius = self.cornerRadius;
    ret.delegate = self;

    CGFloat inset = self.borderWidth * 2;
    inset = 0.5;
    [ret superConstrain: kCAConstraintMinX offset: inset];
    [ret superConstrain: kCAConstraintMaxX offset: -inset * 2];
//    [ret superConstrain: kCAConstraintMidX offset: 0];
//    [ret superConstrain: kCAConstraintWidth offset: -1];
    [ret superConstrain: kCAConstraintMinY offset: inset];
    [ret superConstrain: kCAConstraintMaxY offset: -inset * 2];
//    [ret superConstrain: kCAConstraintHeight offset: -1];
//    [ret superConstrain: kCAConstraintMidY offset: 0];

    return ret;
}
@end