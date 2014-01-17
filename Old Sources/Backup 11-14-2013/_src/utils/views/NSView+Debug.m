//
//  NSView+Debug.m
//  Carts
//
//  Created by Daniela Postigo on 11/3/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSView+Debug.h"

@implementation NSView (Debug)

- (void) logSubviewFrames {
    NSLog(@"%@ = %@, logSubviewFrames", self, NSStringFromRect(self.frame));

    for (int j = 0; j < [self.subviews count]; j++) {
        NSView *subview = [self.subviews objectAtIndex: j];
        NSLog(@"%@, frame for subview (%@) at index: %i, = %@", self, subview, j, NSStringFromRect(subview.frame));
    }
}
@end