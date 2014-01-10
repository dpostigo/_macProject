//
// Created by Dani Postigo on 12/28/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSView (ConstraintGetters)

- (NSLayoutConstraint *) leftConstraint;
- (NSLayoutConstraint *) leftConstraintForItem: (id) item;

- (NSLayoutConstraint *) rightConstraint;
- (NSLayoutConstraint *) rightConstraintForItem: (id) item;

- (NSLayoutConstraint *) topConstraint;
- (NSLayoutConstraint *) topConstraintForItem: (id) item;

- (NSLayoutConstraint *) bottomConstraint;
- (NSLayoutConstraint *) bottomConstraintForItem: (id) item;

- (NSLayoutConstraint *) constraintForAttribute: (NSLayoutAttribute) attribute attribute: (NSLayoutAttribute) attribute2;
- (NSLayoutConstraint *) constraintForAttribute: (NSLayoutAttribute) attribute item: (id) item attribute: (NSLayoutAttribute) attribute2;
- (NSLayoutConstraint *) constraintForAttribute: (NSLayoutAttribute) attribute item: (id) item attribute: (NSLayoutAttribute) attribute2 secondItem: (id) item2;

- (NSLayoutConstraint *) constraintForAttribute: (NSLayoutAttribute) attribute item: (id) item;
- (NSLayoutConstraint *) constraintForAttribute: (NSLayoutAttribute) attribute;

@end