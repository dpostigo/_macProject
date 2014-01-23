//
// Created by Dani Postigo on 1/22/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "NewTaskDetailController.h"
#import "LogsController.h"
#import "TaskEditController.h"
#import "Model.h"
#import "CreateLogController.h"
#import "NSView+SuperConstraints.h"
#import "NSView+NewConstraint.h"

@implementation NewTaskDetailController

- (void) viewDidLoad {
    [super viewDidLoad];

    [logsController viewDidLoad];
    [editController viewDidLoad];

    [logsController modelDidSelectTask: _model.selectedTask];
    [editController modelDidSelectTask: _model.selectedTask];

    [createLogView addSubview: createLogController.view];
    [createLogController.view superConstrainEdges];
}


@end