//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "NSObject+UserDefaults.h"

@implementation NSObject (UserDefaults)

- (id) savedObjectForKey: (NSString *) key {
    return [[NSUserDefaults standardUserDefaults] objectForKey: key];
}

- (void) saveObject: (id) object forKey: (NSString *) key {
    [[NSUserDefaults standardUserDefaults] setObject: object forKey: key];
}
@end