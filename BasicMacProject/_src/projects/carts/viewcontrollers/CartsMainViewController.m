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

@implementation CartsMainViewController {

}

- (void) loadView {
    [super loadView];

    BasicSplitSidebarViewController *splitViewController = [[BasicSplitSidebarViewController alloc] init];
    [splitViewController addViewController: [[CartsSidebarViewController alloc] init]];
    [splitViewController addViewController: [[CartsHomeViewController alloc] init]];
    splitViewController.sidebarContainer.minimumValue = 100;
//    splitViewController.splitView.dividerThickness = 0.5;

    BasicLayoutViewController *verticalController = [[BasicLayoutViewController alloc] init];
    [verticalController addViewController: splitViewController];
    [verticalController addViewController: [[CartsHomeViewController alloc] init]];
    verticalController.footerContainer.minimumValue = 40;
    verticalController.footerContainer.maximumValue = 40;
//    verticalController.splitView.dividerThickness = 0.5;

    NSLog(@"Will embed.");
    [self embedViewController: verticalController inView: self.view];
    NSLog(@"Did embed.");




    //    BasicSidebarSplitViewControllerOld *sidebarSplitViewController = [[BasicSidebarSplitViewControllerOld alloc] init];
    //    [sidebarSplitViewController setSidebarViewController: [[CartsSidebarViewController alloc] init]];
    //    [sidebarSplitViewController setMainViewController: [[CartsHomeViewController alloc] init]];
    //    sidebarSplitViewController.sidebarContainer.minimumValue = 200;
    //    sidebarSplitViewController.sidebarContainer.maximumValue = 250;
    //    [self embedViewController: sidebarSplitViewController inView: self.view];


    //    BasicSidebarSplitViewControllerOld *sidebarSplitViewController = [[BasicSidebarSplitViewControllerOld alloc] init];
    //    [sidebarSplitViewController setSidebarViewController: [[CartsSidebarViewController alloc] init]];
    //    [sidebarSplitViewController setMainViewController: [[CartsHomeViewController alloc] init]];
    //    sidebarSplitViewController.sidebarContainer.minimumValue = 200;
    //    sidebarSplitViewController.sidebarContainer.maximumValue = 250;
    //    [self embedViewController: sidebarSplitViewController inView: self.view];



    //
    //    [self setMainViewController: [[CartsSidebarViewController alloc] init]];
    //    [self setFooterViewController: [[CartsHomeViewController alloc] init]];
    //    self.footerContainer.minimumValue = 40;
    //    self.footerContainer.maximumValue = 40;
    //
    //    BasicSidebarSplitViewControllerOld *contentController = [[BasicSidebarSplitViewControllerOld alloc] init];
    //    [contentController setSidebarViewController: [[CartsSidebarViewController alloc] init]];
    //    [contentController setMainViewController: [[CartsHomeViewController alloc] init]];
    //    contentController.sidebarContainer.minimumValue = 200;
    //    contentController.sidebarContainer.maximumValue = 250;
    //    [self setMainViewController: contentController];
    //    [self setFooterViewController: [[CartsHomeViewController alloc] init]];
    //
    //    self.footerContainer.minimumHeight = 40;
    //    self.footerContainer.maximumValue = 40;



    //    [self setHeaderViewController: [[CartsHomeViewController alloc] init]];
    //    [self setSidebarViewController: [[CartsSidebarViewController alloc] init]];

    //    BasicSidebarSplitViewControllerOld *contentController = [[BasicSidebarSplitViewControllerOld alloc] init];
    //    [contentController setSidebarViewController: [[CartsSidebarViewController alloc] init]];
    //    [contentController setMainViewController: [[CartsHomeViewController alloc] init]];
    //    [self setMainViewController: contentController];
    //    self.sidebarContainer.minimumValue = 200;
    //    self.sidebarContainer.maximumValue = 250;


    //    [self setFooterViewController: [[CartsHomeViewController alloc] init]];
    //    footerContainer.minimumValue = 40;
    //    footerContainer.maximumValue = 40;

}


@end