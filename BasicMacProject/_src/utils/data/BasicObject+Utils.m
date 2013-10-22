//
//  BasicObject+Utils.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicObject+Utils.h"

@implementation BasicObject (Utils)

+ (NSMutableArray *) objectsWithTitles: (NSArray *) titles {
    return [BasicObject objectsWithTitles: titles class: [self class]];
}

+ (NSMutableArray *) objectsWithTitles: (NSArray *) titles class: (Class) class {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    for (NSString *title in titles) {
        [ret addObject: [[class alloc] initWithTitle: title]];
    }
    return ret;
}



@end