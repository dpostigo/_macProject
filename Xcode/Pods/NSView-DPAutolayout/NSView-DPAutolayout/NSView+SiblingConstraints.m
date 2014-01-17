//
// Created by Dani Postigo on 1/7/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import "NSView+SiblingConstraints.h"
#import "NSView+ConstraintGetters.h"

@implementation NSView (SiblingConstraints)

- (NSLayoutConstraint *) staticConstrain: (NSLayoutAttribute) attribute constant: (CGFloat) value {
    NSLayoutConstraint *ret = nil;
    if (self.superview) {
        ret = [NSLayoutConstraint constraintWithItem: self attribute: attribute relatedBy: NSLayoutRelationEqual toItem: nil attribute: NSLayoutAttributeNotAnAttribute multiplier: 1.0 constant: value];
        [self.superview addConstraint: ret];
    }
    return ret;
}

- (NSLayoutConstraint *) staticConstrainWidth: (CGFloat) width {
    NSLayoutConstraint *ret = nil;
    if (self.superview) {
        ret = [NSLayoutConstraint constraintWithItem: self attribute: NSLayoutAttributeWidth relatedBy: NSLayoutRelationEqual toItem: nil attribute: NSLayoutAttributeNotAnAttribute multiplier: 1.0 constant: width];
        [self.superview addConstraint: ret];
    }
    return ret;
}


- (NSLayoutConstraint *) staticConstrainHeight: (CGFloat) value {
    return [self staticConstrain: NSLayoutAttributeHeight constant: value];
}


- (NSLayoutConstraint *) staticHeightConstraint {
    return self.superview == nil ? nil : [self.superview constraintForAttribute: NSLayoutAttributeHeight item: self attribute: NSLayoutAttributeNotAnAttribute secondItem: nil];
}

- (NSLayoutConstraint *) staticWidthConstraint {
    return self.superview == nil ? nil : [self.superview constraintForAttribute: NSLayoutAttributeWidth item: self attribute: NSLayoutAttributeNotAnAttribute secondItem: nil];
}

#pragma mark Siblings



- (NSLayoutConstraint *) siblingConstrain: (NSLayoutAttribute) attribute to: (NSView *) sibling attribute: (NSLayoutAttribute) siblingAttribute offset: (CGFloat) offset {
    NSLayoutConstraint *ret = nil;
    if (self.superview && sibling.superview == self.superview) {
        ret = [NSLayoutConstraint constraintWithItem: self attribute: attribute relatedBy: NSLayoutRelationEqual toItem: sibling attribute: siblingAttribute multiplier: 1.0 constant: offset];
        [self.superview addConstraint: ret];
    }
    return ret;
}


- (NSLayoutConstraint *) siblingConstrainTop: (NSView *) sibling attribute: (NSLayoutAttribute) siblingAttribute offset: (CGFloat) offset {
    NSLayoutConstraint *ret = nil;
    if (self.superview && sibling.superview == self.superview) {
        ret = [NSLayoutConstraint constraintWithItem: self attribute: NSLayoutAttributeTop relatedBy: NSLayoutRelationEqual toItem: sibling attribute: siblingAttribute multiplier: 1.0 constant: offset];
        [self.superview addConstraint: ret];
    }
    return ret;
}

//- (NSLayoutConstraint *) siblingConstrain: (NSLayoutAttribute) attribute constant: (CGFloat) constant {
//    NSLayoutConstraint *ret = nil;
//    if (self.superview) {
//        ret = [NSLayoutConstraint constraintWithItem: self attribute: attribute relatedBy: NSLayoutRelationEqual toItem: [self superview] attribute: attribute multiplier: 1.0 constant: constant];
//        [self.superview addConstraint: ret];
//    }
//    return ret;
//}

@end