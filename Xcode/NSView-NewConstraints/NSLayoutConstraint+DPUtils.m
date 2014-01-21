//
// Created by Dani Postigo on 1/20/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "NSLayoutConstraint+DPUtils.h"

@implementation NSLayoutConstraint (DPUtils)


- (void) sandbox {

}


+ (NSArray *) replaceItem: (id) item inConstraints: (NSArray *) constraints withItem: (id) newItem {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    for (NSLayoutConstraint *constraint in constraints) {
        if (constraint.firstItem == item) {
            NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem: newItem attribute: constraint.firstAttribute relatedBy: constraint.relation toItem: constraint.secondItem attribute: constraint.secondAttribute multiplier: constraint.multiplier constant: constraint.constant];
            [ret addObject: newConstraint];
        } else if (constraint.secondItem == item) {
            NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem: constraint.firstItem attribute: constraint.firstAttribute relatedBy: constraint.relation toItem: newItem attribute: constraint.secondAttribute multiplier: constraint.multiplier constant: constraint.constant];
            [ret addObject: newConstraint];
        } else {
            [ret addObject: constraint];
        }
    }

    return ret;
}

- (NSString *) firstAttributeAsString {
    return [self stringForLayoutAttribute: self.firstAttribute];
}

- (NSString *) secondAttributeAsString {
    return [self stringForLayoutAttribute: self.secondAttribute];
}

- (NSString *) stringForLayoutAttribute: (NSLayoutAttribute) attribute {
    NSString *ret = nil;
    if (attribute == NSLayoutAttributeLeft) {
        ret = @"NSLayoutAttributeLeft";

    } else if (attribute == NSLayoutAttributeRight) {
        ret = @"NSLayoutAttributeRight";

    } else if (attribute == NSLayoutAttributeTop) {
        ret = @"NSLayoutAttributeTop";

    } else if (attribute == NSLayoutAttributeBottom) {
        ret = @"NSLayoutAttributeBottom";

    } else if (attribute == NSLayoutAttributeLeading) {
        ret = @"NSLayoutAttributeLeading";

    } else if (attribute == NSLayoutAttributeTrailing) {
        ret = @"NSLayoutAttributeTrailing";

    } else if (attribute == NSLayoutAttributeWidth) {
        ret = @"NSLayoutAttributeWidth";

    } else if (attribute == NSLayoutAttributeHeight) {
        ret = @"NSLayoutAttributeHeight";

    } else if (attribute == NSLayoutAttributeCenterX) {
        ret = @"NSLayoutAttributeCenterX";

    } else if (attribute == NSLayoutAttributeCenterY) {
        ret = @"NSLayoutAttributeCenterY";

    } else if (attribute == NSLayoutAttributeBaseline) {
        ret = @"NSLayoutAttributeBaseline";

    } else if (attribute == NSLayoutAttributeNotAnAttribute) {
        ret = @"NSLayoutAttributeNotAnAttribute";

    }
    return ret;
}
@end