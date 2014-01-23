//
// Created by Dani Postigo on 1/21/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <DPKit/NSWorkspaceNib.h>
#import "Model+BOControllers.h"
#import "TaskCreationController.h"
#import "FooterController.h"
#import "TaskDetailController.h"
#import "CreateLogController.h"
#import "NewTaskDetailController.h"

@implementation Model (BOControllers)

- (NSViewController *) tasksWindow {
    return [self.masterNib objectWithIdentifier: @"TasksWindow"];

}

- (NSViewController *) sidebarController {
    return [self.masterNib controllerForClass: @"SidebarController"];
    //    return [[TaskCreationController alloc] initWithNibName: @"TaskCreationView" bundle: nil];
}


- (NSViewController *) footerController {
    return [[FooterController alloc] initWithNibName: @"FooterController" bundle: nil];
}

- (NSViewController *) taskCreationController {
    return [[TaskCreationController alloc] initWithNibName: @"TaskCreationView" bundle: nil];
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
        NSLog(@"ret = %@", ret);
        if (ret != nil) {
            [self.controllers setObject: ret forKey: key];
        }
    }
    return ret;
}


@end