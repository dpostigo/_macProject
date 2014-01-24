//
//  BasicShadow+Utils.m
//  Carts
//
//  Created by Daniela Postigo on 11/16/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicShadow+Utils.h"

@implementation BasicShadow (Utils)

+ (BasicShadow *) basicShadowFromShadow: (NSShadow *) shadow {
    BasicShadow *ret = nil;
    if ([shadow isKindOfClass: [BasicShadow class]]) {
        ret = (BasicShadow *) shadow;

    } else {
        ret = [[BasicShadow alloc] init];
        ret.shadowColor = shadow.shadowColor;
        ret.shadowBlurRadius = shadow.shadowBlurRadius;
        ret.shadowOffset = shadow.shadowOffset;
    }
    return ret;
}

- (NSString *) shadowTypeAsString {
    NSString *ret = nil;


    if (self.shadowType == ShadowTypeOuter) {
        ret = @"ShadowTypeOuter";
    } else if (self.shadowType == ShadowTypeInner) {
        ret = @"ShadowTypeInner";
    } else {
        NSLog(@"No shadow type.");
    }

    return ret;

}


@end