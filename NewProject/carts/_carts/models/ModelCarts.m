//
//  ModelCarts.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "ModelCarts.h"
#import "BasicObject+Utils.h"
#import <objc/runtime.h>

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

        [self dummyDataInit];

    }

    return self;
}


- (void) modelDidDearchive {
    [super modelDidDearchive];
    if (lists == nil) self.lists = [[NSMutableArray alloc] init];
}


#pragma mark Dummy data

- (void) dummyDataInit {
    NSArray *listTitles = [NSArray arrayWithObjects: @"My List 1", @"My List 2", @"My List 3", @"My List 4", nil];
    [self.lists addObjectsFromArray: [List objectsWithTitles: listTitles]];
}


#pragma mark Saving Data

- (void) save {
    NSArray *keys = [NSArray arrayWithObjects: @"lists", nil];
    [self saveWithKeys: keys];
}

#pragma mark Setters

- (void) setSelectedList: (List *) selectedList1 {
    selectedList = selectedList1;
    [self notifyDelegates: @selector(listWasSelected:) object: selectedList];
}

- (void) setLists: (NSMutableArray *) lists1 {
    lists = lists1;
    [self notifyDelegates: @selector(listsDidUpdate) object: nil];
}

- (void) addList: (List *) aList {
    [self.lists addObject: aList];
    [self notifyDelegates: @selector(listDidInit:) object: aList];
    [self save];
}


#pragma mark BasicModel
- (void) dearchivePayload {
    //    [super dearchivePayload];
    [self modelDidDearchive];
}


@end