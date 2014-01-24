//
//  NSView+LayoutConstraints.h
//  Carts
//
//  Created by Daniela Postigo on 11/1/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSView (LayoutConstraints)

- (void) convertToAutolayout;
- (void) constrainWidthToSuperview;
- (void) constrainHeightToSuperview;
- (NSArray *) widthConstraint;
- (NSArray *) widthConstraintForView: (NSView *) view;
- (NSArray *) constraintWithFormat: (NSString *) format forView: (NSView *) aView;
@end