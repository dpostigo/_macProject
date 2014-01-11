//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"

@interface Model (TaskUtils)

- (NSArray *) tasksForSelectedFocusType;
- (NSArray *) tasksForFocusType: (NSString *) mode;
@end