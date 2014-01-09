//
//  DPSplitViewHorizontalController.m
//  Carts
//
//  Created by Daniela Postigo on 9/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "DPSplitViewHorizontalController.h"
#import "DPSplitView.h"

@implementation DPSplitViewHorizontalController {

}

#pragma mark Getters

- (DPSplitView *) splitView {
    if (splitView == nil) {
        splitView = [[DPSplitView alloc] initWithFrame: self.view.bounds];
        splitView.delegate = self;
        splitView.secondDelegate = self;
        [splitView setVertical: YES];
        [self embedView: splitView inView: self.view];
    }
    return splitView;
}

- (CGFloat) basicSplitView: (DPSplitView *) splitview constrainSplitPosition: (CGFloat) proposed atIndex: (NSInteger) index {
    CGFloat ret = [splitview widthForSplitContainerAtIndex: index proposedWidth: proposed];
    return ret;
}

- (CGFloat) basicSplitView: (DPSplitView *) splitview constrainMinCoordinate: (CGFloat) proposed atIndex: (NSInteger) index {
    CGFloat ret = [splitview widthForSplitContainerAtIndex: index proposedWidth: proposed];
    return ret;

}

- (CGFloat) basicSplitView: (DPSplitView *) splitview constrainMaxCoordinate: (CGFloat) proposed atIndex: (NSInteger) index {
    CGFloat ret = [splitview widthForSplitContainerAtIndex: index proposedWidth: proposed];
    return ret;
}


@end