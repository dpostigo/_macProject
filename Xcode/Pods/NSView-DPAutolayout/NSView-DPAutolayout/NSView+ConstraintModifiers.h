//
// Created by Dani Postigo on 1/7/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSView (ConstraintModifiers)


- (NSArray *) constraintsModifiedToItem: (id) item;
- (NSArray *) constraintsModifiedToItem: (id) item constraints: (NSArray *) constraints;

@end