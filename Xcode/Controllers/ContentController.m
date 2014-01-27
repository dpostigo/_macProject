//
// Created by Dani Postigo on 1/23/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/Task.h>
#import <NSView-NewConstraints/NSView+NewConstraint.h>
#import "ContentController.h"
#import "Model+BOControllers.h"
#import "CreateTaskController.h"

@implementation ContentController

@synthesize currentController;

- (void) awakeFromNib {
    [super awakeFromNib];
    [self viewDidLoad];
}


#pragma mark NotificationDelegate

- (void) modelDidCreateTask: (Task *) task {
}

- (void) modelDidSelectTask: (Task *) task {
    NSLog(@"%s", __PRETTY_FUNCTION__);

    NSLog(@"task.isCreated = %d", task.isCreated);
    if (task.isCreated) {
        self.currentController = _model.taskDetailController;
    } else {

        CreateTaskController *controller = (CreateTaskController *) _model.taskCreationController;
        controller.selectedTask = task;
        self.currentController = controller;
        [controller.taskField becomeFirstResponder];

    }

    //    NSView *view = _model.taskDetailController.view;
    //    view.frame = self.view.bounds;
    //    [self.view addSubview: view];
    //    [view superConstrainWithInsets: NSEdgeInsetsMake(0, 0, 0, 0)];
}


- (void) setCurrentController: (NSViewController *) currentController1 {
    if (currentController && currentController.view.superview) {
        [currentController.view removeFromSuperview];
    }
    currentController = currentController1;
    if (currentController) {
        NSView *view = currentController.view;
        view.frame = self.view.bounds;
        [self.view addSubview: view];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [view superConstrainWithInsets: NSEdgeInsetsMake(0, 0, 0, 0)];
    }
}


@end