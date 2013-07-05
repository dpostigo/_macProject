//
//  CartsMainViewController.m
//  Carts
//
//  Created by Daniela Postigo on 6/15/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartsMainViewController.h"
#import "CartsSidebarViewController.h"
#import "BasicBackgroundView.h"


@implementation CartsMainViewController {

}


- (void) loadView {
    [super loadView];
    NSLog(@"%s", __PRETTY_FUNCTION__);

    splitView.dividerColor = [NSColor whiteColor];
    contentBackgroundView = [[BasicBackgroundView alloc] initWithFrame: self.view.bounds];
    contentBackgroundView.width            = 3;
    contentBackgroundView.autoresizingMask = NSViewHeightSizable | NSViewMaxXMargin | NSViewMinXMargin;

    [self embedView: contentBackgroundView inView: contentView];
    [self embedViewController: [[CartsSidebarViewController alloc] initWithDefaultNib] inView: sidebar];


    sidebarHighlightView = [[BasicBackgroundViewOld alloc] initWithFrame: self.view.bounds];
    sidebarHighlightView.gradient         = [[NSGradient alloc] initWithStartingColor: [NSColor clearColor] endingColor: [NSColor whiteColor]];
    sidebarHighlightView.gradientRotation = 0;
    sidebarHighlightView.width            = 2;
    sidebarHighlightView.left             = sidebar.width - sidebarHighlightView.width;
    sidebarHighlightView.autoresizingMask = NSViewHeightSizable | NSViewMaxXMargin | NSViewMinXMargin;
    //    [sidebar addSubview: sidebarHighlightView];

}


//}


@end