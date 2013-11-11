//
//  NSColor+DPUtils.m
//  Carts
//
//  Created by Daniela Postigo on 10/20/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSColor+DPUtils.h"

@implementation NSColor (DPUtils)

+ (NSColor *) darken: (NSColor *) aColor amount: (CGFloat) amount {
    return [aColor darken: amount];
}

+ (NSColor *) desaturate: (NSColor *) aColor amount: (CGFloat) amount {
    return [aColor desaturate: amount];
}

+ (NSColor *) fade: (NSColor *) aColor amount: (CGFloat) amount {
    return [aColor fade: amount];
}

+ (NSColor *) lighten: (NSColor *) aColor amount: (CGFloat) amount {
    return [aColor lighten: amount];
}


- (NSColor *) lighten: (CGFloat) percent {
    return [self blendedColorWithFraction: percent ofColor: [NSColor whiteColor]];
}

- (NSColor *) darken: (CGFloat) percent {
    return [self blendedColorWithFraction: percent ofColor: [NSColor blackColor]];
}

- (NSColor *) desaturate: (CGFloat) percent {
    return [self blendedColorWithFraction: percent ofColor: [NSColor darkGrayColor]];
}

- (NSColor *) fade: (CGFloat) percent {
    return [self blendedColorWithFraction: percent ofColor: [NSColor clearColor]];
}


@end