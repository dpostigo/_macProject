//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "BOFocusTypes.h"

@implementation BOFocusTypes

NSString *const kBOFocusTypeDue = @"Due";
NSString *const kBOFocusTypeToday = @"Today";
NSString *const kBOFocusTypeObserving = @"Observing";
NSString *const kBOFocusTypeMyTasks = @"My Tasks";

+ (NSArray *) focusTypes {
    return [NSArray arrayWithObjects:
            kBOFocusTypeDue,
            kBOFocusTypeToday,
            kBOFocusTypeObserving,
            kBOFocusTypeMyTasks,
            nil];
}
@end