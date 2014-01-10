//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kBOFocusTypeDue;
extern NSString *const kBOFocusTypeToday;
extern NSString *const kBOFocusTypeObserving;
extern NSString *const kBOFocusTypeMyTasks;

@interface BOFocusTypes : NSObject

+ (NSArray *) focusTypes;
@end