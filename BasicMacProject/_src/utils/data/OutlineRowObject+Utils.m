//
//  OutlineRowObject+Utils.m
//  Carts
//
//  Created by Daniela Postigo on 10/20/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "OutlineRowObject+Utils.h"
#import "BasicObject.h"

@implementation OutlineRowObject (Utils)

+ (OutlineRowObject *) rowObjectWithTitle: (NSString *) title {
    return [[OutlineRowObject alloc] initWithTextLabel: title];
}


+ (OutlineRowObject *) rowObjectWithData: (BasicObject *) object {
    OutlineRowObject *ret = [[OutlineRowObject alloc] initWithTextLabel: object.title];
    ret.content = object;
    return ret;
}

+ (NSArray *) rowObjectsWithTitles: (NSArray *) titles {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    for (NSString *title in titles) {
        [ret addObject: [OutlineRowObject rowObjectWithTitle: title]];
    }
    return ret;
}


+ (NSMutableArray *) rowObjectsWithData: (NSArray *) objects {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    for (BasicObject *object in objects) {
        [ret addObject: [OutlineRowObject rowObjectWithData: object]];
    }
    return ret;
}
@end