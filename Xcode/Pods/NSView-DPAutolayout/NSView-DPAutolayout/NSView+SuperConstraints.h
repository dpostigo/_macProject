//
// Created by Dani Postigo on 12/28/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSView (SuperConstraints)

- (NSArray *) superConstrain: (CGFloat) constant;

- (NSArray *) superConstrainEdgesV;
- (NSArray *) superConstrainEdgesV: (CGFloat) constant;
- (NSArray *) superConstrainEdgesH;
- (NSArray *) superConstrainEdgesH: (CGFloat) constant;

- (NSLayoutConstraint *) superConstrain: (NSLayoutAttribute) attribute constant: (CGFloat) constant;
- (NSLayoutConstraint *) updateSuperConstraint: (NSLayoutAttribute) attribute offset: (CGFloat) offset;

- (NSLayoutConstraint *) superConstrainToItem: (id) item attribute: (NSLayoutAttribute) attribute constant: (CGFloat) constant;
- (NSLayoutConstraint *) selfConstrain: (NSLayoutAttribute) attribute constant: (CGFloat) constant;
@end