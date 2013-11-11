//
//  DataSection+Utils.m
//  Carts
//
//  Created by Daniela Postigo on 10/24/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "DataSection+Utils.h"
#import "DataItemObject.h"
#import "BasicObject.h"
#import "NSMutableArray+Sorting.h"

@implementation DataSection (Utils)

+ (DataSection *) firstObject: (NSMutableArray *) datasource {
    DataSection *ret = nil;
    if (datasource && [datasource count] > 0) {
        ret = [datasource objectAtIndex: 0];
    }

    return ret;
}

- (NSArray *) contentObjects {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    for (int j = 0; j < [self.rows count]; j++) {
        DataItemObject *dataObject = [self.rows objectAtIndex: j];
        [ret addObject: dataObject.content];
    }
    return ret;
}


- (NSArray *) basicObjects {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    NSArray *objects = self.contentObjects;

    for (int j = 0; j < [objects count]; j++) {
        id object = [objects objectAtIndex: j];
        if ([object isKindOfClass: [BasicObject class]]) {
            [ret addObject: object];
        } else {
            return nil;
        }
    }
    return ret;
}


- (NSSortDescriptor *) sortModeDescriptor {
    NSSortDescriptor *sortDescriptor;

    switch (self.sortMode) {
        case ItemDateAscendingSortType :
            sortDescriptor = [[NSSortDescriptor alloc] initWithKey: @"content.creationDate" ascending: YES];
            break;

        case ItemDateDescendingSortType :
            sortDescriptor = [[NSSortDescriptor alloc] initWithKey: @"content.creationDate" ascending: NO];
            break;

        case ItemTitleAscendingSortType :
            sortDescriptor = [[NSSortDescriptor alloc] initWithKey: @"content.title" ascending: YES];
            break;

        case ItemTitleDescendingSortType :
            sortDescriptor = [[NSSortDescriptor alloc] initWithKey: @"content.title" ascending: NO];
            break;
    }

    return sortDescriptor;
}


- (void) sortRows {
    NSArray *objects = self.basicObjects;
    if (objects) {
        NSSortDescriptor *sortDescriptor = self.sortModeDescriptor;
        [self.rows sortUsingDescriptor: sortDescriptor];
    }
}


@end