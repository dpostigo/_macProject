//
//  DPSplitViewSidebarController+PositionUtils.h
//  Carts
//
//  Created by Daniela Postigo on 10/20/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPSplitViewSidebarController.h"

@interface DPSplitViewSidebarController (Utils)

+ (DPSplitViewSidebarController *) controllerWithClasses: (NSArray *) classes sidebarWidth: (CGFloat) aWidth;
+ (DPSplitViewSidebarController *) controllerWithClasses: (NSArray *) classes;
+ (DPSplitViewSidebarController *) controllerWithSidebar: (NSViewController *) sidebarController mainController: (NSViewController *) mainController;
@end