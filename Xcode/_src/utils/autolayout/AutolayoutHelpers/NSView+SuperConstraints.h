//
// Created by Dani Postigo on 12/28/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSView (SuperConstraints)

- (void) superConstrain: (NSLayoutAttribute) attribute constant: (CGFloat) constant;
- (void) superConstrainToItem: (id) item attribute: (NSLayoutAttribute) attribute constant: (CGFloat) constant;
- (void) selfConstrain: (NSLayoutAttribute) attribute constant: (CGFloat) constant;
@end