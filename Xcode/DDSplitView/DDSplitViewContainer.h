//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDSplitViewContainer : NSView {

    CGFloat minimumValue;
    CGFloat maximumValue;
    CGFloat lockedValue;

    BOOL isLocked;
}

@property(nonatomic) CGFloat minimumValue;
@property(nonatomic) CGFloat maximumValue;
@property(nonatomic) BOOL isLocked;
@property(nonatomic) CGFloat lockedValue;
- (NSView *) subview;
- (void) setupConstraints;
@end