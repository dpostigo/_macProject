//
//  NSMutableArray+BasicObject.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSMutableArray+BasicObject.h"
#import "BasicObject.h"

@implementation NSMutableArray (BasicObject)

- (NSMutableArray *) titles {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    for (BasicObject *object in self) {
        [ret addObject: object.title];
    }
    return ret;
}
@end