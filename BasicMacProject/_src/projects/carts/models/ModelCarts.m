//
//  ModelCarts.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "ModelCarts.h"
#import "BasicObject+Utils.h"

@implementation ModelCarts {

}

@synthesize selectedList;

@synthesize lists;

+ (ModelCarts *) sharedModel {
    static ModelCarts *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}

- (id) init {
    self = [super init];
    if (self) {

        self.lists = [[NSMutableArray alloc] init];
        [self dummyDataInit];

    }

    return self;
}


#pragma mark Dummy data

- (void) dummyDataInit {
    NSArray *listTitles = [NSArray arrayWithObjects: @"My List 1", @"My List 2", @"My List 3", @"My List 4", nil];
    [self.lists addObjectsFromArray: [List objectsWithTitles: listTitles]];
}


#pragma mark Setters

- (void) setSelectedList: (List *) selectedList1 {
    selectedList = selectedList1;
    [self notifyDelegates: @selector(listWasSelected:) object: selectedList];
}


@end