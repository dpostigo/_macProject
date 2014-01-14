//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "DDSplitView.h"
#import "DDSplitViewContainer.h"
#import "NSView+SuperConstraints.h"

@implementation DDSplitView

@synthesize containers;
@synthesize isAwake;
@synthesize sidebarIndex;

@synthesize splitDividerColor;

- (void) awakeFromNib {
    [super awakeFromNib];

    self.dividerStyle = NSSplitViewDividerStyleThin;
    super.delegate = self;

    isAwake = YES;

    [self setSubviews: [self containersFromSubviews: self.subviews]];
}


- (NSColor *) splitDividerColor {
    if (splitDividerColor == nil) {
        splitDividerColor = [NSColor grayColor];
    }
    return splitDividerColor;
}


- (NSColor *) dividerColor {
    return self.splitDividerColor;
}



#pragma mark Containers


- (NSView *) subviewAtIndex: (NSInteger) index {
    return [self.subviews objectAtIndex: index];
}


- (DDSplitViewContainer *) containerAtIndex: (NSInteger) index {
    return [self containerForSubviewAtIndex: index];
}

- (DDSplitViewContainer *) containerForSubviewAtIndex: (NSInteger) index {
    DDSplitViewContainer *ret = nil;
    NSView *view = [self subviewAtIndex: index];
    if ([view isKindOfClass: [DDSplitViewContainer class]]) {
        ret = (DDSplitViewContainer *) view;
    } else {
        ret = [[DDSplitViewContainer alloc] initWithFrame: view.frame];
        [self replaceSubview: view with: ret];
        [ret addSubview: view];
        view.frame = view.bounds;
        view.translatesAutoresizingMaskIntoConstraints = NO;

        [ret addConstraint: [NSLayoutConstraint constraintWithItem: view attribute: NSLayoutAttributeLeading relatedBy: NSLayoutRelationEqual toItem: ret attribute: NSLayoutAttributeLeading multiplier: 1.0 constant: 0]];
        [ret addConstraint: [NSLayoutConstraint constraintWithItem: view attribute: NSLayoutAttributeTrailing relatedBy: NSLayoutRelationEqual toItem: ret attribute: NSLayoutAttributeTrailing multiplier: 1.0 constant: 0]];
        [ret addConstraint: [NSLayoutConstraint constraintWithItem: view attribute: NSLayoutAttributeTop relatedBy: NSLayoutRelationEqual toItem: ret attribute: NSLayoutAttributeTop multiplier: 1.0 constant: 0]];
        [ret addConstraint: [NSLayoutConstraint constraintWithItem: view attribute: NSLayoutAttributeBottom relatedBy: NSLayoutRelationEqual toItem: ret attribute: NSLayoutAttributeBottom multiplier: 1.0 constant: 0]];
    }
    return ret;
}

- (NSArray *) containersFromSubviews: (NSArray *) subviews {
    subviews = [NSArray arrayWithArray: subviews];
    NSMutableArray *ret = [[NSMutableArray alloc] init];

    for (int j = 0; j < [subviews count]; j++) {
        DDSplitViewContainer *container = [self containerForSubviewAtIndex: j];
        [ret addObject: container];
    }

    return ret;
}



#pragma mark Actions At Index

- (void) setSubviewAtIndex: (NSInteger) index with: (NSView *) view {
    NSView *oldView = [self.subviews objectAtIndex: index];

    view.frame = oldView.frame;
    [self replaceSubview: oldView with: view];
    [self setContainers];
}


- (void) setMinimumValue: (CGFloat) value atIndex: (NSInteger) index {
    DDSplitViewContainer *container = [self containerAtIndex: index];
    container.minimumValue = value;
}

- (void) setContainers {
    NSArray *containerArray = [self containersFromSubviews: self.subviews];
    self.containers = [NSMutableArray arrayWithArray: containerArray];
    [self setSubviews: containerArray];
}

- (void) lockContainerAtIndex: (NSInteger) index {
    [self setContainers];

    DDSplitViewContainer *container = [self containerAtIndex: index];
    if (container) {
        container.isLocked = YES;
        //        NSLog(@"Locked -> %@", container.subview);
    }
}




