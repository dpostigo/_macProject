//
//  CartsMainViewController.m
//  Carts
//
//  Created by Daniela Postigo on 6/15/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartsMainViewController.h"
#import "CartsSidebarViewController.h"
#import "BasicDisplayView.h"
#import "BasicInnerShadowView.h"
#import "BasicView.h"
#import "BasicVerticalSplitViewController.h"


@implementation CartsMainViewController {

}


- (void) loadView {
    [super loadView];




    [self embedViewController: [[BasicVerticalSplitViewController alloc] init] inView: self.view];


    sidebar.minimumWidth = 150;
    contentBackgroundView = [[BasicInnerShadowView alloc] initWithFrame: self.view.bounds];

    contentBackgroundView.borderOptions = [NSArray arrayWithObjects:
            [[BorderOption alloc] initWithBorderColor: [NSColor darkGrayColor] borderWidth: 0.5 type: BorderTypeTop],
            [[BorderOption alloc] initWithBorderColor: [NSColor darkGrayColor] borderWidth: 0.5 type: BorderTypeLeft],
            [[BorderOption alloc] initWithBorderColor: [NSColor darkGrayColor] borderWidth: 0.5 type: BorderTypeRight],
            nil];
    [self embedView: contentBackgroundView inView: contentView];


    [self embedViewController: [[CartsSidebarViewController alloc] initWithDefaultNib] inView: sidebar];


//    [splitView setVertical: NO];
}




//}


@end