//
//  BasicSplitLayoutViewController.m
//  Carts
//
//  Created by Daniela Postigo on 7/10/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicSplitLayoutViewController.h"


@implementation BasicSplitLayoutViewController {
}

@synthesize contentContainer;
@synthesize mainView;

@synthesize containers;


- (NSMutableArray *) containers {
    if (containers == nil) containers = [[NSMutableArray alloc] init];
    return containers;
}


- (void) updateViews {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self clearViews];
    [self collectViews];
    [self addViews];
}

- (void) collectViews {

}

- (void) addViews {
    NSLog(@"containers = %@", containers);
    for (SplitViewContainer *container in self.containers) {
        [splitView addSubview: container];
    }
}

- (void) clearViews {
    for (SplitViewContainer *container in self.containers) {
        [container removeFromSuperview];
    }
    [self.containers removeAllObjects];
}


- (void) setMainViewController: (NSViewController *) controller {
    [self setMainView: controller.view];

}

- (void) setMainView: (NSView *) subview {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    if (subview == nil) contentContainer = nil;
    else {
        mainView = subview;
        contentContainer = [[SplitViewContainer alloc] init];
        [contentContainer embedView: mainView];
        [self updateViews];
    }
}

#pragma mark DPSplitViewDelegate

- (CGFloat) splitView: (NSSplitView *) splitView1 constrainSplitPosition: (CGFloat) proposedPosition ofSubviewAt: (NSInteger) dividerIndex {
//    NSLog(@"%s", __PRETTY_FUNCTION__);
    DPSplitView *dpSplit = (DPSplitView *) splitView1;
    NSView *subview = [splitView1.subviews objectAtIndex: dividerIndex];
    if ([subview isKindOfClass: [SplitViewContainer class]]) {

        SplitViewContainer *container = (SplitViewContainer *) subview;
//        NSLog(@"proposedPosition = %f", proposedPosition);

    }

    return [delegate dpSplitView: dpSplit limitedCoordinateForValue: proposedPosition atDividerIndex: dividerIndex];
}


@end