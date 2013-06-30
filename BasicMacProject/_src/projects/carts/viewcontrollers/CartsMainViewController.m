//
//  CartsMainViewController.m
//  Carts
//
//  Created by Daniela Postigo on 6/15/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartsMainViewController.h"
#import "CartsSidebarViewController.h"


@implementation CartsMainViewController {

}


- (void) loadView {
    [super loadView];
    NSLog(@"%s", __PRETTY_FUNCTION__);

    contentBackgroundView = [[BasicBackgroundView alloc] initWithFrame: self.view.bounds];
    contentBackgroundView.gradient = [[NSGradient alloc] initWithStartingColor: [[NSColor lightGrayColor] colorWithAlphaComponent: 0.5]
                                                                   endingColor: [NSColor clearColor]];
    contentBackgroundView.gradientRotation = 0;
    contentBackgroundView.width = 3;
    contentBackgroundView.autoresizingMask = NSViewHeightSizable | NSViewMaxXMargin | NSViewMinXMargin;
    [contentView addSubview: contentBackgroundView];


    [self embedViewController: [[CartsSidebarViewController alloc] initWithDefaultNib] inView: sidebar];


    sidebarHighlightView = [[BasicBackgroundView alloc] initWithFrame: self.view.bounds];
    sidebarHighlightView.gradient = [[NSGradient alloc] initWithStartingColor: [NSColor clearColor] endingColor: [NSColor whiteColor]];
    sidebarHighlightView.gradientRotation = 0;
    sidebarHighlightView.width = 2;
    sidebarHighlightView.left = sidebar.width - sidebarHighlightView.width;
    sidebarHighlightView.autoresizingMask = NSViewHeightSizable | NSViewMaxXMargin | NSViewMinXMargin;
//    [sidebar addSubview: sidebarHighlightView];

}


//- (void) embedViewController: (NSViewController *) viewController inSplitView: (DPSplitView *) split {
//
//    NSLog(@"split.subviews = %@", split.subviews);
//
//    [split addSubview: <#(NSView *)aView#>];
//}


@end