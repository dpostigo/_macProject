//
// Created by Dani Postigo on 12/28/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSView (ConstraintGetters)

- (NSLayoutConstraint *) leftConstraint;
- (NSLayoutConstraint *) rightConstraint;
- (NSLayoutConstraint *) topConstraint;
- (NSLayoutConstraint *) bottomConstraint;
- (NSLayoutConstraint *) constraintForAttribute: (NSLayoutAttribute) attribute item: (id) item;
- (NSLayoutConstraint *) topConstraintForItem: (id) item;
- (NSLayoutConstraint *) bottomConstraintForItem: (id) item;
- (NSLayoutConstraint *) leftConstraintForItem: (id) item;
- (NSLayoutConstraint *) rightConstraintForItem: (id) item;
- (NSLayoutConstraint *) constraintForAttribute: (NSLayoutAttribute) attribute;
@end