//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "MainController.h"
#import "DDSplitView.h"
#import "NSViewController+Carts.h"
#import "Model.h"
#import "NSWorkspaceNib.h"
#import "CartsSidebarViewController.h"
#import "CartsContentViewController.h"
#import "Task.h"

@implementation MainController

@synthesize splitView;

- (void) viewDidLoad {
    [super viewDidLoad];

    splitView.splitDividerColor = [NSColor lightGrayColor];

    [splitView setSubviewAtIndex: 0 with: self.sidebarView];
    [splitView setSubviewAtIndex: 1 with: self.taskListView];
    //    [splitView setSubviewAtIndex: 1 with: contentSplitView];

    [splitView lockContainerAtIndex: 0];

    [splitView setMinimumValue: 200 atIndex: 0];
    [splitView setMinimumValue: 200 atIndex: 1];

    [splitView setHoldingPriority: 20 forSubviewAtIndex: 1];
    //    [contentSplitView setSubviewAtIndex: 0 with: self.contentView];

}


- (NSView *) sidebarView {
    return [self.model.masterNib viewForClass: @"SidebarController"];
}

//
//- (NSView *) contentView {
////    NSView *ret = nil;
////    if (_model.selectedTask) {
////        ret = [self.model.masterNib viewForClass: @"TaskDetailController"];
////
////    } else {
////        ret =
////    }
////
////    return ret;
////}



- (NSView *) taskInfoView {
    return [self.model.masterNib viewForClass: @"TaskDetailController"];
}

- (NSView *) taskListView {
    return [self.model.masterNib viewForClass: @"TasksController"];
}


#pragma mark Navigation

- (void) modelDidSelectFocusType {
    [super modelDidSelectFocusType];

    //    NSLog(@"%s", __PRETTY_FUNCTION__);
    //    NSLog(@"_model.selectedTask = %@", _model.selectedTask);
    //    [splitView setSubviewAtIndex: 1 with: self.contentView];

}


- (void) modelDidSelectTask: (Task *) task {
    [super modelDidSelectTask: task];

    NSView *newView = [[NSView alloc] init];
    [splitView setSubviewAtIndex: 2 with: self.taskInfoView];
}


@end