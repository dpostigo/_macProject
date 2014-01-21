//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "OperationHandler.h"
#import "User.h"
#import "Model.h"

@implementation OperationHandler {
    Model *_model;
}

- (id) init {
    self = [super init];
    if (self) {
        _model = [Model sharedModel];
    }

    return self;
}


- (void) userDidLogin: (User *) user {
    _model.currentUser = user;
    [_model notifyDelegates: @selector(userDidLogin:) object: user];
}



#pragma mark Tasks

- (void) getTasksSucceeded {
    [_model notifyDelegates: @selector(tasksDidUpdate) object: nil];

}


@end