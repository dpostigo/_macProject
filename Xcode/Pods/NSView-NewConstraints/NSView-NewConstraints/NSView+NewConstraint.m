//
// Created by Dani Postigo on 1/20/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "NSView+NewConstraint.h"

@implementation NSView (NewConstraint)

- (NSLayoutConstraint *) superConstrainAttribute: (NSLayoutAttribute) attribute offset: (CGFloat) offset {
    NSLayoutConstraint *ret = nil;
    if (self.superview) {
        ret = [NSLayoutConstraint constraintWithItem: self.superview attribute: attribute relatedBy: NSLayoutRelationEqual toItem: self attribute: attribute multiplier: 1.0 constant: offset];
        [self.superview addConstraint: ret];
    }
    return ret;
}


- (NSLayoutConstraint *) superConstrainAttributeWithSelf: (NSLayoutAttribute) attribute offset: (CGFloat) offset {
    return [self superConstrainAttribute: attribute offset: offset firstItem: self secondItem: self.superview];
}

- (NSLayoutConstraint *) superConstrainAttribute: (NSLayoutAttribute) attribute offset: (CGFloat) offset firstItem: (id) item secondItem: (id) item2 {
    NSLayoutConstraint *ret = nil;
    if (self.superview) {
        ret = [NSLayoutConstraint constraintWithItem: item attribute: attribute relatedBy: NSLayoutRelationEqual toItem: item2 attribute: attribute multiplier: 1.0 constant: offset];
        [self.superview addConstraint: ret];
    }
    return ret;
}


#pragma mark Width

- (NSLayoutConstraint *) superWidthConstraint {
    return [self superConstraintForAttribute: NSLayoutAttributeWidth];
}

- (NSLayoutConstraint *) superConstrainWidth {
    return [self superConstrainWidth: 0];
}

- (NSLayoutConstraint *) superConstrainWidth: (CGFloat) offset {
    return [self superConstrainAttributeWithSelf: NSLayoutAttributeWidth offset: offset];
}


#pragma mark Height

- (NSLayoutConstraint *) superHeightConstraint {
    return [self superConstraintForAttribute: NSLayoutAttributeHeight];
}

- (NSLayoutConstraint *) superConstrainHeight {
    return [self superConstrainHeight: 0];
}

- (NSLayoutConstraint *) superConstrainHeight: (CGFloat) offset {
    return [self superConstrainAttributeWithSelf: NSLayoutAttributeHeight offset: offset];
}


#pragma mark Leading

- (NSLayoutConstraint *) superLeadingConstraint {
    return [self superConstraintForAttribute: NSLayoutAttributeLeading];
}

- (NSLayoutConstraint *) superConstrainLeading {
    return [self superConstrainLeading: 0];
}

- (NSLayoutConstraint *) superConstrainLeading: (CGFloat) offset {
    return [self superConstrainAttributeWithSelf: NSLayoutAttributeLeading offset: offset];
}


- (NSLayoutConstraint *) superConstrainLeadingToItem: (id) item {
    return [self superConstrainLeadingToItem: item offset: 0];
}

- (NSLayoutConstraint *) superConstrainLeadingToItem: (id) item offset: (CGFloat) offset {
    return [self superConstrainAttribute: NSLayoutAttributeLeading offset: offset firstItem: item secondItem: self];
}






#pragma mark Trailing

- (NSLayoutConstraint *) superTrailingConstraint {
    return [self superConstraintForAttribute: NSLayoutAttributeTrailing];
}

- (NSLayoutConstraint *) superConstrainTrailing {
    return [self superConstrainTrailing: 0];
}

- (NSLayoutConstraint *) superConstrainTrailing: (CGFloat) offset {
    return [self superConstrainAttribute: NSLayoutAttributeTrailing offset: offset];
}


#pragma mark Top

- (NSLayoutConstraint *) superTopConstraint {
    return [self superConstraintForAttribute: NSLayoutAttributeTop];
}

- (NSLayoutConstraint *) superConstrainTop: (CGFloat) offset {
    return [self superConstrainAttributeWithSelf: NSLayoutAttributeTop offset: offset];
}

- (NSLayoutConstraint *) superConstrainTop {
    return [self superConstrainLeading: 0];
}

#pragma mark Top, item

- (NSLayoutConstraint *) superConstrainTopToItem: (id) item {
    return [self superConstrainTopToItem: item offset: 0];
}

- (NSLayoutConstraint *) superConstrainTopToItem: (id) item offset: (CGFloat) offset {
    return [self superConstrainAttribute: NSLayoutAttributeTop offset: offset firstItem: item secondItem: self];
}



#pragma mark Bottom

- (NSLayoutConstraint *) superBottomConstraint {
    return [self superConstraintForAttribute: NSLayoutAttributeBottom];
}


- (NSLayoutConstraint *) superConstrainBottom {
    return [self superConstrainBottom: 0];
}

- (NSLayoutConstraint *) superConstrainBottom: (CGFloat) offset {
    return [self superConstrainAttribute: NSLayoutAttributeBottom offset: offset];
}



#pragma mark All


- (NSArray *) superConstrainEdges {
    return [self superConstrainEdges: 0];
}


- (NSArray *) superConstrainEdges: (CGFloat) offset {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if (self.superview) {
        [ret addObject: [self superConstrainLeading: offset]];
        [ret addObject: [self superConstrainTrailing: offset]];
        [ret addObject: [self superConstrainTop: offset]];
        [ret addObject: [self superConstrainBottom: offset]];
    }
    return ret;
}


- (NSArray *) superConstrainWithInsets: (NSEdgeInsets) insets {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if (self.superview) {
        [ret addObject: [self superConstrainLeading: insets.left]];
        [ret addObject: [self superConstrainTrailing: insets.right]];
        [ret addObject: [self superConstrainTop: insets.top]];
        [ret addObject: [self superConstrainBottom: insets.bottom]];
    }
    return ret;
}



#pragma mark Find constraints

- (NSLayoutConstraint *) superConstraintForAttribute: (NSLayoutAttribute) attribute {
    NSLayoutConstraint *ret = nil;
    if (self.superview) {

        NSArray *constraints = [NSArray arrayWithArray: self.superview.constraints];
        for (NSLayoutConstraint *constraint in constraints) {
            if (constraint.firstItem == self && constraint.secondItem == self.superview
                    && constraint.firstAttribute == attribute && constraint.secondAttribute == attribute) {
                ret = constraint;
                break;
            }

        }

    }
    return ret;
}
@end