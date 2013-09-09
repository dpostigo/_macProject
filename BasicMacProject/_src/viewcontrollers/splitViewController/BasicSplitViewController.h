//
// Created by Daniela Postigo on 5/18/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicViewController.h"
#import "SplitViewContainer.h"
#import "BasicSplitView.h"

@class SplitViewContainer;

@protocol BasicSplitViewControllerDelegate <NSObject>

@optional

@end

@interface BasicSplitViewController : BasicViewController <NSSplitViewDelegate, BasicSplitViewDelegate> {
    BOOL dividerEnabled;
    IBOutlet BasicSplitView *splitView;

}

@property(nonatomic) BOOL dividerEnabled;
@property(nonatomic, strong) BasicSplitView *splitView;
- (SplitViewContainer *) splitViewContainerAtIndex: (NSInteger) index1;
- (SplitViewContainer *) splitContainerAtIndex: (NSInteger) index1;
- (void) addViewController: (NSViewController *) controller;
- (CGFloat) basicSplitView: (BasicSplitView *) splitview constrainSplitPosition: (CGFloat) proposedPosition atIndex: (NSInteger) index;
- (CGFloat) basicSplitView: (BasicSplitView *) splitview constrainMinCoordinate: (CGFloat) proposedMinimumPosition atIndex: (NSInteger) dividerIndex;
- (CGFloat) basicSplitView: (BasicSplitView *) splitview constrainMaxCoordinate: (CGFloat) proposedMaximumPosition atIndex: (NSInteger) dividerIndex;
- (BOOL) basicSplitView: (BasicSplitView *) splitview shouldAdjustSizeOfSplitContainer: (SplitViewContainer *) splitContainer;
@end