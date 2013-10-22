//
//  BasicSplitSidebarViewController+Utils.h
//  Carts
//
//  Created by Daniela Postigo on 10/20/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicSplitSidebarViewController.h"

@interface BasicSplitSidebarViewController (Utils)

+ (BasicSplitSidebarViewController *) controllerWithClasses: (NSArray *) classes sidebarWidth: (CGFloat) aWidth;
+ (BasicSplitSidebarViewController *) controllerWithClasses: (NSArray *) classes;
+ (BasicSplitSidebarViewController *) controllerWithSidebar: (NSViewController *) sidebarController mainController: (NSViewController *) mainController;
@end