//
//  CartsCustomWindow.m
//  Carts
//
//  Created by Daniela Postigo on 6/29/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartsCustomWindow.h"
#import "CartsMainViewController.h"
#import "CartsWindowHeaderViewController.h"
#import "CartsWindowFooterViewController.h"
#import "BasicBannerViewController.h"
#import "CartsContentViewController.h"

@implementation CartsCustomWindow

- (id) initWithContentRect: (NSRect) contentRect styleMask: (NSUInteger) aStyle backing: (NSBackingStoreType) bufferingType defer: (BOOL) flag {
    self = [super initWithContentRect: contentRect styleMask: aStyle backing: bufferingType defer: flag];
    if (self) {

        self.delegate = self;
        self.centersWindowButtons = YES;
        self.contentView = ([[CartsMainViewController alloc] init]).view;

        self.windowHeaderViewController = [[CartsWindowHeaderViewController alloc] initWithDefaultNib];
        self.windowFooterViewController = [[CartsWindowFooterViewController alloc] initWithDefaultNib];

        self.headerBarHeight = 30;
        self.footerBarHeight = 32;
//
//        //        BasicBannerViewController *bannerController = [[BasicBannerViewController alloc] init];
//        //        CartsContentViewController *contentController = [[CartsContentViewController alloc] init];
//        //
//        //        self.contentView = contentController.view;
//        //        contentController.viewController = bannerController;
//
//        //        self.contentView = bannerController.view;
//
//        CartsContentViewController *contentController = [[CartsContentViewController alloc] init];
//
//        self.contentView = contentController.view;
//        contentController.viewController = [[BasicBannerViewController alloc] init];;

    }

    return self;
}


@end