//
//  SurrogateObject.m
//  Carts
//
//  Created by Daniela Postigo on 10/23/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "SurrogateObject.h"

@implementation SurrogateObject {

}

@synthesize surrogates;

@synthesize name;

- (id) init {
    self = [super init];
    if (self) {
        [self objectInit];
    }

    return self;
}

- (void) objectInit {
    surrogates = [[NSMutableArray alloc] init];
}


- (id) forwardingTargetForSelector: (SEL) aSelector {

    id ret = nil;

    for (int j = 0; j < [surrogates count]; j++) {
        id surrogate = [surrogates objectAtIndex: j];
        NSMethodSignature *signature = [surrogate methodSignatureForSelector: aSelector];

        if (signature) {
            ret = surrogate;
            //            NSLog(@"[pathOptions %@] = [%@ %@]", NSStringFromSelector(aSelector), NSStringFromClass([ret class]), NSStringFromSelector(aSelector));
            break;
        }
    }

    return ret == nil ? [super forwardingTargetForSelector: aSelector] : ret;
}

- (NSMethodSignature *) methodSignatureForSelector: (SEL) selector {
    //    NSLog(@"%s, %@", __PRETTY_FUNCTION__, NSStringFromSelector(selector));

    NSMethodSignature *signature = [super methodSignatureForSelector: selector];
    if (!signature) {

        for (int j = 0; j < [surrogates count]; j++) {
            id surrogate = [surrogates objectAtIndex: j];
            signature = [surrogate methodSignatureForSelector: selector];

            if (signature) {
                //                NSLog(@"Returning surrogate = %@", surrogate);
                //                NSLog(@"signature = %@", signature);
                break;
            }

        }
    }

    return signature;
}


@end