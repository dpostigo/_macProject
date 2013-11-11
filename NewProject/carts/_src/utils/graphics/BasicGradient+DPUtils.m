//
//  BasicGradient+DPUtils.m
//  Carts
//
//  Created by Daniela Postigo on 10/20/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicGradient+DPUtils.h"
#import "NSColor+DPUtils.h"

@implementation BasicGradient (DPUtils)

+ (BasicGradient *) darkeningGradientWithColor: (NSColor *) aColor percent: (CGFloat) percentage {
    return [BasicGradient darkeningGradientWithColor: aColor percent: percentage darkAmount: 0.5];
}

+ (BasicGradient *) darkeningGradientWithColor: (NSColor *) aColor percent: (CGFloat) percentage darkAmount: (CGFloat) amount {
    return [BasicGradient gradientWithTopColor: aColor bottomColor: [aColor darken: amount] percent: percentage];
}


@end