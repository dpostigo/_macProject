//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "BOWindow.h"
#import "Model.h"

@implementation BOWindow

@synthesize viewController;
@synthesize contentDisplayView;
@synthesize queue = _queue;

- (id) initWithContentRect: (NSRect) contentRect styleMask: (NSUInteger) aStyle backing: (NSBackingStoreType) bufferingType defer: (BOOL) flag {
    self = [super initWithContentRect: contentRect styleMask: aStyle backing: bufferingType defer: flag];
    if (self) {
        _queue = [NSOperationQueue new];
        _model = [Model sharedModel];
        [_model subscribeDelegate: self];
    }

    return self;
}


- (void) setViewController: (NSViewController *) contentController1 {
    viewController = contentController1;
    if (viewController) {
        self.contentDisplayView = viewController.view;
    }
}


- (NSOperationQueue *) queue {
    if (_queue == nil) {
        _queue = [NSOperationQueue new];
    }
    return _queue;
}


@end