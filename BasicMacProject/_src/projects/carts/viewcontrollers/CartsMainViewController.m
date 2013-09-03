//
//  CartsMainViewController.m
//  Carts
//
//  Created by Daniela Postigo on 9/3/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartsMainViewController.h"
#import "CartsSidebarViewController.h"
#import "CartsHomeViewController.h"


@implementation CartsMainViewController {

}





- (void) loadView {
    [super loadView];

    [self setSidebarViewController: [[CartsSidebarViewController alloc] init]];
    [self setMainViewController: [[CartsHomeViewController alloc] init]];
    sidebarContainer.minimumWidth = 200;
    sidebarContainer.maximumWidth = 250;

}



@end