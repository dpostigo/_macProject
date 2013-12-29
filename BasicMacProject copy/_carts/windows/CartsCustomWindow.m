//
//  CartsCustomWindow.m
//  Carts
//
//  Created by Daniela Postigo on 6/29/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartsCustomWindow.h"
#import "CartsMainViewController.h"
#import "CartsWindowHeaderViewControllerOld.h"
#import "CartsWindowFooterViewController.h"

@implementation CartsCustomWindow

- (id) initWithContentRect: (NSRect) contentRect styleMask: (NSUInteger) aStyle backing: (NSBackingStoreType) bufferingType defer: (BOOL) flag {
    self = [super initWithContentRect: contentRect styleMask: aStyle backing: bufferingType defer: flag];
    if (self) {
        NSLog(@"%s", __PRETTY_FUNCTION__);

        self.delegate = self;
        self.centersWindowButtons = YES;
        self.contentView = ([[CartsMainViewController alloc] init]).view;

        self.windowHeaderViewController = [[CartsWindowHeaderViewControllerOld alloc] initWithDefaultNib];
        self.windowFooterViewController = [[CartsWindowFooterViewController alloc] initWithDefaultNib];

        self.headerBarHeight = 30;
        self.footerBarHeight = 32;

    }

    return self;
}


@end