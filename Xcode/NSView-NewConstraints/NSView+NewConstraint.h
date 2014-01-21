//
// Created by Dani Postigo on 1/20/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSView (NewConstraint)

- (NSLayoutConstraint *) superWidthConstraint;
- (NSLayoutConstraint *) superConstrainWidth;
- (NSLayoutConstraint *) superConstrainWidth: (CGFloat) offset;

- (NSLayoutConstraint *) superHeightConstraint;
- (NSLayoutConstraint *) superLeadingConstraint;
- (NSLayoutConstraint *) superConstrainLeading;
- (NSLayoutConstraint *) superConstrainLeadingToItem: (id) item;
- (NSLayoutConstraint *) superConstrainLeadingToItem: (id) item offset: (CGFloat) offset;
- (NSLayoutConstraint *) superTrailingConstraint;
- (NSLayoutConstraint *) superConstrainTrailing;
- (NSLayoutConstraint *) superConstrainTrailing: (CGFloat) offset;
- (NSLayoutConstraint *) superConstrainHeight;
- (NSLayoutConstraint *) superConstrainHeight: (CGFloat) offset;

- (NSLayoutConstraint *) superTopConstraint;
- (NSLayoutConstraint *) superConstrainTop: (CGFloat) offset;
- (NSLayoutConstraint *) superConstrainTop;
- (NSLayoutConstraint *) superConstrainTopToItem: (id) item;
- (NSArray *) superConstrainEdges;
- (NSArray *) superConstrainEdges: (CGFloat) offset;
- (NSArray *) superConstrainWithInsets: (NSEdgeInsets) insets;
@end