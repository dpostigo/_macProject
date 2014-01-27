//
// Created by Dani Postigo on 1/23/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/GetTasksOperation.h>
#import "TasksWindowController.h"
#import "TasksController.h"
#import "TasksWindow.h"
#import "Model.h"

@implementation TasksWindowController

- (Model *) model {
    return [Model sharedModel];
}

- (TasksWindow *) tasksWindow {
    return (TasksWindow *) self.window;
}

- (void) windowDidLoad {
    [super windowDidLoad];

    [self.tasksWindow.queue addOperation: [[GetTasksOperation alloc] init]];

}


@end