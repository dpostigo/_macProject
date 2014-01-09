//
//  BasicDisplayView+SurrogateUtils.m
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicDisplayView+SurrogateUtils.h"

@implementation BasicDisplayView (SurrogateUtils)

@dynamic backgroundColor;
@dynamic borderColor;
@dynamic borderType;
@dynamic borderWidth;
@dynamic borders;
@dynamic cornerType;
@dynamic cornerRadius;
@dynamic fills;
@dynamic gradient;
@dynamic innerShadow;
@dynamic outerShadow;

@dynamic basicOuterShadow;
@dynamic basicInnerShadow;

#pragma mark SurrogateUtils



- (NSArray *) surrogates {
    return [NSArray arrayWithObjects: self.pathOptions, nil];
}

- (id) forwardingTargetForSelector: (SEL) aSelector {
    id ret = nil;
    for (int j = 0; j < [self.surrogates count]; j++) {
        id surrogate = [self.surrogates objectAtIndex: j];
        NSMethodSignature *signature = [surrogate methodSignatureForSelector: aSelector];

        if (signature) {
            ret = surrogate;
            break;
        }
    }
    return ret == nil ? [super forwardingTargetForSelector: aSelector] : ret;
}

- (NSMethodSignature *) methodSignatureForSelector: (SEL) selector {
    NSMethodSignature *signature = [super methodSignatureForSelector: selector];
    if (!signature) {

        for (int j = 0; j < [self.surrogates count]; j++) {
            id surrogate = [self.surrogates objectAtIndex: j];
            signature = [surrogate methodSignatureForSelector: selector];

            if (signature) {
                break;
            }
        }
    }
    return signature;
}

@end