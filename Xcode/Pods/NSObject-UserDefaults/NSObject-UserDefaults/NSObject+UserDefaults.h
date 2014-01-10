//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (UserDefaults)

- (id) savedObjectForKey: (NSString *) key;
- (void) saveObject: (id) object forKey: (NSString *) key;
@end