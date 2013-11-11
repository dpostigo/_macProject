//
//  NSLayoutConstraint+DPUtils.m
//  Carts
//
//  Created by Daniela Postigo on 11/1/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSLayoutConstraint+DPUtils.h"
#import "AutoLayoutHelpers.h"

@implementation NSLayoutConstraint (DPUtils)

+ (NSArray *) widthConstraintsForView: (NSView *) aView superview: (NSView *) superview {
    return [NSArray arrayWithObject: constraintWidth(aView, superview)];
}


@end