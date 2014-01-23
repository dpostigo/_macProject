//
// Created by Dani Postigo on 1/22/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BOController.h"

@class LogsController;
@class TaskEditController;
@class CreateLogController;

@interface NewTaskDetailController : BOController {

    IBOutlet LogsController *logsController;
    IBOutlet TaskEditController *editController;
    IBOutlet CreateLogController *createLogController;

    IBOutlet NSView *createLogView;

}
@end