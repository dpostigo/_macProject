//
//  BasicSplitHorizontalViewController.m
//  Carts
//
//  Created by Daniela Postigo on 9/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicSplitHorizontalViewController.h"
#import "BasicSplitView.h"

@implementation BasicSplitHorizontalViewController {

}

#pragma mark Getters

- (BasicSplitView *) splitView {
    if (splitView == nil) {
        splitView = [[BasicSplitView alloc] initWithFrame: self.view.bounds];
        splitView.delegate = self;
        splitView.secondDelegate = self;
        [splitView setVertical: YES];
        [self embedView: splitView inView: self.view];
    }
    return splitView;
}

- (CGFloat) basicSplitView: (BasicSplitView *) splitview constrainSplitPosition: (CGFloat) proposed atIndex: (NSInteger) index {
    CGFloat ret = [splitview widthForSplitContainerAtIndex: index proposedWidth: proposed];
    return ret;
}

- (CGFloat) basicSplitView: (BasicSplitView *) splitview constrainMinCoordinate: (CGFloat) proposed atIndex: (NSInteger) index {
    CGFloat ret = [splitview widthForSplitContainerAtIndex: index proposedWidth: proposed];
    return ret;

}

- (CGFloat) basicSplitView: (BasicSplitView *) splitview constrainMaxCoordinate: (CGFloat) proposed atIndex: (NSInteger) index {
    CGFloat ret = [splitview widthForSplitContainerAtIndex: index proposedWidth: proposed];
    return ret;
}


@end