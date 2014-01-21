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

}


- (NSView *) contentView {
    return [splitView subviewAtIndex: 2];
}

- (void) setContentView: (NSView *) view {
    [splitView setSubviewAtIndex: 2 with: view];
}



#pragma mark Navigation

- (void) modelDidSelectFocusType {
    [super modelDidSelectFocusType];

}


- (void) modelDidSelectTask: (Task *) task {
    [super modelDidSelectTask: task];

    self.contentView = self.taskInfoView;
}


#pragma mark Various views


- (NSView *) sidebarView {
    return [self.model.masterNib viewForClass: @"SidebarController"];
}


- (NSView *) taskInfoView {
    return [self.model.masterNib viewForClass: @"TaskDetailController"];
}

- (NSView *) taskListView {
    return [self.model.masterNib viewForClass: @"TasksController"];
}


@end