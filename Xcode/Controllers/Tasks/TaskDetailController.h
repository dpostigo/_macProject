//
// Created by Dani Postigo on 1/11/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BOController.h"

@class Task;

@interface TaskDetailController : BOController {


    IBOutlet NSObjectController *objectController;
    IBOutlet  NSTextField *titleField;
}

- (Task *) task;
@end