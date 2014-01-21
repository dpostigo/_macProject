//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "DDSplitViewContainer.h"

@implementation DDSplitViewContainer

@synthesize minimumValue;
@synthesize maximumValue;
@synthesize isLocked;

@synthesize lockedValue;

- (void) setIsLocked: (BOOL) isLocked1 {
    isLocked = isLocked1;
    if (isLocked && lockedValue == 0) {
        lockedValue = self.width;
    }
}


- (NSView *) subview {
    return [self.subviews objectAtIndex: 0];
}


- (void) setupConstraints {
    NSView *view = self.subview;
    view.frame = view.bounds;
    view.translatesAutoresizingMaskIntoConstraints = NO;

    [self addConstraint: [NSLayoutConstraint constraintWithItem: view attribute: NSLayoutAttributeLeading relatedBy: NSLayoutRelationEqual toItem: self attribute: NSLayoutAttributeLeading multiplier: 1.0 constant: 0]];
    [self addConstraint: [NSLayoutConstraint constraintWithItem: view attribute: NSLayoutAttributeTrailing relatedBy: NSLayoutRelationEqual toItem: self attribute: NSLayoutAttributeTrailing multiplier: 1.0 constant: 0]];
    [self addConstraint: [NSLayoutConstraint constraintWithItem: view attribute: NSLayoutAttributeTop relatedBy: NSLayoutRelationEqual toItem: self attribute: NSLayoutAttributeTop multiplier: 1.0 constant: 0]];
    [self addConstraint: [NSLayoutConstraint constraintWithItem: view attribute: NSLayoutAttributeBottom relatedBy: NSLayoutRelationEqual toItem: self attribute: NSLayoutAttributeBottom multiplier: 1.0 constant: 0]];
}


@end