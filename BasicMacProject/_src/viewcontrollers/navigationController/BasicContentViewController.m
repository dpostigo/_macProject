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

@implementation BasicContentViewController {

}

@synthesize viewController;

- (void) loadView {
    [super loadView];
}


- (void) setViewController: (NSViewController *) viewController1 {

    if (viewController) {
        if ([viewController.view superview]) [viewController.view removeFromSuperview];
    }

    viewController = viewController1;

    if (viewController) {
        //        viewController.view.width = self.view.width;
        //        viewController.view.height = self.view.height;
        //        viewController.view.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
        //        [self.view addSubview: viewController.view];
//        [self.view embedView: viewController.view];
        [self.view addSubview: viewController.view];
        viewController.view.frame = self.view.bounds;


        //                [self.view embedView: viewController.view];
        //        NSLog(@"%s, viewController = %@", __PRETTY_FUNCTION__, viewController);
        //        NSLog(@"%s, viewController.view = %@", __PRETTY_FUNCTION__, viewController.view);
        //        NSLog(@"%s, NSStringFromRect(viewController.view.frame) = %@", __PRETTY_FUNCTION__, NSStringFromRect(viewController.view.frame));
        NSLog(@"%s, NSStringFromRect(self.view.frame) = %@", __PRETTY_FUNCTION__, NSStringFromRect(self.view.frame));

        if ([viewController isKindOfClass: [BasicBannerViewController class]]) {

            BasicBannerViewController *bannerController = (BasicBannerViewController *) viewController;

            NSLog(@"%s, NSStringFromRect(bannerController.view.frame) = %@", __PRETTY_FUNCTION__, NSStringFromRect(bannerController.view.frame));

            NSLog(@"%s, NSStringFromRect(bannerController.bannerView.frame) = %@", __PRETTY_FUNCTION__, NSStringFromRect(bannerController.bannerView.frame));
            NSLog(@"%s, NSStringFromRect(bannerController.bannerView.background.frame) = %@", __PRETTY_FUNCTION__, NSStringFromRect(bannerController.bannerView.background.frame));

        }
    }
}


//- (void) constrainWidthToSuperview: (NSView *) subview {
//    NSArray *constraints = [NSArray arrayWithObjects: constraintWidthWithOffset(subview, subview.superview, 0), constraintHeight(subview, subview.superview), nil];
//    [subview.superview addConstraints: constraints];
//}




@end