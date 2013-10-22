//
//  BasicContentViewController.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicContentViewController.h"

@implementation BasicContentViewController {

}

@synthesize viewController;

- (void) setViewController: (NSViewController *) viewController1 {

    if (viewController) {
        if ([viewController.view superview]) [viewController.view removeFromSuperview];
    }
    viewController = viewController1;

    if (viewController) {
        [self.view embedView: viewController.view];

    }
}

@end