#pragma mark Overrides

- (CGFloat) minPossiblePositionOfDividerAtIndex: (NSInteger) dividerIndex {
    CGFloat oldRet = [super minPossiblePositionOfDividerAtIndex: dividerIndex];
    CGFloat ret = oldRet;


    DDSplitViewContainer *left = [self containerAtIndex: dividerIndex];
    DDSplitViewContainer *right = [self containerAtIndex: dividerIndex + 1];
    if (left.isLocked) {

        ret = left.lockedValue + self.dividerThickness;
        //        NSLog(@"Locking -> %@, %f", left.subview, ret);

    } else if (right.isLocked) {
        // TODO : Right left lock
    }

    //    NSLog(@"%s, dividerIndex = %li, oldRet = %f, ret = %f", __PRETTY_FUNCTION__, dividerIndex, oldRet, ret);
    return oldRet;
}


- (CGFloat) maxPossiblePositionOfDividerAtIndex: (NSInteger) dividerIndex {
    CGFloat oldRet = [super maxPossiblePositionOfDividerAtIndex: dividerIndex];
    CGFloat ret = oldRet;

    //    NSLog(@"%s, dividerIndex = %li, ret = %f", __PRETTY_FUNCTION__, dividerIndex, ret);

    DDSplitViewContainer *left = [self containerAtIndex: dividerIndex];
    DDSplitViewContainer *right = [self containerAtIndex: dividerIndex + 1];

    if (left.isLocked) {

        ret = self.width - left.lockedValue + self.dividerThickness;
        ret = left.lockedValue + self.dividerThickness;
        //        NSLog(@"Locking -> = %@", left.subview);

    } else if (right.isLocked) {
        // TODO : Right left lock
    }

    //    NSLog(@"%s, dividerIndex = %li, oldRet = %f, ret = %f", __PRETTY_FUNCTION__, dividerIndex, oldRet, ret);

    return oldRet;
}




#pragma mark Overrides subviews resize


#pragma mark Delegate

- (void) setDelegate: (id <NSSplitViewDelegate>) delegate {
}

//
//
//- (CGFloat) splitView: (NSSplitView *) splitView constrainMinCoordinate: (CGFloat) proposedMinimumPosition ofSubviewAt: (NSInteger) dividerIndex {
//
//    CGFloat ret = proposedMinimumPosition;
//    DDSplitViewContainer *left = [self containerAtIndex: dividerIndex];
//    DDSplitViewContainer *right = [self containerAtIndex: dividerIndex + 1];
//
//    if (left.isLocked) {
//
//    }
//    NSLog(@"%s, dividerIndex = %li, ret = %f", __PRETTY_FUNCTION__, dividerIndex, ret);
//
//    return ret;
//}
//
- (CGFloat) splitView: (NSSplitView *) splitView constrainSplitPosition: (CGFloat) proposedPosition ofSubviewAt: (NSInteger) dividerIndex {

    CGFloat ret = proposedPosition;

    DDSplitViewContainer *left = [self containerAtIndex: dividerIndex];
    DDSplitViewContainer *right = [self containerAtIndex: dividerIndex + 1];


    CGFloat minValue = [self minPossiblePositionOfDividerAtIndex: dividerIndex];
    //
    //    if (left.isLocked) {
    //        ret = minValue + left.lockedValue;
    //
    //    } else if (left.minimumValue > 0) {
    //        if (proposedPosition <= minValue + left.minimumValue) {
    //            ret = minValue + left.minimumValue;
    //
    //        }
    //    }
    if (left.minimumValue > 0) {
        if (proposedPosition <= minValue + left.minimumValue) {
            ret = minValue + left.minimumValue;

        }
    }

    //    NSLog(@"%s, dividerIndex = %li, ret = %f", __PRETTY_FUNCTION__, dividerIndex, ret);

    return ret;
}


#pragma mark Sidebar index



#pragma mark Containers

- (NSMutableArray *) containers {
    if (containers == nil) {
        containers = [[NSMutableArray alloc] init];
    }
    return containers;
}

@end