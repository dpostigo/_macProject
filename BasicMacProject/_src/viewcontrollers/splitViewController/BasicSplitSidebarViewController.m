//
//  BasicSplitSidebarViewController.m
//  Carts
//
//  Created by Daniela Postigo on 9/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicSplitSidebarViewController.h"

@implementation BasicSplitSidebarViewController {

}

@synthesize sidebarIndex;

- (SplitViewContainer *) sidebarContainer {
    SplitViewContainer *ret = nil;
    NSUInteger length = [self.splitView.subviews count];
    if (length > 0) {
        ret = [self.splitView.subviews objectAtIndex: sidebarIndex];
    }
    return ret;
}


- (void) addSidebarViewController: (NSViewController *) controller {
    self.sidebarIndex = [self.splitView.splitContainers count];
    [self addViewController: controller];
}

#pragma mark Overrides

- (BOOL) basicSplitView: (BasicSplitView *) splitview shouldAdjustSizeOfSplitContainer: (SplitViewContainer *) splitContainer {
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