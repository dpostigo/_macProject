//
// Created by Dani Postigo on 1/7/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import "NSView+ConstraintModifiers.h"

@implementation NSView (ConstraintModifiers)

- (NSArray *) constraintsModifiedToItem: (id) item {
    return [self constraintsModifiedToItem: item constraints: [NSArray arrayWithArray: self.constraints]];
}


- (NSArray *) constraintsModifiedToItem: (id) item constraints: (NSArray *) constraints {
    NSMutableArray *ret = [[NSMutableArray alloc] init];

    for (NSLayoutConstraint *constraint in constraints) {
        if (constraint.firstItem == self) {
            NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem: item attribute: constraint.firstAttribute relatedBy: constraint.relation toItem: constraint.secondItem attribute: constraint.secondAttribute multiplier: constraint.multiplier constant: constraint.constant];
            [ret addObject: newConstraint];
        } else if (constraint.secondItem == self) {
            NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem: constraint.firstItem attribute: constraint.firstAttribute relatedBy: constraint.relation toItem: item attribute: constraint.secondAttribute multiplier: constraint.multiplier constant: constraint.constant];
            [ret addObject: newConstraint];
        } else {
            [ret addObject: constraint];
        }
    }
    return ret;
}

@end