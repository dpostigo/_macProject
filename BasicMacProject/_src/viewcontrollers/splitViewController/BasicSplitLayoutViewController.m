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

- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil {
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if (self) {
        containers = [[NSMutableArray alloc] init];
    }

    return self;
}


- (void) updateViews {
    [self clearViews];
    [self collectViews];
    [self addViews];
}

- (void) collectViews {

}

- (void) addViews {
    for (SplitViewContainer *container in containers) [splitView addSubview: container];
}

- (void) clearViews {
    for (SplitViewContainer *container in containers) [container removeFromSuperview];
    [containers removeAllObjects];
}

- (void) setContentView: (NSView *) subview {
    if (subview == nil) contentContainer = nil;
    else {
        contentContainer = [[SplitViewContainer alloc] init];
        [contentContainer embedView: subview];
        [self updateViews];
    }
}


@end