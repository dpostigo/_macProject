//
//  DPSplitViewSidebarController+PositionUtils.m
//  Carts
//
//  Created by Daniela Postigo on 10/20/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "DPSplitViewSidebarController+Utils.h"

@implementation DPSplitViewSidebarController (Utils)

+ (DPSplitViewSidebarController *) controllerWithClasses: (NSArray *) classes sidebarWidth: (CGFloat) aWidth {
    DPSplitViewSidebarController *ret = [DPSplitViewSidebarController controllerWithClasses: classes];
    ret.sidebarContainer.minimumValue = 200;
    return ret;

}

+ (DPSplitViewSidebarController *) controllerWithClasses: (NSArray *) classes {
    DPSplitViewSidebarController *ret = [[DPSplitViewSidebarController alloc] init];

    for (Class class in classes) {
        if ([classes indexOfObject: class] == 0) {
            ret.sidebarViewController = [[class alloc] init];
        } else {
            [ret addViewController: [[class alloc] init]];
        }
    }
    return ret;
}


+ (DPSplitViewSidebarController *) controllerWithSidebar: (NSViewController *) sidebarController mainController: (NSViewController *) mainController {
    DPSplitViewSidebarController *ret = [[DPSplitViewSidebarController alloc] init];
    ret.sidebarViewController = sidebarController;
    ret.mainViewController = mainController;
    return ret;
}
@end