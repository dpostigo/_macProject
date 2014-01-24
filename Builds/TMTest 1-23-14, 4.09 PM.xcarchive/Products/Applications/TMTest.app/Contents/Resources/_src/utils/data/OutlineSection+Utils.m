//
//  OutlineSection+PositionUtils.m
//  Carts
//
//  Created by Daniela Postigo on 10/20/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "OutlineSection+Utils.h"
#import "OutlineRowObject.h"
#import "OutlineRowObject+Utils.h"

@implementation OutlineSection (Utils)

+ (OutlineSection *) expandableSectionWithTitle: (NSString *) title {
    return [[OutlineSection alloc] initWithTitle: title isExpandable: YES];
}


+ (OutlineSection *) expandableSectionWithTitle: (NSString *) title rows: (NSArray *) rows {
    OutlineSection *ret = [OutlineSection expandableSectionWithTitle: title];

    if ([rows count] > 0) {
        id firstObject = [rows objectAtIndex: 0];
        if ([firstObject isKindOfClass: [NSString class]]) rows = [OutlineRowObject rowObjectsWithTitles: rows];
        else if ([firstObject isKindOfClass: [BasicObject class]]) rows = [OutlineRowObject rowObjectsWithData: rows];
    }

    [ret.rows addObjectsFromArray: rows];
    return ret;
}


@end