//
//  CartsMainViewController2.m
//  Carts
//
//  Created by Daniela Postigo on 6/15/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartsMainViewController2.h"
#import "CartsSidebarViewController.h"
#import "BasicDisplayView.h"
#import "BasicInnerShadowView.h"
#import "BasicView.h"
#import "BasicVerticalSplitViewController.h"


@implementation CartsMainViewController2 {

}


- (void) loadView {
    [super loadView];


    NSLog(@"%s", __PRETTY_FUNCTION__);
    //    [self embedViewController: [[BasicVerticalSplitViewController alloc] init] inView: self.view];
    //
    //
    //    contentBackgroundView = [[BasicInnerShadowView alloc] initWithFrame: self.view.bounds];
    //
    //    contentBackgroundView.borderOptions = [NSArray arrayWithObjects:
    //            [[BorderOption alloc] initWithBorderColor: [NSColor darkGrayColor] borderWidth: 0.5 type: BorderTypeTop],
    //            [[BorderOption alloc] initWithBorderColor: [NSColor darkGrayColor] borderWidth: 0.5 type: BorderTypeLeft],
    //            [[BorderOption alloc] initWithBorderColor: [NSColor darkGrayColor] borderWidth: 0.5 type: BorderTypeRight],
    //            nil];
    //    [self embedView: contentBackgroundView inView: contentView];

    sidebarContainer.minimumWidth = 150;
    [self setSidebarViewController: [[CartsSidebarViewController alloc] init]];
    [self setMainViewController: [[NSViewController alloc] init]];


    //    [splitView setVertical: NO];
}




//}


@end