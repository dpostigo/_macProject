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
- (NSLayoutConstraint *) superConstrainHeight;
- (NSLayoutConstraint *) superConstrainHeight: (CGFloat) offset;

- (NSLayoutConstraint *) superLeadingConstraint;
- (void) updateSuperLeadingConstraint: (CGFloat) offset;
- (NSLayoutConstraint *) superConstrainLeading;
- (NSLayoutConstraint *) superConstrainLeading: (CGFloat) offset;
- (NSLayoutConstraint *) superConstrainLeadingToItem: (id) item;
- (NSLayoutConstraint *) superConstrainLeadingToItem: (id) item offset: (CGFloat) offset;

- (void) updateSuperTrailingConstraint: (CGFloat) offset;
- (NSLayoutConstraint *) superTrailingConstraint;
- (NSLayoutConstraint *) superConstrainTrailing;
- (NSLayoutConstraint *) superConstrainTrailing: (CGFloat) offset;

- (void) updateSuperTopConstraint: (CGFloat) offset;
- (NSLayoutConstraint *) superTopConstraint;
- (NSLayoutConstraint *) superConstrainTop;
- (NSLayoutConstraint *) superConstrainTop: (CGFloat) offset;
- (NSLayoutConstraint *) superConstrainTopToItem: (id) item;


- (void) updateSuperBottomConstraint: (CGFloat) offset;
- (NSLayoutConstraint *) superBottomConstraint;
- (NSLayoutConstraint *) superConstrainBottom;
- (NSLayoutConstraint *) superConstrainBottom: (CGFloat) offset;
- (NSArray *) superConstrainEdges;
- (NSArray *) superConstrainEdges: (CGFloat) offset;
- (NSArray *) superConstrainWithInsets: (NSEdgeInsets) insets;
- (void) updateSuperConstrainInsets: (NSEdgeInsets) insets;
@end