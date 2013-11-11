//
//  NSColor+DPUtils.h
//  Carts
//
//  Created by Daniela Postigo on 10/20/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSColor (DPUtils)

+ (NSColor *) darken: (NSColor *) aColor amount: (CGFloat) amount;
+ (NSColor *) desaturate: (NSColor *) aColor amount: (CGFloat) amount;
+ (NSColor *) fade: (NSColor *) aColor amount: (CGFloat) amount;
+ (NSColor *) lighten: (NSColor *) aColor amount: (CGFloat) amount;
- (NSColor *) lighten: (CGFloat) percent;
- (NSColor *) darken: (CGFloat) percent;
- (NSColor *) fade: (CGFloat) percent;
- (NSColor *) desaturate: (CGFloat) percent;
@end