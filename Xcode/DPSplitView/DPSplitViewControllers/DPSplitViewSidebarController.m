//
//  DPSplitViewSidebarController.m
//  Carts
//
//  Created by Daniela Postigo on 9/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "DPSplitViewSidebarController.h"

@implementation DPSplitViewSidebarController {

}

@synthesize sidebarIndex;

- (DPSplitViewContainer *) sidebarContainer {
    DPSplitViewContainer *ret = nil;
    NSUInteger length = [self.splitView.subviews count];
    if (length > 0) {
        ret = [self.splitView.subviews objectAtIndex: sidebarIndex];
    }
    return ret;
}



#pragma mark Setters

- (void) setSidebarViewController: (NSViewController *) controller {
    [self addSidebarViewController: controller];
}


- (void) setMainViewController: (NSViewController *) controller {
    mainControllerIndex = [self.splitView.splitContainers count];
    [self addViewController: controller];
}

#pragma mark Getters


- (NSViewController *) sidebarViewController {
    return [self splitContainerAtIndex: sidebarIndex].controller;
}

- (NSViewController *) mainViewController {
    return [self splitContainerAtIndex: mainControllerIndex].controller;
}

#pragma mark Methods

- (void) addSidebarViewController: (NSViewController *) controller {
    self.sidebarIndex = [self.splitView.splitContainers count];
    [self addViewController: controller];
}

#pragma mark Overrides

- (BOOL) basicSplitView: (DPSplitView *) splitview shouldAdjustSizeOfSplitContainer: (DPSplitViewContainer *) splitContainer {
    BOOL ret = [super basicSplitView: splitview shouldAdjustSizeOfSplitContainer: splitContainer];

    if (splitContainer == self.sidebarContainer) {
        ret = NO;
    }
    return ret;
}

- (NSRect) splitView: (NSSplitView *) splitView1 effectiveRect: (NSRect) proposedEffectiveRect forDrawnRect: (NSRect) drawnRect ofDividerAtIndex: (NSInteger) dividerIndex {
    NSRect result = [super splitView: splitView1 effectiveRect: proposedEffectiveRect forDrawnRect: drawnRect ofDividerAtIndex: dividerIndex];
    //    NSLog(@"result = %@", NSStringFromRect(result));
    return result;
}


@end