//
// Created by Dani Postigo on 12/28/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSColor+NewUtils.h"

@implementation NSColor (NewUtils)

+ (NSColor *) blackColorWithAlpha: (CGFloat) alpha {
    return [[NSColor blackColor] colorWithAlphaComponent: alpha];
}



- (NSColor *) mix: (NSColor *) color fraction: (CGFloat) fraction {
    return [self blendedColorWithFraction: fraction ofColor: color];
}


@end