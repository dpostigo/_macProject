//
//  BasicLayoutViewController.m
//  Carts
//
//  Created by Daniela Postigo on 9/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicLayoutViewController.h"

@implementation BasicLayoutViewController {

}

@synthesize footerIndex;




- (SplitViewContainer *) footerContainer {
    SplitViewContainer *ret = nil;
    NSUInteger length = [self.splitView.subviews count];
    if (length > 0) {
        ret = [self.splitView.subviews objectAtIndex: length - 1];
    }
    return ret;
}


- (void) addFooterViewController: (NSViewController *) controller {
    self.footerIndex = [self.splitView.splitContainers count];
    [self addViewController: controller];
}

#pragma mark Overrides

- (BOOL) basicSplitView: (BasicSplitView *) splitview shouldAdjustSizeOfSplitContainer: (SplitViewContainer *) splitContainer {
    BOOL ret = [super basicSplitView: splitview shouldAdjustSizeOfSplitContainer: splitContainer];

    if (splitContainer == self.footerContainer) {
        ret = NO;
    }
    return ret;
}


@end