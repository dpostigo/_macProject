//
//  BasicVerticalSplitViewController.m
//  Carts
//
//  Created by Daniela Postigo on 7/10/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicVerticalSplitViewController.h"


@implementation BasicVerticalSplitViewController {
}

@synthesize headerContainer;
@synthesize footerContainer;


- (void) loadView {
    [super loadView];
    [splitView setVertical: NO];
}

- (void) collectViews {
    if (headerContainer) [containers addObject: headerContainer];
    if (contentContainer) [containers addObject: contentContainer];
    if (footerContainer) [containers addObject: footerContainer];
}


#pragma mark Getters & Setters

- (void) setFooterView: (NSView *) subview {
    if (subview == nil) footerContainer = nil;
    else {
        footerContainer = [[SplitViewContainer alloc] init];
        [footerContainer embedView: subview];
        [self updateViews];
    }
}

- (void) setHeaderView: (NSView *) subview {
    if (subview == nil) headerContainer = nil;
    else {
        headerContainer = [[SplitViewContainer alloc] init];
        [headerContainer embedView: subview];
        [self updateViews];
    }
}



@end