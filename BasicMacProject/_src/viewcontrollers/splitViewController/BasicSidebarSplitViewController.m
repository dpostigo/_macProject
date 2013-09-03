//
//  BasicSidebarSplitViewController.m
//  Carts
//
//  Created by Daniela Postigo on 7/10/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicSidebarSplitViewController.h"


@implementation BasicSidebarSplitViewController {

}


@synthesize sidebarContainer;
@synthesize sidebarView;

- (void) loadView {
    [super loadView];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"splitView = %@", splitView);
    [splitView setVertical: YES];
}

#pragma mark Getters

- (SplitViewContainer *) sidebarContainer {
    if (sidebarContainer == nil) {
        sidebarContainer = [[SplitViewContainer alloc] init];
        sidebarContainer.delegate = self;
    }
    return sidebarContainer;
}


#pragma mark Overrides

- (void) collectViews {
    [super collectViews];
    if (sidebarContainer) [self.containers addObject: sidebarContainer];
    if (contentContainer) [self.containers addObject: contentContainer];

}

- (void) addViews {
    [super addViews];
    sidebarContainer.width = defaultSidebarWidth;
    sidebarContainer.minimumWidth = defaultSidebarWidth;
    sidebarContainer.isLocked = YES;
}


- (void) setSidebarViewController: (NSViewController *) controller {
    [self setSidebarView: controller.view];
}


- (void) setSidebarView: (NSView *) subview {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    if (subview == nil) sidebarContainer = nil;
    else {
        sidebarView = subview;
        [self.sidebarContainer embedView: sidebarView];
        [self updateViews];
    }
}


#pragma mark SplitViewContainerDelegate

- (void) splitContainerChangedMinimumWidth: (SplitViewContainer *) splitContainer {
    if (splitContainer.width < splitContainer.minimumWidth) {
        splitContainer.width = splitContainer.minimumWidth;
    }
}


@end