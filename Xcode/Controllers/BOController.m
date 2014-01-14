//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/BOFocusTypes.h>
#import "BOController.h"
#import "Model.h"
#import "BOAPIModel.h"
#import "Task.h"

@implementation BOController

- (void) viewDidLoad {
    _model = [Model sharedModel];
    _apiModel = [BOAPIModel sharedModel];
    [_model subscribeDelegate: self];
    _queue = [NSOperationQueue new];

    [_model addObserver: self forKeyPath: @"selectedFocusType" options: 0 context: NULL];
    [_model addObserver: self forKeyPath: @"selectedTask" options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context: NULL];

}


- (void) observeValueForKeyPath: (NSString *) keyPath ofObject: (id) object change: (NSDictionary *) change context: (void *) context {
    if (object == _model) {
        if ([keyPath isEqualToString: @"selectedFocusType"]) {
            [self modelDidSelectFocusType];
        } else if ([keyPath isEqualToString: @"selectedTask"]) {

            // TODO: Remove old observer
            //            NSLog(@"change = %@", change);
            [self modelDidSelectTask: nil];
        }
    }

    else if (object == _model.selectedTask) {

        if ([keyPath isEqualToString: @"logs"]) {
            [self logsDidUpdate: _model.selectedTask];
        }
    }
    //    [super observeValueForKeyPath: keyPath ofObject: object change: change context: context];
}


- (void) modelDidSelectFocusType {
}


- (void) modelDidSelectTask: (Task *) task {
    if (_model.selectedTask) {
        [_model.selectedTask addObserver: self forKeyPath: @"logs" options: 0 context: NULL];
    }
}


- (void) logsDidUpdate: (Task *) task {

}
@end