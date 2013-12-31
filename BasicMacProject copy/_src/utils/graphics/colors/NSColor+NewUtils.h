//
// Created by Dani Postigo on 12/28/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSColor (NewUtils)

+ (NSColor *) blackColorWithAlpha: (CGFloat) alpha;
- (NSColor *) mix: (NSColor *) color fraction: (CGFloat) fraction1;
@end