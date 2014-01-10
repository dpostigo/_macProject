//
// Created by Daniela Postigo on 5/18/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicFlippedViewController.h"
#import "DPSplitViewContainer.h"
#import "DPSplitView.h"

@class DPSplitViewContainer;

@interface DPSplitViewController : BasicFlippedViewController <NSSplitViewDelegate, DPSplitViewDelegate> {
    IBOutlet DPSplitView *splitView;
    BOOL dividerEnabled;
}

@property(nonatomic) BOOL dividerEnabled;
@property(nonatomic, strong) DPSplitView *splitView;


- (void) addViewController: (NSViewController *) controller;

- (BOOL) basicSplitView: (DPSplitView *) splitview shouldAdjustSizeOfSplitContainer: (DPSplitViewContainer *) splitContainer;
- (CGFloat) basicSplitView: (DPSplitView *) splitview constrainSplitPosition: (CGFloat) proposedPosition atIndex: (NSInteger) index;
- (CGFloat) basicSplitView: (DPSplitView *) splitview constrainMinCoordinate: (CGFloat) proposedMinimumPosition atIndex: (NSInteger) dividerIndex;
- (CGFloat) basicSplitView: (DPSplitView *) splitview constrainMaxCoordinate: (CGFloat) proposedMaximumPosition atIndex: (NSInteger) dividerIndex;


- (DPSplitViewContainer *) splitContainerAtIndex: (NSUInteger) index1;
@end