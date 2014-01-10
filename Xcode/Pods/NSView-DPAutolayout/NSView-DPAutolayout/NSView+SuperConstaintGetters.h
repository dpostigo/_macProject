//
// Created by Dani Postigo on 1/7/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSView (SuperConstaintGetters)

- (NSLayoutConstraint *) superConstraintForAttribute: (NSLayoutAttribute) attribute;
- (NSLayoutConstraint *) leftSuperConstraint;
- (NSLayoutConstraint *) rightSuperConstraint;
- (NSLayoutConstraint *) topSuperConstraint;
- (NSLayoutConstraint *) bottomSuperConstraint;
- (NSLayoutConstraint *) leadingSuperConstraint;
- (NSLayoutConstraint *) trailingSuperConstraint;
@end