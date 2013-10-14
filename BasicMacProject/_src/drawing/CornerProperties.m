//
//  CornerProperties.m
//  Carts
//
//  Created by Daniela Postigo on 9/30/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CornerProperties.h"

@implementation CornerProperties {

}

@synthesize type;
@synthesize cornerRadius;

- (id) init {
    self = [super init];
    if (self) {
        self.type = CornerNone;
    }

    return self;
}

- (void) setCornerRadius: (CGFloat) cornerRadius1 {
    cornerRadius = cornerRadius1;
    if (cornerRadius > 0) self.type = CornerUpperLeft | CornerUpperRight | CornerLowerLeft | CornerLowerRight;
}

- (void) setType: (CornerType) type1 {
    type = type1;
    if (type & CornerNone) self.cornerRadius = 0;
}


@end