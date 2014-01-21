//
// Created by Dani Postigo on 1/20/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "NSView+ConstraintFinders.h"

@implementation NSView (ConstraintFinders)

- (NSArray *) constraintsForItem: (id) item {
    NSMutableArray *ret = [[NSMutableArray alloc] init];

    NSArray *constraints = [NSArray arrayWithArray: self.constraints];
    for (NSLayoutConstraint *constraint in constraints) {
        if (constraint.firstItem && (constraint.firstItem == item || constraint.secondItem == item)) {
            [ret addObject: constraint];
        }
    }

    return ret;
}

- (NSArray *) constraintsForItem: (id) item excludeNibConstraints: (BOOL) includeNibs {
    NSMutableArray *ret = [[NSMutableArray alloc] init];

    NSArray *constraints = [NSArray arrayWithArray: self.constraints];
    for (NSLayoutConstraint *constraint in constraints) {

        if (constraint.firstItem && (constraint.firstItem == item || constraint.secondItem == item)) {
            [ret addObject: constraint];
            break;
        }
    }

    return ret;
}
@end