//
//  DPSplitView.m
//  TaskManager
//
//  Created by Daniela Postigo on 5/26/13.
//  Copyright 2013 Dani Postigo. All rights reserved.
//

#import "DPSplitViewContainer.h"
#import "DPSplitView.h"

@implementation DPSplitView

@synthesize dividerColor;
@synthesize secondDelegate;

- (void) setup {
    self.dividerColor = [NSColor darkGrayColor];
}


- (void) viewDidMoveToWindow {
    [super viewDidMoveToWindow];
    NSLog(@"%s", __PRETTY_FUNCTION__);

}

#pragma mark Getters


- (NSMutableArray *) splitContainers {
    if (privateContainers == nil) privateContainers = [[NSMutableArray alloc] init];
    return privateContainers;
}


#pragma mark Display customization

- (void) addViewController: (NSViewController *) viewController {
    DPSplitViewContainer *container = [[DPSplitViewContainer alloc] initWithFrame: viewController.view.frame];
    container.delegate = self;
    container.controller = viewController;
    [container embedView: viewController.view];
    viewController.view.frame = viewController.view.bounds;
    viewController.view = container;
    [self.splitContainers addObject: container];
    [self addSubview: container];

}

- (void) addSubview: (NSView *) aView {
    if (![aView isKindOfClass: [DPSplitViewContainer class]]) {
        DPSplitViewContainer *container = [[DPSplitViewContainer alloc] initWithFrame: aView.frame];
        container.delegate = self;
        [container embedView: aView];
        aView.frame = aView.bounds;
        aView = container;
        [self.splitContainers addObject: container];
    }
    [super addSubview: aView];
}


- (CGFloat) heightForSplitContainerAtIndex: (NSInteger) index proposedHeight: (CGFloat) proposed {
    CGFloat ret = proposed;
    CGFloat containersHeight;
    DPSplitViewContainer *splitContainer = [self.splitContainers objectAtIndex: index];
    DPSplitViewContainer *sizableContainer = [self sizableContainerForIndex: index];

    if (splitContainer == sizableContainer) {
        ret = [self adjustedHeightForSplitContainer: splitContainer proposedHeight: proposed];
        containersHeight = self.height - (self.dividerThickness * [self.splitContainers count]) - splitContainer.height;
    } else {
        CGFloat sizableProposedHeight = self.height - proposed;
        ret = [self adjustedHeightForSplitContainer: sizableContainer proposedHeight: sizableProposedHeight];
        ret = self.height - ret;
    }
    return ret;
}

- (CGFloat) widthForSplitContainerAtIndex: (NSInteger) index proposedWidth: (CGFloat) proposed {
    CGFloat ret = proposed;
    // CGFloat containersHeight;
    DPSplitViewContainer *splitContainer = [self.splitContainers objectAtIndex: index];
    DPSplitViewContainer *sizableContainer = [self sizableContainerForIndex: index];

    if (splitContainer == sizableContainer) {
        ret = [self adjustedWidthForSplitContainer: splitContainer proposedWidth: proposed];
        //        containersHeight = self.width - (self.dividerThickness * [self.splitContainers count]) - splitContainer.height;
    } else {
        CGFloat sizableProposedHeight = self.width - proposed;
        ret = [self adjustedWidthForSplitContainer: sizableContainer proposedWidth: sizableProposedHeight];
        ret = self.width - ret;
    }
    return ret;
}


- (CGFloat) adjustedHeightForSplitContainer: (DPSplitViewContainer *) splitContainer proposedHeight: (CGFloat) proposed {
    CGFloat ret = proposed;
    if (splitContainer.minimumValue > 0 && proposed < splitContainer.minimumValue) {
        ret = splitContainer.minimumValue;
    }
    if (splitContainer.maximumValue > 0 && proposed > splitContainer.maximumValue) {
        ret = splitContainer.maximumValue;
    }
    return ret;

}

- (CGFloat) adjustedWidthForSplitContainer: (DPSplitViewContainer *) splitContainer proposedWidth: (CGFloat) proposed {
    CGFloat ret = proposed;
    if (splitContainer.minimumValue > 0 && proposed < splitContainer.minimumValue) {
        ret = splitContainer.minimumValue;
    }
    if (splitContainer.maximumValue > 0 && proposed > splitContainer.maximumValue) {
        ret = splitContainer.maximumValue;
    }
    return ret;
}




#pragma mark Delegate

- (void) notifyDelegate: (SEL) selector withObject: (id) object object: (id) object2 {
    if (secondDelegate && [secondDelegate respondsToSelector: selector]) {
        [secondDelegate performSelector: selector withObject: object withObject: object2];
    }
}


#pragma mark Init

- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {[self setup];}
    return self;
}

- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {[self setup];}
    return self;
}


#pragma mark Helpers


- (DPSplitViewContainer *) sizableContainerForIndex: (NSInteger) index {
    DPSplitViewContainer *ret = [self.splitContainers objectAtIndex: index];
    if (ret.minimumValue == 0 && ret.maximumValue == 0) {
        ret = [self alternateContainerForIndex: index];
    }
    return ret;

}

- (DPSplitViewContainer *) alternateContainerForIndex: (NSUInteger) index {
    DPSplitViewContainer *ret = nil;
    if ([self.splitContainers count] > 0) {
        ret = [self.splitContainers objectAtIndex: (index == 0 ? 1 : index - 1)];
    }
    return ret;
}

#pragma mark Old

- (DPSplitViewContainer *) splitViewContainerAtIndex: (NSInteger) index {
    NSView *subview = [self.subviews objectAtIndex: index];
    if (subview && [subview isKindOfClass: [DPSplitViewContainer class]]) {
        DPSplitViewContainer *container = (DPSplitViewContainer *) subview;
        return container;
    }
    return nil;
}


#pragma mark SplitViewContainerDelegate

- (void) splitContainerChangedMinimumValue: (DPSplitViewContainer *) splitContainer {
    if (self.isVertical) {
        splitContainer.width = [self widthForSplitContainerAtIndex: [self.splitContainers indexOfObject: splitContainer] proposedWidth: splitContainer.width];
    } else {
        splitContainer.height = [self heightForSplitContainerAtIndex: [self.splitContainers indexOfObject: splitContainer] proposedHeight: splitContainer.width];
    }
}

- (void) splitContainerChangedMaximumValue: (DPSplitViewContainer *) splitContainer {
    if (self.isVertical) {
        splitContainer.width = [self widthForSplitContainerAtIndex: [self.splitContainers indexOfObject: splitContainer] proposedWidth: splitContainer.width];
    } else {
        splitContainer.height = [self heightForSplitContainerAtIndex: [self.splitContainers indexOfObject: splitContainer] proposedHeight: splitContainer.width];
    }

}


@end