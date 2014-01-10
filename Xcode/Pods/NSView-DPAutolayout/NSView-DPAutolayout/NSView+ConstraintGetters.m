//
// Created by Dani Postigo on 12/28/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSView+ConstraintGetters.h"

@implementation NSView (ConstraintGetters)

- (NSLayoutConstraint *) leftConstraint {
    return [self constraintForAttribute: NSLayoutAttributeLeft];
}

- (NSLayoutConstraint *) leftConstraintForItem: (id) item {
    return [self constraintForAttribute: NSLayoutAttributeLeft item: item];
}

- (NSLayoutConstraint *) rightConstraint {
    return [self constraintForAttribute: NSLayoutAttributeRight];
}

- (NSLayoutConstraint *) topConstraint {
    return [self constraintForAttribute: NSLayoutAttributeTop];
}


- (NSLayoutConstraint *) bottomConstraint {
    return [self constraintForAttribute: NSLayoutAttributeBottom];
}


- (NSLayoutConstraint *) bottomConstraintForItem: (id) item {
    return [self constraintForAttribute: NSLayoutAttributeBottom item: item];
}

- (NSLayoutConstraint *) topConstraintForItem: (id) item {
    return [self constraintForAttribute: NSLayoutAttributeTop item: item];
}



- (NSLayoutConstraint *) rightConstraintForItem: (id) item {
    return [self constraintForAttribute: NSLayoutAttributeRight item: item];
}


- (NSLayoutConstraint *) constraintForAttribute: (NSLayoutAttribute) attribute {

    NSLayoutConstraint *ret = nil;
    NSArray *constraints = self.constraints;

    for (NSLayoutConstraint *constraint in constraints) {
        if (constraint.firstAttribute == attribute && constraint.secondAttribute == attribute) {
            ret = constraint;
            break;
        }
    }
    return ret;
}


- (NSLayoutConstraint *) constraintForAttribute: (NSLayoutAttribute) attribute item: (id) item {
    return [self constraintForAttribute: attribute item: item attribute: attribute];
}

- (NSLayoutConstraint *) constraintForAttribute: (NSLayoutAttribute) attribute item: (id) item attribute: (NSLayoutAttribute) attribute2 secondItem: (id) item2 {
    NSLayoutConstraint *ret = nil;
    NSArray *constraints = self.constraints;

    for (NSLayoutConstraint *constraint in constraints) {
        if (constraint.firstAttribute == attribute && constraint.secondAttribute == attribute2) {
            if ((item == nil || (item && constraint.firstItem == item)) && (item2 == nil || (item2 && constraint.secondItem == item2))) {
                ret = constraint;
                break;
            }
        }
    }
    return ret;
}


- (NSLayoutConstraint *) constraintForAttribute: (NSLayoutAttribute) attribute attribute: (NSLayoutAttribute) attribute2 {
    return [self constraintForAttribute: attribute item: nil attribute: attribute2 secondItem: nil];
}

- (NSLayoutConstraint *) constraintForAttribute: (NSLayoutAttribute) attribute item: (id) item attribute: (NSLayoutAttribute) attribute2 {
    return [self constraintForAttribute: attribute item: item attribute: attribute2 secondItem: nil];
}


@end