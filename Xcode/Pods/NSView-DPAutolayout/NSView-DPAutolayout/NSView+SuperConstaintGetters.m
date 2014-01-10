//
// Created by Dani Postigo on 1/7/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import "NSView+SuperConstaintGetters.h"
#import "NSView+ConstraintGetters.h"

@implementation NSView (SuperConstaintGetters)

- (NSLayoutConstraint *) superConstraintForAttribute: (NSLayoutAttribute) attribute {
    NSLayoutConstraint *ret = nil;
    if (self.superview) {
        ret = [self.superview constraintForAttribute: attribute item: self attribute: attribute secondItem: [self superview]];
    }
    return ret;
}


- (NSLayoutConstraint *) leftSuperConstraint {
    return [self superConstraintForAttribute: NSLayoutAttributeLeft];
}

- (NSLayoutConstraint *) rightSuperConstraint {
    return [self superConstraintForAttribute: NSLayoutAttributeRight];
}

- (NSLayoutConstraint *) topSuperConstraint {
    return [self superConstraintForAttribute: NSLayoutAttributeTop];
}

- (NSLayoutConstraint *) bottomSuperConstraint {
    return [self superConstraintForAttribute: NSLayoutAttributeBottom];
}

- (NSLayoutConstraint *) leadingSuperConstraint {
    return [self superConstraintForAttribute: NSLayoutAttributeLeading];
}

- (NSLayoutConstraint *) trailingSuperConstraint {
    return [self superConstraintForAttribute: NSLayoutAttributeTrailing];
}


@end