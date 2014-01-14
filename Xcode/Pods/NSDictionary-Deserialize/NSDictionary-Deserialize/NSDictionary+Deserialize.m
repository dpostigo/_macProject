//
// Created by Dani Postigo on 11/21/13.
// Copyright (c) 2013 Daniela Postigo. All rights reserved.
//


#import "NSDictionary+Deserialize.h"

@implementation NSDictionary (Deserialize)

- (NSString *) stringForKey: (NSString *) key {

    NSString *failure = nil;
    NSString *ret = nil;

    id object = [self objectForKey: key];

    if (object == nil) {
        //        NSLog(@"Value for %@ was nil.", key);
    } else if ([object isEqual: [NSNull null]]) {
        //        NSLog(@"object = %@, key = %@", object, key);

    } else if ([object isKindOfClass: [NSNumber class]]) {
        NSNumber *number = (NSNumber *) object;
        NSString *numberString = [[self objectForKey: key] stringValue];
        ret = numberString;
    } else {
        ret = [NSString stringWithFormat: @"%@", object];

        if ([ret isEqualToString: @"<null>"]) {
            NSLog(@"Ret was equal to <null>.");
            ret = nil;
        }
    }

    if (ret == nil && [key isEqualToString: @"id"]) {
        NSLog(@"Returning nil, key = %@, dict = %@", key, self);
        [NSException raise: @"Returning nil for an id" format: @"key = %@, dict = %@", key, self];
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