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
#import "BasicInnerShadowView.h"


@implementation CartsMainViewController {

}


- (void) loadView {
    [super loadView];


    splitView.dividerColor = [NSColor redColor];
    //
    //
    //
    contentBackgroundView = [[BasicInnerShadowView alloc] initWithFrame: self.view.bounds];
    contentBackgroundView.borderColor = [NSColor clearColor];
//    contentBackgroundView.borderOptions = [NSArray arrayWithObject: [[BorderOption alloc] initWithBorderColor: [NSColor darkGrayColor] borderWidth: 1.0 type: BorderTypeLeft]];
    [self embedView: contentBackgroundView inView: contentView];
    //
    //
    //    sidebarHighlightView = [[BasicBackgroundViewOld alloc] initWithFrame: self.view.bounds];
    //    sidebarHighlightView.gradient = [[NSGradient alloc] initWithStartingColor: [NSColor clearColor] endingColor: [NSColor whiteColor]];
    //    sidebarHighlightView.gradientRotation = 0;
    //    sidebarHighlightView.width = 2;
    //    sidebarHighlightView.left = sidebar.width - sidebarHighlightView.width;
    //    sidebarHighlightView.autoresizingMask = NSViewHeightSizable | NSViewMaxXMargin | NSViewMinXMargin;
    //    //    [sidebar addSubview: sidebarHighlightView];
    //
    [self embedViewController: [[CartsSidebarViewController alloc] initWithDefaultNib] inView: sidebar];
    //
    //    BasicInnerShadowView *sidebarInnerShadow = [[BasicInnerShadowView alloc] initWithFrame: self.view.bounds];
    //    //    [self embedView: sidebarInnerShadow inView: sidebar];

}


//}


@end