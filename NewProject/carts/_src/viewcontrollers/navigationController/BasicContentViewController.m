//
//  BasicContentViewController.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicContentViewController.h"
#import "NSView+LayoutConstraints.h"
#import "AutoLayoutHelpers.h"
#import "NSView+Debug.h"
#import "BasicBannerViewController.h"
#import "Masonry.h"
#import "BasicDisplayView+Carts.h"
#import "NSView+Masonry.h"

@implementation BasicContentViewController {

}

@synthesize viewController;

- (void) loadView {
    [super loadView];

    insets = NSEdgeInsetsMake(0, 0, 0, 0);

}


- (void) setViewController: (NSViewController *) viewController1 {

    if (viewController) {
        if ([viewController.view superview]) [viewController.view removeFromSuperview];
    }

    viewController = viewController1;

    if (viewController) {
        [self.view addSubview: viewController.view];
        //        viewController.view.frame = self.view.bounds;
        [viewController.view fillToSuperviewWithInsets: insets];
    }
}

- (void) addMasonryConstraints {

    BasicDisplayView *redView = [BasicDisplayView newWithBackgroundColor: [NSColor redColor]];
    [self.view addSubview: redView];

    NSView *superview = self.view;


    //with is semantic and option
    [redView mas_makeConstraints: ^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).with.offset(insets.top); //with is an optional semantic filler
        make.left.equalTo(superview.mas_left).with.offset(insets.left);
        make.bottom.equalTo(superview.mas_bottom).with.offset(-insets.bottom);
        make.right.equalTo(superview.mas_right).with.offset(-insets.right);
    }];

}


@end