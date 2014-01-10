//
// Created by Dani Postigo on 11/21/13.
// Copyright (c) 2013 Daniela Postigo. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSDictionary (Deserialize)

- (NSString *) stringForKey: (NSString *) key;
- (CGFloat) floatForKey: (NSString *) key;
- (NSDate *) dateForKey: (NSString *) key formatter: (NSDateFormatter *) formatter;
- (NSString *) idForKey: (NSString *) key;
@end