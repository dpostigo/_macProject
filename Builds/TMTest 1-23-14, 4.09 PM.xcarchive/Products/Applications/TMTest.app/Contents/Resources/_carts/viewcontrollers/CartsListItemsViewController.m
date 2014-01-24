//
//  CartsListItemsViewController.m
//  Carts
//
//  Created by Daniela Postigo on 10/24/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartsListItemsViewController.h"
#import "BasicDisplayView+SurrogateUtils.h"
#import "BasicShadow.h"
#import "BasicShadow+Utils.h"
#import "ListItemView.h"
#import "TestLayerView.h"

@implementation CartsListItemsViewController {

}

- (void) loadView {
    [super loadView];

    collection.itemSize = NSMakeSize(100, 100);
    collection.itemClass = [ListItemView class];

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

- (void) customizeBasicItem: (BasicCollectionViewItem *) item object: (id) object {
    [super customizeBasicItem: item object: object];
    item.insets = NSEdgeInsetsMake(5, 5, 5, 5);

    if ([item.background isKindOfClass: [TestLayerView class]]) {
        TestLayerView *layerView = (TestLayerView *) item.background;
    }
    //    item.displayBackground.backgroundColor = [NSColor clearColor];

    //    BasicShadow *basicShadow = item.background.basicOuterShadow;
    //
    //
    //    item.background.outerShadow.shadowColor = [NSColor blackColor];
    //    item.background.outerShadow.shadowOffset = NSMakeSize(0, 2);
    //    item.background.outerShadow.shadowBlurRadius = 3;

}


@end