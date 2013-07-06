//
// Created by Daniela Postigo on 5/18/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicSplitViewController.h"
#import "SplitViewContainer.h"


@implementation BasicSplitViewController {
}


@synthesize dividerEnabled;
@synthesize splitView;
@synthesize sidebar;
@synthesize contentView;
@synthesize footer;

@synthesize defaultSidebarWidth;

- (id) initWithDefaultNib {
    self = [super initWithDefaultNib];
    if (self) {
        defaultSidebarWidth = 200.0;

    }

    return self;
}


- (void) loadView {
    [super loadView];


    if (splitView == nil) {
        splitView = [[DPSplitView alloc] initWithFrame: self.view.bounds];

    }
    splitView.dividerStyle = NSSplitViewDividerStyleThin;

    if (sidebar == nil) sidebar = [splitView.subviews objectAtIndex: 0];
    if (contentView == nil) {

        NSView *subview = [splitView.subviews objectAtIndex: 1];
        contentView = [[SplitViewContainer alloc] initWithFrame: subview.bounds];
        [self embedView: contentView inView: subview];
    }

    sidebar.width = defaultSidebarWidth;
    sidebar.minimumWidth = defaultSidebarWidth;
    sidebar.isLocked = YES;
    splitView.delegate = self;
    self.dividerEnabled = YES;
}




#pragma mark Helpers

- (SplitViewContainer *) splitViewContainerAtIndex: (NSInteger) index {
    NSView *subview = [splitView.subviews objectAtIndex: index];
    if (subview && [subview isKindOfClass: [SplitViewContainer class]]) {
        SplitViewContainer *container = (SplitViewContainer *) subview;
        return container;
    }
    return nil;
}


#pragma mark NSSplitViewDelegate


- (CGFloat) splitView: (NSSplitView *) splitView1 constrainMinCoordinate: (CGFloat) proposedMinimumPosition ofSubviewAt: (NSInteger) dividerIndex {
    CGFloat ret = proposedMinimumPosition;
    DPSplitView *dpSplit = (DPSplitView *) splitView1;
    return [self dpSplitView: dpSplit limitedCoordinateForValue: proposedMinimumPosition atDividerIndex: dividerIndex];
}


- (CGFloat) splitView: (NSSplitView *) splitView1 constrainMaxCoordinate: (CGFloat) proposedMaximumPosition ofSubviewAt: (NSInteger) dividerIndex {
    CGFloat ret = proposedMaximumPosition;
    DPSplitView *dpSplit = (DPSplitView *) splitView1;
    return [self dpSplitView: dpSplit limitedCoordinateForValue: proposedMaximumPosition atDividerIndex: dividerIndex];
}


- (CGFloat) splitView: (NSSplitView *) splitView1 constrainSplitPosition: (CGFloat) proposedPosition ofSubviewAt: (NSInteger) dividerIndex {
    DPSplitView *dpSplit = (DPSplitView *) splitView1;
    return [self dpSplitView: dpSplit limitedCoordinateForValue: proposedPosition atDividerIndex: dividerIndex];
}

- (BOOL) splitView: (NSSplitView *) splitView1 shouldAdjustSizeOfSubview: (NSView *) view1 {
    if ([view1 isKindOfClass: [SplitViewContainer class]]) {
        SplitViewContainer *splitContainer = (SplitViewContainer *) view1;
        return !splitContainer.isLocked;
    }
    return YES;
}
#pragma mark NSSplitViewDelegate Divider

- (NSRect) splitView: (NSSplitView *) splitView1 effectiveRect: (NSRect) proposedEffectiveRect forDrawnRect: (NSRect) drawnRect ofDividerAtIndex: (NSInteger) dividerIndex {
    if (dividerEnabled) {
        NSRect result = proposedEffectiveRect;
        return result;
    }
    return NSZeroRect;
}


#pragma mark DPSplitView

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

    CGFloat min = splitContainer.minimumWidth;
    CGFloat max = splitContainer.maximumWidth;


    if (min > 0 && proposedValue < min) {
        ret = min;
    }

    if (max > 0 && proposedValue > max) {
        ret = max;
    }
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