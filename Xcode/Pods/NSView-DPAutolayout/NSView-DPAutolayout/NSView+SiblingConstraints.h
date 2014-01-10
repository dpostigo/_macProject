//
// Created by Dani Postigo on 1/7/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSView (SiblingConstraints)

- (NSLayoutConstraint *) staticConstrainWidth: (CGFloat) width;
- (NSLayoutConstraint *) staticConstrainHeight: (CGFloat) value;
- (NSLayoutConstraint *) widthConstraint;
- (NSLayoutConstraint *) siblingConstrain: (NSLayoutAttribute) attribute to: (NSView *) sibling attribute: (NSLayoutAttribute) siblingAttribute offset: (CGFloat) offset;
- (NSLayoutConstraint *) siblingConstrainTop: (NSView *) sibling attribute: (NSLayoutAttribute) siblingAttribute offset: (CGFloat) offset;
@end