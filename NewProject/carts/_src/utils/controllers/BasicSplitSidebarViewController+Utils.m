//
//  BasicSplitSidebarViewController+Utils.m
//  Carts
//
//  Created by Daniela Postigo on 10/20/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicSplitSidebarViewController+Utils.h"

@implementation BasicSplitSidebarViewController (Utils)

+ (BasicSplitSidebarViewController *) controllerWithClasses: (NSArray *) classes sidebarWidth: (CGFloat) aWidth {
    BasicSplitSidebarViewController *ret = [BasicSplitSidebarViewController controllerWithClasses: classes];
    ret.sidebarContainer.minimumValue = 200;
    return ret;

}

+ (BasicSplitSidebarViewController *) controllerWithClasses: (NSArray *) classes {
    BasicSplitSidebarViewController *ret = [[BasicSplitSidebarViewController alloc] init];

    for (Class class in classes) {
        if ([classes indexOfObject: class] == 0) {
            ret.sidebarViewController = [[class alloc] init];
        } else {
            [ret addViewController: [[class alloc] init]];
        }
    }
    return ret;
}


+ (BasicSplitSidebarViewController *) controllerWithSidebar: (NSViewController *) sidebarController mainController: (NSViewController *) mainController {
    BasicSplitSidebarViewController *ret = [[BasicSplitSidebarViewController alloc] init];
    ret.sidebarViewController = sidebarController;
    ret.mainViewController = mainController;
    return ret;
}
@end