//
// Created by Dani Postigo on 1/22/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BOController.h"
#import "NotificationDelegate.h"

@class LogsController;
@class TaskEditController;
@class CreateLogController;
@class Task;

@interface TaskDetailController : BOController <NotificationDelegate> {

    Task *selectedTask;
    IBOutlet LogsController *logsController;
    IBOutlet TaskEditController *editController;
    IBOutlet CreateLogController *createLogController;

    IBOutlet NSObjectController *objectController;

    IBOutlet NSView *createLogView;

}

@property(nonatomic, strong) Task *selectedTask;
@end