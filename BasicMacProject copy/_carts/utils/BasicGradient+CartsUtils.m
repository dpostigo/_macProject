//
//  BasicGradient+CartsUtils.m
//  Carts
//
//  Created by Daniela Postigo on 10/20/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicGradient+CartsUtils.h"
#import "NSColor+CartsUtils.h"
#import "NSColor+BlendingUtils.h"
#import "BasicGradient+DPUtils.h"

@implementation BasicGradient (CartsUtils)

+ (BasicGradient *) darkSlateGradient {
    return [BasicGradient gradientWithTopColor: [NSColor darkSlateHighlight] bottomColor: [NSColor darkSlateColor]];
}


+ (BasicGradient *) greyedSlateGradient {
    return [BasicGradient darkeningGradientWithColor: [NSColor desaturatedDarkSlateHighlight] percent: 0.9 darkAmount: 0.2];
}


@end