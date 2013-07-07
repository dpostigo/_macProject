//
//  DPSplitViewDelegate.m
//  Carts
//
//  Created by Daniela Postigo on 7/6/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "DPSplitViewDelegate.h"


@implementation DPSplitViewDelegate {

}






#pragma mark DPSplitView

@synthesize factorsDividerWidth;

- (id) init {
    self = [super init];
    if (self) {
//        self.factorsDividerWidth = YES;

    }

    return self;
}


- (CGFloat) dpSplitView: (DPSplitView *) dpSplit limitedCoordinateForValue: (CGFloat) proposedValue atDividerIndex: (NSInteger) dividerIndex {
    CGFloat ret = proposedValue;
    SplitViewContainer *splitContainer = [dpSplit splitViewContainerAtIndex: dividerIndex];
    if (splitContainer) {
        ret = [self limitedCoordinateForSplitContainer: splitContainer forProposedValue: proposedValue splitView: dpSplit];
    }
    return ret;
}

- (CGFloat) limitedCoordinateForSplitContainer: (SplitViewContainer *) splitContainer forProposedValue: (CGFloat) proposedValue splitView: (DPSplitView *) dpSplit {
    CGFloat ret = proposedValue;
    if (dpSplit.isVertical) {
        ret = [self verticalSplitView: dpSplit limitCoordinate: splitContainer forProposedValue: proposedValue];
    } else {
        ret = [self horizontalSplitView: dpSplit limitCoordinate: splitContainer forProposedValue: proposedValue];
    }
    return ret;
}




#pragma mark DPSplitView Vertical


- (CGFloat) verticalSplitView: (DPSplitView *) dpSplit limitCoordinate: (SplitViewContainer *) splitContainer forProposedValue: (CGFloat) proposedValue {
    CGFloat ret = proposedValue;
    CGFloat min = splitContainer.minimumWidth - (factorsDividerWidth ? dpSplit.dividerThickness : 0);
    CGFloat max = splitContainer.maximumWidth - (factorsDividerWidth ? dpSplit.dividerThickness : 0);
    if (min > 0 && proposedValue < min) ret = min;
    if (max > 0 && proposedValue > max) ret = max;
    return ret;
}



#pragma mark DPSplitView Horizontal

- (CGFloat) horizontalSplitView: (DPSplitView *) dpSplit limitCoordinate: (SplitViewContainer *) splitContainer forProposedValue: (CGFloat) proposedValue {
    CGFloat ret = proposedValue;

    if (splitContainer.minimumHeight == 0 || splitContainer.maximumHeight == 0) {
        SplitViewContainer *otherContainer = [dpSplit otherSplitContainer: splitContainer];
        if (otherContainer.minimumHeight > 0 || otherContainer.maximumHeight > 0) {
            CGFloat totalHeight = dpSplit.height;
            CGFloat newMinimumHeight = totalHeight - otherContainer.maximumHeight;
            CGFloat newMaximumHeight = totalHeight - otherContainer.minimumHeight;
            splitContainer.minimumHeight = newMinimumHeight;
            splitContainer.maximumHeight = newMaximumHeight;
        }
    }

    if (splitContainer.minimumHeight > 0 && proposedValue < splitContainer.minimumHeight) {
        ret = splitContainer.minimumHeight;
    }

    if (splitContainer.maximumHeight > 0 && proposedValue > splitContainer.maximumHeight) {
        ret = splitContainer.maximumHeight;
    }

    return ret;
}


@end