//
//  NSView+DPUtils.m
//  Carts
//
//  Created by Daniela Postigo on 11/11/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSView+DPUtils.h"

@implementation NSView (DPUtils)

- (void) safeRemove: (NSView *) subview {
    if (subview) {
        if (subview.superview) [subview removeFromSuperview];
    }
}

- (void) insertSubview: (NSView *) subview atIndex: (NSUInteger) index {

    NSInteger numSubviews = [self.subviews count];

    if (numSubviews == 0)
        [self addSubview: subview];

    else {
        NSView *lastSubview = [self.subviews objectAtIndex: index];
        [self addSubview: subview positioned: NSWindowBelow relativeTo: lastSubview];
    }
}


@end