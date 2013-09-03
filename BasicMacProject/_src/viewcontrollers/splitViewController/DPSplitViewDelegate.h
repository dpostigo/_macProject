//
//  DPSplitViewDelegate.h
//  Carts
//
//  Created by Daniela Postigo on 7/6/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPSplitView.h"
#import "SplitViewContainer.h"


@interface DPSplitViewDelegate : NSObject {
    BOOL factorsDividerWidth;

}

@property(nonatomic) BOOL factorsDividerWidth;
- (CGFloat) dpSplitView: (DPSplitView *) dpSplit limitedCoordinateForValue: (CGFloat) proposedValue atDividerIndex: (NSInteger) dividerIndex;
- (CGFloat) limitedCoordinateForSplitContainer: (SplitViewContainer *) splitContainer forProposedValue: (CGFloat) proposedValue splitView: (DPSplitView *) dpSplit;
- (CGFloat) horizontalSplitView: (DPSplitView *) dpSplit limitCoordinate: (SplitViewContainer *) splitContainer forProposedValue: (CGFloat) proposedValue;
@end