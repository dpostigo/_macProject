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

@protocol BasicSplitViewControllerDelegate <NSObject>

@optional

@end

@interface DPSplitViewController : BasicFlippedViewController <NSSplitViewDelegate, DPSplitViewDelegate> {
    BOOL dividerEnabled;
    IBOutlet DPSplitView *splitView;

}

@property(nonatomic) BOOL dividerEnabled;
@property(nonatomic, strong) DPSplitView *splitView;
- (void) addViewController: (NSViewController *) controller;
- (DPSplitViewContainer *) splitContainerAtIndex: (NSUInteger) index1;
- (CGFloat) basicSplitView: (DPSplitView *) splitview constrainSplitPosition: (CGFloat) proposedPosition atIndex: (NSInteger) index;
- (CGFloat) basicSplitView: (DPSplitView *) splitview constrainMinCoordinate: (CGFloat) proposedMinimumPosition atIndex: (NSInteger) dividerIndex;
- (CGFloat) basicSplitView: (DPSplitView *) splitview constrainMaxCoordinate: (CGFloat) proposedMaximumPosition atIndex: (NSInteger) dividerIndex;
- (BOOL) basicSplitView: (DPSplitView *) splitview shouldAdjustSizeOfSplitContainer: (DPSplitViewContainer *) splitContainer;
@end