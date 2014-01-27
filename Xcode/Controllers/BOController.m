//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/BOFocusTypes.h>
#import "BOController.h"
#import "Model.h"
#import "BOAPIModel.h"
#import "Task.h"
#import "BOWindow.h"

@implementation BOController

- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil {
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if (self) {
        [self setup];
    }

    return self;
}


- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void) setup {

    _model = [Model sharedModel];
    [_model subscribeDelegate: self];

    _apiModel = [BOAPIModel sharedModel];
    [_apiModel subscribeDelegate: self];

    _queue = [NSOperationQueue new];

}

- (void) viewDidLoad {
    //    [_model addObserver: self forKeyPath: @"selectedFocusType" options: 0 context: NULL];
    //    [_model addObserver: self forKeyPath: @"selectedTask" options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context: NULL];

}

//
//- (void) observeValueForKeyPath: (NSString *) keyPath ofObject: (id) object change: (NSDictionary *) change context: (void *) context {
//    if (object == _model) {
//        if ([keyPath isEqualToString: @"selectedFocusType"]) {
//            [self modelDidSelectFocusType];
//        } else if ([keyPath isEqualToString: @"selectedTask"]) {
//
//            // TODO: Remove old observer
//            //            NSLog(@"change = %@", change);
//            [self modelDidSelectTask: _model.selectedTask];
//        }
//    }
//
//    else if (object == _model.selectedTask) {
//
//        if ([keyPath isEqualToString: @"logs"]) {
//            [self logsDidUpdate: _model.selectedTask];
//        }
//    }
//
//
//    //    [super observeValueForKeyPath: keyPath ofObject: object change: change context: context];
//}


- (void) modelDidSelectFocusType {
}


- (void) modelDidSelectTask: (Task *) task {
    if (_model.selectedTask) {
        //        [_model.selectedTask addObserver: self forKeyPath: @"logs" options: 0 context: NULL];
    }
}


- (void) logsDidUpdate: (Task *) task {

}


- (BOWindow *) window {
    NSWindow *window = self.view.window;
    return ([window isKindOfClass: [BOWindow class]] ? ((BOWindow *) window) : nil);
}


- (Model *) model {
    return _model;
}
@end