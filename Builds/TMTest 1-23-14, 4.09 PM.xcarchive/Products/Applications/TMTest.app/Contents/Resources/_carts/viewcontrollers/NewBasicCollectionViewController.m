//
//  NewBasicCollectionViewController.m
//  Carts
//
//  Created by Daniela Postigo on 10/24/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NewBasicCollectionViewController.h"

@implementation NewBasicCollectionViewController {

}

@synthesize collection;

- (void) loadView {
    [super loadView];

    if (collection == nil) {
        self.collection = [[NSCollectionView alloc] initWithFrame: self.view.bounds];
    }

    NSLog(@"collection.frame = %@", NSStringFromRect(collection.frame));

}

- (void) setCollection: (NSCollectionView *) collection1 {
    if (collection) [collection removeFromSuperview];

    collection = collection1;

    if (collection) {
        collection.delegate = self;
        collection.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
        [self.view addSubview: collection];
    }
}


@end