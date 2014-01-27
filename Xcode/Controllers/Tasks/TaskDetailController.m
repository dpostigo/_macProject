//
// Created by Dani Postigo on 1/22/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/Task.h>
#import "TaskDetailController.h"
#import "LogsController.h"
#import "TaskEditController.h"
#import "Model.h"
#import "CreateLogController.h"
#import "NSView+NewConstraint.h"
#import "AppStyles.h"

@implementation TaskDetailController

@synthesize selectedTask;



- (void) awakeFromNib {
    [super awakeFromNib];

    [logsController modelDidSelectTask: _model.selectedTask];
    [editController modelDidSelectTask: _model.selectedTask];

    createLogView.translatesAutoresizingMaskIntoConstraints = NO;
    createLogController.view.frame = createLogView.bounds;
    [createLogView addSubview: createLogController.view];
    //    [createLogController.view superConstrainEdges];
    [createLogController.view superConstrainWidth];
    [createLogController.view superConstrainLeading];
    [createLogController.view superConstrainTop];
    [createLogController.view superConstrainBottom];

    createLogView.wantsLayer = YES;
    createLogView.layer.masksToBounds = NO;

    createLogView.shadow = [AppStyles defaultShadowWithRadius: 1.0 offset: NSMakeSize(0, -1)];

    //    NSLayoutConstraint *trailing = [createLogController.view superTrailingConstraint];
    //    trailing.priority = NSLayoutPriorityDragThatCanResizeWindow;
    //    trailing.priority = NSLayoutPriorityDefaultLow;


    NSLog(@"_model.selectedTask = %@", _model.selectedTask);

    self.selectedTask = _model.selectedTask;

}


- (void) modelDidSelectTask: (Task *) task {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    self.selectedTask = _model.selectedTask;

}


@end