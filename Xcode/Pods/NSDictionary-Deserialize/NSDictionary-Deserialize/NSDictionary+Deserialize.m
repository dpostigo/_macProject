//
// Created by Dani Postigo on 11/21/13.
// Copyright (c) 2013 Daniela Postigo. All rights reserved.
//


#import "NSDictionary+Deserialize.h"

@implementation NSDictionary (Deserialize)

- (NSString *) stringForKey: (NSString *) key {

    NSString *ret = nil;
    id value = [self objectForKey: key];
    if (value == nil || [value isEqual: [NSNull null]]) {

    } else {
        ret = [NSString stringWithFormat: @"%@", value];
        if ([ret isEqualToString: @"<null>"]) {
            ret = nil;
        }
    }
    return ret;

}

- (CGFloat) floatForKey: (NSString *) key {
    CGFloat ret = 0;
    NSString *stringValue = [self stringForKey: key];
    if (stringValue) {
        ret = [stringValue floatValue];
    }

    return ret;
}


- (NSDate *) dateForKey: (NSString *) key formatter: (NSDateFormatter *) formatter {
    NSDate *ret = nil;
    NSString *stringValue = [self stringForKey: key];
    stringValue = [stringValue isEqual: [NSNull null]] ? nil : stringValue;

    if (stringValue) {
        ret = [formatter dateFromString: stringValue];
    }

    return ret;
}

- (NSString *) idForKey: (NSString *) key {

    NSString *ret = nil;
    NSDictionary *dictionary = [self objectForKey: key];
    if (dictionary) {
        ret = [dictionary stringForKey: @"id"];
    }

    return ret;

}

@end