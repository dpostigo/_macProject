//
// Created by Dani Postigo on 12/28/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSView+SuperConstraints.h"

@implementation NSView (SuperConstraints)

- (void) superConstrain: (NSLayoutAttribute) attribute constant: (CGFloat) constant {
    NSView *superview = self.superview;
    [superview addConstraint: [NSLayoutConstraint constraintWithItem: self attribute: attribute relatedBy: NSLayoutRelationEqual toItem: superview attribute: attribute multiplier: 1.0 constant: constant]];
}


- (void) superConstrainToItem: (id) item attribute: (NSLayoutAttribute) attribute constant: (CGFloat) constant {
    NSView *superview = self.superview;
    [superview addConstraint: [NSLayoutConstraint constraintWithItem: self attribute: attribute relatedBy: NSLayoutRelationEqual toItem: item attribute: attribute multiplier: 1.0 constant: constant]];
}

- (void) selfConstrain: (NSLayoutAttribute) attribute constant: (CGFloat) constant {
    NSView *superview = self.superview;
    [superview addConstraint: [NSLayoutConstraint constraintWithItem: self attribute: attribute relatedBy: NSLayoutRelationEqual toItem: nil attribute: NSLayoutAttributeNotAnAttribute multiplier: 1.0 constant: constant]];
}

//- (void) superConstrain {
//    [superview addConstraint: [NSLayoutConstraint constraintWithItem: self attribute: NSLayoutAttributeRight relatedBy: NSLayoutRelationEqual toItem: superview attribute: NSLayoutAttributeRight multiplier: 1.0 constant: -inset]];
//    [superview addConstraint: [NSLayoutConstraint constraintWithItem: self attribute: NSLayoutAttributeTop relatedBy: NSLayoutRelationEqual toItem: superview attribute: NSLayoutAttributeTop multiplier: 1.0 constant: inset]];
//    [superview addConstraint: [NSLayoutConstraint constraintWithItem: self attribute: NSLayoutAttributeBottom relatedBy: NSLayoutRelationEqual toItem: superview attribute: NSLayoutAttributeBottom multiplier: 1.0 constant: -inset]];
//
//}
@end