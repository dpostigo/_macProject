//
//  CartListItemsViewController.m
//  Carts
//
//  Created by Daniela Postigo on 10/24/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartListItemsViewController.h"
#import "BasicDisplayView.h"
#import "BasicCollectionViewItem.h"

@implementation CartListItemsViewController {

}

- (void) loadView {
    [super loadView];

    self.background = [[BasicDisplayView alloc] init];
    [collection.enclosingScrollView setDrawsBackground: NO];

//    [self.collection removeFromSuperview];
    NSLog(@"self.collection.frame = %@", NSStringFromRect(self.collection.frame));

    //    BasicCollectionViewItem *firstItem = (BasicCollectionViewItem *) [collection itemAtIndex: 0];
//    NSLog(@"firstItem.view.bounds = %@", NSStringFromRect(firstItem.view.bounds));
//    NSLog(@"NSStringFromSize(collection.maxItemSize) = %@", NSStringFromSize(collection.maxItemSize));

}

- (void) setCollection: (NSCollectionView *) collection1 {
    [super setCollection: collection1];

    collection.frame = NSInsetRect(self.view.bounds, 10, 10);
    collection.maxItemSize = NSMakeSize(10, 10);

}


- (void) prepareDataSource {
    [super prepareDataSource];
    [self.arraySource addObject: @"Hello"];
    [self.arraySource addObject: @"Hello"];
    [self.arraySource addObject: @"Hello"];
    [self.arraySource addObject: @"Hello"];
    [self.arraySource addObject: @"Hello"];
    [self.arraySource addObject: @"Hello"];
}


@end