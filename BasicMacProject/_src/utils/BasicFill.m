//
//  BasicFill.m
//  Carts
//
//  Created by Daniela Postigo on 10/3/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicFill.h"

@implementation BasicFill {

}

@synthesize color;
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
        self.color = aColor;
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




@end