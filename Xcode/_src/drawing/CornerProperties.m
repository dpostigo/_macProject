//
//  CornerProperties.m
//  Carts
//
//  Created by Daniela Postigo on 9/30/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CornerProperties.h"
#import "NSBezierPath+Additions.h"
#import "CornerProperties+Utils.h"

@implementation CornerProperties {

}

@synthesize cornerType;
@synthesize cornerRadius;

- (id) init {
    self = [super init];
    if (self) {
        self.cornerType = CornerNone;
    }

    return self;
}

- (void) setCornerRadius: (CGFloat) cornerRadius1 {
    cornerRadius = cornerRadius1;
    if (cornerRadius > 0) self.type = CornerUpperLeft | CornerUpperRight | CornerLowerLeft | CornerLowerRight;
}

- (void) setType: (CornerType) type1 {
    cornerType = type1;
    if (cornerType & CornerNone) self.cornerRadius = 0;
}


@end