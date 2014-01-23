//
// Created by Dani Postigo on 12/28/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSView+SuperConstraints.h"
#import "NSView+SuperConstaintGetters.h"

@implementation NSView (SuperConstraints)

- (NSLayoutConstraint *) superConstrain: (NSLayoutAttribute) attribute constant: (CGFloat) constant {
    NSLayoutConstraint *ret = nil;
    if (self.superview) {
        ret = [NSLayoutConstraint constraintWithItem: self attribute: attribute relatedBy: NSLayoutRelationEqual toItem: [self superview] attribute: attribute multiplier: 1.0 constant: constant];
        [self.superview addConstraint: ret];
    }
    return ret;
}

- (NSLayoutConstraint *) updateSuperConstraint: (NSLayoutAttribute) attribute offset: (CGFloat) offset {
    NSLayoutConstraint *ret = [self superConstraintForAttribute: attribute];
    if (ret == nil) {
        ret = [self superConstrain: attribute constant: offset];
    }
    ret.constant = offset;
    return ret;
}



#pragma mark Edges

- (NSArray *) superConstrain: (CGFloat) constant {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    [ret addObjectsFromArray: [self superConstrainEdgesH: constant]];
    [ret addObjectsFromArray: [self superConstrainEdgesV: constant]];
    return ret;
}

- (NSArray *) superConstrainEdgesH {
    return [self superConstrainEdgesH: 0];
}

- (NSArray *) superConstrainEdgesH: (CGFloat) constant {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    [ret addObject: [self superConstrain: NSLayoutAttributeLeading constant: constant]];
    [ret addObject: [self superConstrain: NSLayoutAttributeTrailing constant: constant]];
    return ret;
}


- (NSArray *) superConstrainEdgesV {
    return [self superConstrainEdgesV: 0];
}

- (NSArray *) superConstrainEdgesV: (CGFloat) constant {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    [ret addObject: [self superConstrain: NSLayoutAttributeTop constant: constant]];
    [ret addObject: [self superConstrain: NSLayoutAttributeBottom constant: constant]];
    return ret;
}


#pragma mark Super constrain explicit edges
//
//- (NSLayoutConstraint *) superConstrainLeading: (CGFloat) constant {
//    return [self superConstrain: NSLayoutAttributeLeading constant: constant];
//}


- (NSLayoutConstraint *) superConstrainToItem: (id) item attribute: (NSLayoutAttribute) attribute constant: (CGFloat) constant {
    NSView *superview = self.superview;
    NSLayoutConstraint *ret = [NSLayoutConstraint constraintWithItem: self attribute: attribute relatedBy: NSLayoutRelationEqual toItem: item attribute: attribute multiplier: 1.0 constant: constant];
    [superview addConstraint: ret];
    return ret;
}

- (NSLayoutConstraint *) selfConstrain: (NSLayoutAttribute) attribute constant: (CGFloat) constant {
    NSView *superview = self.superview;
    NSLayoutConstraint *ret = [NSLayoutConstraint constraintWithItem: self attribute: attribute relatedBy: NSLayoutRelationEqual toItem: nil attribute: NSLayoutAttributeNotAnAttribute multiplier: 1.0 constant: constant];
    [superview addConstraint: ret];
    return ret;
}

//- (void) superConstrain {
//    [superview addConstraint: [NSLayoutConstraint constraintWithItem: self attribute: NSLayoutAttributeRight relatedBy: NSLayoutRelationEqual toItem: superview attribute: NSLayoutAttributeRight multiplier: 1.0 constant: -inset]];
//    [superview addConstraint: [NSLayoutConstraint constraintWithItem: self attribute: NSLayoutAttributeTop relatedBy: NSLayoutRelationEqual toItem: superview attribute: NSLayoutAttributeTop multiplier: 1.0 constant: inset]];
//    [superview addConstraint: [NSLayoutConstraint constraintWithItem: self attribute: NSLayoutAttributeBottom relatedBy: NSLayoutRelationEqual toItem: superview attribute: NSLayoutAttributeBottom multiplier: 1.0 constant: -inset]];
//
//}
@end