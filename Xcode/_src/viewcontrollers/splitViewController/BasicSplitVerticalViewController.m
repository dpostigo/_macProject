//
//  BasicSplitVerticalViewController.m
//  Carts
//
//  Created by Daniela Postigo on 9/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicSplitVerticalViewController.h"

@implementation BasicSplitVerticalViewController {

}

- (CGFloat) basicSplitView: (BasicSplitView *) splitview constrainSplitPosition: (CGFloat) proposed atIndex: (NSInteger) index {
    CGFloat ret = [splitview heightForSplitContainerAtIndex: index proposedHeight: proposed];
    return ret;
}

- (CGFloat) basicSplitView: (BasicSplitView *) splitview constrainMinCoordinate: (CGFloat) proposed atIndex: (NSInteger) index {
    CGFloat ret = [splitview heightForSplitContainerAtIndex: index proposedHeight: proposed];
    NSLog(@"ret = %f", ret);
    return ret;

}

- (CGFloat) basicSplitView: (BasicSplitView *) splitview constrainMaxCoordinate: (CGFloat) proposed atIndex: (NSInteger) index {
    CGFloat ret = [splitview heightForSplitContainerAtIndex: index proposedHeight: proposed];
    return ret;
}


@end