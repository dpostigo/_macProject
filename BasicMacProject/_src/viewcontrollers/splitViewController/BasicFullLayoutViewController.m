//
//  BasicFullLayoutViewController.m
//  Carts
//
//  Created by Daniela Postigo on 7/10/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicFullLayoutViewController.h"
#import "BasicVerticalSplitViewController.h"
#import "BasicSidebarSplitViewController.h"


@implementation BasicFullLayoutViewController {

    BasicVerticalSplitViewController *verticalViewController;
    BasicSidebarSplitViewController *sidebarViewController;
}


- (void) loadView {
    [super loadView];

    verticalViewController = [[BasicVerticalSplitViewController alloc] init];
    sidebarViewController = [[BasicSidebarSplitViewController alloc] init];

    [self embedViewController: verticalViewController inView: self.view];

    verticalViewController
}

@end