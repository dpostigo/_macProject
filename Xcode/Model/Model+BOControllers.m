//
// Created by Dani Postigo on 1/21/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <DPKit/NSWorkspaceNib.h>
#import "Model+BOControllers.h"
#import "CreateTaskController.h"
#import "FooterController.h"
#import "TaskDetailController.h"
#import "CreateLogController.h"
#import "NewTaskDetailController.h"

@implementation Model (BOControllers)

- (NSWindow *) tasksWindow {
    return [self.masterNib objectWithIdentifier: @"TasksWindow"];
}

- (NSWindow *) newTasksWindow {
    return [self.masterNib objectWithIdentifier: @"newTasksWindow"];
}


- (NSViewController *) titleController {
    
    return [self.masterNib controllerForClass: @"TitleController"];
}


- (NSViewController *) sidebarController {
    return [self.masterNib controllerForClass: @"SidebarController"];
    //    return [[CreateTaskController alloc] initWithNibName: @"TaskCreationView" bundle: nil];
}


- (NSViewController *) footerController {
    return [[FooterController alloc] initWithNibName: @"FooterController" bundle: nil];
}

- (NSViewController *) taskCreationController {
    return [[CreateTaskController alloc] initWithNibName: @"TaskCreationView" bundle: nil];
}


- (NSViewController *) taskDetailController {
    //    return [self.masterNib controllerForClass: @"TaskDetailController"];
    return [self controllerForKey: @"NewTaskDetail"];
    return [[NewTaskDetailController alloc] initWithNibName: @"NewTaskDetailView" bundle: nil];
    return [[TaskDetailController alloc] initWithNibName: @"TaskDetailView" bundle: nil];
}


- (NSViewController *) logCreationController {
    return [[CreateLogController alloc] initWithNibName: @"CreateLogView" bundle: nil];
}

- (NSViewController *) controllerForKey: (NSString *) key {
    NSViewController *ret = nil;
    ret = [self.controllers objectForKey: key];
    if (ret == nil) {
        NSString *classString = [NSString stringWithFormat: @"%@Controller", key];
        ret = [[NSClassFromString(classString) alloc] initWithNibName: [NSString stringWithFormat: @"%@View", key] bundle: nil];
        if (ret != nil) {
            [self.controllers setObject: ret forKey: key];
        }
    }
    return ret;
}


@end