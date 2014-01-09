//
// Created by Daniela Postigo on 5/18/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "DPSplitViewController.h"

@implementation DPSplitViewController {
}

@synthesize dividerEnabled;
@synthesize splitView;


#pragma mark Getters


- (DPSplitView *) splitView {
    if (splitView == nil) {
        splitView = [[DPSplitView alloc] initWithFrame: self.view.bounds];
        splitView.delegate = self;
        splitView.secondDelegate = self;
        [self embedView: splitView inView: self.view];
    }
    return splitView;
}

- (void) loadView {
    [super loadView];

    self.splitView.dividerStyle = NSSplitViewDividerStyleThin;
    self.dividerEnabled = YES;

}




#pragma mark NSSplitViewDelegate


- (CGFloat) splitView: (NSSplitView *) splitView1 constrainMinCoordinate: (CGFloat) proposedMinimumPosition ofSubviewAt: (NSInteger) dividerIndex {
    CGFloat ret = proposedMinimumPosition;

    if ([splitView1 isKindOfClass: [DPSplitView class]]) {
        DPSplitView *basicSplitView = (DPSplitView *) splitView1;
        if ([basicSplitView.splitContainers count] > 0) {
            ret = [self basicSplitView: basicSplitView constrainMinCoordinate: proposedMinimumPosition atIndex: dividerIndex];
        }
    }

    return ret;
}

- (CGFloat) splitView: (NSSplitView *) splitView1 constrainMaxCoordinate: (CGFloat) proposedMaximumPosition ofSubviewAt: (NSInteger) dividerIndex {
    CGFloat ret = proposedMaximumPosition;
    if ([splitView1 isKindOfClass: [DPSplitView class]]) {
        DPSplitView *basicSplitView = (DPSplitView *) splitView1;
        if ([basicSplitView.splitContainers count] > 0) {
            ret = [self basicSplitView: basicSplitView constrainMaxCoordinate: proposedMaximumPosition atIndex: dividerIndex];
        }
    }
    return ret;
}

- (CGFloat) splitView: (NSSplitView *) splitView1 constrainSplitPosition: (CGFloat) proposedPosition ofSubviewAt: (NSInteger) dividerIndex {

    CGFloat ret = 0;
    if ([splitView1 isKindOfClass: [DPSplitView class]]) {
        DPSplitView *basicSplitView = (DPSplitView *) splitView1;
        if ([basicSplitView.splitContainers count] > 0) {
            ret = [self basicSplitView: basicSplitView constrainSplitPosition: proposedPosition atIndex: dividerIndex];
        }
    }
    return ret;
}

- (BOOL) splitView: (NSSplitView *) splitView1 shouldAdjustSizeOfSubview: (NSView *) view1 {
    BOOL ret = YES;

    if ([splitView1 isKindOfClass: [DPSplitView class]]) {
        // DPSplitView *basicSplitView = (DPSplitView *) splitView1;
        DPSplitViewContainer *splitContainer = (DPSplitViewContainer *) view1;
        ret = [self basicSplitView: splitView shouldAdjustSizeOfSplitContainer: splitContainer];
    }
    return ret;
}


- (NSRect) splitView: (NSSplitView *) splitView1 effectiveRect: (NSRect) proposedEffectiveRect forDrawnRect: (NSRect) drawnRect ofDividerAtIndex: (NSInteger) dividerIndex {

    NSRect ret = NSZeroRect;
    if (dividerEnabled) {
        ret = proposedEffectiveRect;
    }
    //    NSLog(@"ret = %@", NSStringFromRect(ret));
    return ret;
}

- (BOOL) splitView: (NSSplitView *) splitView1 shouldHideDividerAtIndex: (NSInteger) dividerIndex {
    //NSLog(@"dividerIndex = %li", dividerIndex);
    return NO;
}



#pragma mark Resize

- (void) splitViewWillResizeSubviews: (NSNotification *) notification {
    //    NSLog(@"%s", __PRETTY_FUNCTION__);
    //    for (DPSplitViewContainer *splitContainer in splitView.splitContainers) {
    //        NSUInteger index = [splitView.splitContainers indexOfObject: splitContainer];
    //        if (splitView.isVertical) {
    //            splitContainer.width = [splitView widthForSplitContainerAtIndex: index proposedWidth: splitContainer.width];
    //        } else {
    //            splitContainer.height = [splitView heightForSplitContainerAtIndex: index proposedHeight: splitContainer.height];
    //        }
    //    }

}

- (void) splitViewDidResizeSubviews: (NSNotification *) notification {

}


#pragma mark BasicSplitViewController Delegate



- (CGFloat) basicSplitView: (DPSplitView *) splitview constrainSplitPosition: (CGFloat) proposedPosition atIndex: (NSInteger) index {
    CGFloat ret = proposedPosition;
    return ret;
}


- (CGFloat) basicSplitView: (DPSplitView *) splitview constrainMinCoordinate: (CGFloat) proposedMinimumPosition atIndex: (NSInteger) dividerIndex {
    CGFloat ret = proposedMinimumPosition;
    return ret;

}

- (CGFloat) basicSplitView: (DPSplitView *) splitview constrainMaxCoordinate: (CGFloat) proposedMaximumPosition atIndex: (NSInteger) dividerIndex {
    CGFloat ret = proposedMaximumPosition;
    return ret;
}


- (BOOL) basicSplitView: (DPSplitView *) splitview shouldAdjustSizeOfSplitContainer: (DPSplitViewContainer *) splitContainer {
    BOOL ret = YES;
    ret = !splitContainer.isLocked;
    return ret;
}




#pragma mark BasicSplitViewDelegate


- (void) basicSplitView: (DPSplitView *) basicSplitView didResizeSplitContainer: (DPSplitViewContainer *) splitContainer {
    // NSUInteger index = [basicSplitView.splitContainers indexOfObject: splitContainer];
    //    [self basicSplitView: basicSplitView didResizeSplitContainerAtIndex: index];

}

- (void) basicSplitView: (DPSplitView *) basicSplitView didResizeSplitContainerAtIndex: (NSUInteger) index {
    //    NSLog(@"%s %lu", __PRETTY_FUNCTION__, index);
}




#pragma mark Init


- (void) addViewController: (NSViewController *) controller {
    [self.splitView addViewController: controller];
}


- (DPSplitViewContainer *) splitContainerAtIndex: (NSUInteger) index {
    return [self.splitView splitViewContainerAtIndex: index];
}
@end