//
//  ColorManager.m
//  Carts
//
//  Created by Daniela Postigo on 7/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "ColorManager.h"


@implementation ColorManager {

}




+ (NSGradient *) blackGradient {
    return [[NSGradient alloc] initWithColorsAndLocations: [NSColor colorWithWhite: 0.3], 0.0,
                                                           [NSColor colorWithWhite: 0.2], 0.1,
                                                           [NSColor colorWithWhite: 0.2], 0.9,
                                                           [NSColor colorWithWhite: 0.3], 1.0,
                                                           nil];
}


@end