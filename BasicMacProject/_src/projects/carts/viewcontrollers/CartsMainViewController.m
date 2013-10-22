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
#import "BasicSplitVerticalViewController.h"
#import "BasicSplitHorizontalViewController.h"
#import "BasicLayoutViewController.h"
#import "BasicSplitSidebarViewController.h"
#import "BasicSplitSidebarViewController+Utils.h"

@implementation CartsMainViewController {

}

- (void) loadView {
    [super loadView];

    BasicSplitSidebarViewController *splitViewController = [BasicSplitSidebarViewController controllerWithClasses: [NSArray arrayWithObjects: [CartsSidebarViewController class], [CartsHomeViewController class], nil ]];
    splitViewController.sidebarContainer.minimumValue = 200;
    //    splitViewController.splitView.dividerThickness = 0.5;



//
//    BasicLayoutViewController *verticalController = [[BasicLayoutViewController alloc] init];
//    [verticalController addViewController: splitViewController];
//    //    [verticalController addViewController: [[CartsHomeViewController alloc] init]];
//    verticalController.footerContainer.minimumValue = 40;
//    verticalController.footerContainer.maximumValue = 40;
//    //        verticalController.splitView.dividerThickness = 0.5;

    [self embedViewController: splitViewController inView: self.view];

}


@end