//
//  NSColor+CartsUtils.m
//  Carts
//
//  Created by Daniela Postigo on 10/20/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSColor+CartsUtils.h"
#import "BasicGradient.h"
#import "NSColor+DPUtils.h"

@implementation NSColor (CartsUtils)

+ (NSColor *) darkSlateColor {
    return [NSColor colorWithString: DARK_SLATE];
}


+ (NSColor *) darkSlateHighlight {
    return [NSColor colorWithString: SLATE_HIGHLIGHT];
}


+ (NSColor *) desaturatedDarkSlateColor {
    return [[NSColor colorWithString: DARK_SLATE] desaturate: 0.5];
}

+ (NSColor *) desaturatedDarkSlateHighlight {
    return [[NSColor colorWithString: SLATE_HIGHLIGHT] desaturate: 0.5];
}


@end