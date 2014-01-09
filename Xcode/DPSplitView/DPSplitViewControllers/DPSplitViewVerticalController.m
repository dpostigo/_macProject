//
//  DPSplitViewVerticalController.m
//  Carts
//
//  Created by Daniela Postigo on 9/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "DPSplitViewVerticalController.h"

@implementation DPSplitViewVerticalController {

}

- (CGFloat) basicSplitView: (DPSplitView *) splitview constrainSplitPosition: (CGFloat) proposed atIndex: (NSInteger) index {
    CGFloat ret = [splitview heightForSplitContainerAtIndex: index proposedHeight: proposed];
    return ret;
}

- (CGFloat) basicSplitView: (DPSplitView *) splitview constrainMinCoordinate: (CGFloat) proposed atIndex: (NSInteger) index {
    CGFloat ret = [splitview heightForSplitContainerAtIndex: index proposedHeight: proposed];
    NSLog(@"ret = %f", ret);
    return ret;

}

- (CGFloat) basicSplitView: (DPSplitView *) splitview constrainMaxCoordinate: (CGFloat) proposed atIndex: (NSInteger) index {
    CGFloat ret = [splitview heightForSplitContainerAtIndex: index proposedHeight: proposed];
    return ret;
}


@end