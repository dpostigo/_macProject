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


- (void) loadView {
    [super loadView];

    [splitView setVertical: YES];
}


#pragma mark Overrides

- (void) collectViews {
    [super collectViews];
    if (sidebarContainer) [containers addObject: sidebarContainer];
    if (contentContainer) [containers addObject: contentContainer];
}

- (void) addViews {
    [super addViews];
    sidebarContainer.width = defaultSidebarWidth;
    sidebarContainer.minimumWidth = defaultSidebarWidth;
    sidebarContainer.isLocked = YES;
}


- (void) setSidebarView: (NSView *) subview {
    if (subview == nil) sidebarContainer = nil;
    else {
        sidebarContainer = [[SplitViewContainer alloc] init];
        [sidebarContainer embedView: subview];
        [self updateViews];
    }
}


@end