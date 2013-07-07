//
// Created by Daniela Postigo on 5/18/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicSplitViewController.h"


@implementation BasicSplitViewController {
}


@synthesize dividerEnabled;
@synthesize splitView;
@synthesize sidebar;
@synthesize contentView;
@synthesize footer;

@synthesize defaultSidebarWidth;

@synthesize delegate;

- (id) initWithDefaultNib {
    self = [super initWithDefaultNib];
    if (self) {
        delegate = [[DPSplitViewDelegate alloc] init];
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
    return [delegate dpSplitView: dpSplit limitedCoordinateForValue: proposedMinimumPosition atDividerIndex: dividerIndex];
}


- (CGFloat) splitView: (NSSplitView *) splitView1 constrainMaxCoordinate: (CGFloat) proposedMaximumPosition ofSubviewAt: (NSInteger) dividerIndex {
    CGFloat ret = proposedMaximumPosition;
    DPSplitView *dpSplit = (DPSplitView *) splitView1;
    return [delegate dpSplitView: dpSplit limitedCoordinateForValue: proposedMaximumPosition atDividerIndex: dividerIndex];
}


- (CGFloat) splitView: (NSSplitView *) splitView1 constrainSplitPosition: (CGFloat) proposedPosition ofSubviewAt: (NSInteger) dividerIndex {
    DPSplitView *dpSplit = (DPSplitView *) splitView1;
    return [delegate dpSplitView: dpSplit limitedCoordinateForValue: proposedPosition atDividerIndex: dividerIndex];
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


#pragma mark Resize

- (void) splitViewWillResizeSubviews: (NSNotification *) notification {
    //    NSLog(@"%s", __PRETTY_FUNCTION__);

}

- (void) splitViewDidResizeSubviews: (NSNotification *) notification {
    //    NSLog(@"%s", __PRETTY_FUNCTION__);

}


@end