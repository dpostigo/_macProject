//
// Created by Dani Postigo on 1/23/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TasksController;
@class SidebarController;
@class TasksWindow;

@interface TasksWindowController : NSWindowController {
    IBOutlet SidebarController *sidebarController;
    IBOutlet TasksController *tasksController;
}

- (TasksWindow *) tasksWindow;
@end