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
@end