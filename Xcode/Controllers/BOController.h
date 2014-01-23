//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Model;
@class BOAPIModel;
@class Task;
@class BOWindow;

@interface BOController : NSViewController  {

    Model *_model;
    BOAPIModel *_apiModel;
    NSOperationQueue *_queue;
}

- (void) viewDidLoad;
- (void) modelDidSelectFocusType;
- (void) modelDidSelectTask: (Task *) task;
- (void) logsDidUpdate: (Task *) task;
- (BOWindow *) window;
@end