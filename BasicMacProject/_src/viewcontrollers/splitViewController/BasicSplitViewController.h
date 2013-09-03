//
// Created by Daniela Postigo on 5/18/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicViewController.h"
#import "SplitViewContainer.h"
#import "DPSplitView.h";
#import "DPSplitViewDelegate.h"


@interface BasicSplitViewController : BasicViewController <NSSplitViewDelegate> {
    BOOL dividerEnabled;
    IBOutlet DPSplitView *splitView;


    CGFloat defaultSidebarWidth;
    DPSplitViewDelegate *delegate;

}


@property(nonatomic) BOOL dividerEnabled;
@property(nonatomic, strong) DPSplitView *splitView;
@property(nonatomic, strong) SplitViewContainer *sidebar;
//@property(nonatomic, strong) SplitViewContainer *contentView;
@property(nonatomic, strong) SplitViewContainer *footer;
@property(nonatomic) CGFloat defaultSidebarWidth;
@property(nonatomic, strong) DPSplitViewDelegate *delegate;
- (SplitViewContainer *) splitViewContainerAtIndex: (NSInteger) index1;
//- (CGFloat) dpSplitView: (DPSplitView *) dpSplit limitedCoordinateForValue: (CGFloat) proposedValue atDividerIndex: (NSInteger) dividerIndex;
//- (CGFloat) limitedCoordinateForSplitContainer: (SplitViewContainer *) splitContainer forProposedValue: (CGFloat) proposedValue splitView: (DPSplitView *) dpSplit;
//- (CGFloat) verticalSplitView: (DPSplitView *) dpSplit limitCoordinate: (SplitViewContainer *) splitContainer forProposedValue: (CGFloat) proposedValue;
//- (CGFloat) horizontalSplitView: (DPSplitView *) dpSplit limitCoordinate: (SplitViewContainer *) splitContainer forProposedValue: (CGFloat) proposedValue;
@end