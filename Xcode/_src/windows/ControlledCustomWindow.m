//
//  ControlledCustomWindow.m
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "ControlledCustomWindow.h"

@implementation ControlledCustomWindow {

}

@synthesize windowHeaderViewController;
@synthesize windowFooterViewController;

- (void) setWindowHeaderViewController: (NSViewController *) windowHeaderViewController1 {
    windowHeaderViewController = windowHeaderViewController1;
    self.windowHeaderView = windowHeaderViewController.view;
}

- (void) setWindowFooterViewController: (NSViewController *) windowFooterViewController1 {
    windowFooterViewController = windowFooterViewController1;
    self.windowFooterView = windowFooterViewController.view;
}


@end