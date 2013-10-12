//
//  BOMainViewController.m
//  TaskManager
//
//  Created by Daniela Postigo on 5/26/13.
//  Copyright 2013 Dani Postigo. All rights reserved.
//

#import "BOMainViewController.h"
#import "BOSidebarViewController.h"
#import "TasksViewController.h"
#import "BottomViewController.h"
#import "BONavigationBar.h"

@implementation BOMainViewController {

}

- (void) loadView {
    [super loadView];

    NSLog(@"%s", __PRETTY_FUNCTION__);

}

- (void) awakeFromNib {
    [super awakeFromNib];
    NSLog(@"%s", __PRETTY_FUNCTION__);

    NavigationController *navController = [[NavigationController alloc] initWithRootViewController: [[TasksViewController alloc] initWithDefaultNib]];
    navController.navigationBar = [[BONavigationBar alloc] initWithFrame: NSZeroRect];

    //
    //    [self embedViewController: [[BOSidebarViewController alloc] initWithDefaultNib] inView: sidebarContainer];
    //    [self embedViewController: [[BottomViewController alloc] initWithDefaultNib] inView: bottomView];
    //    [self embedViewController: navController inView: mainView];


    navController.view.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;

    self.sidebarContainer.minimumValue = 150.0;
    self.sidebarContainer.maximumValue = 250.0;
    self.sidebarContainer.isLocked = YES;

    bottomView.minimumValue = 40.0f;
    bottomView.maximumValue = 60.0f;
    bottomView.height = 40.0f;
    bottomView.isLocked = YES;

    splitView.delegate = self;
    //    splitView.dividerColor    = [NSColor blackColor];
    contentSplitView.delegate = self;
    self.dividerEnabled = YES;

    [contentSplitView setHoldingPriority: 2 forSubviewAtIndex: 0];
    [contentSplitView setHoldingPriority: 1 forSubviewAtIndex: 1];

}


#pragma mark NSSplitViewDelegate


@end