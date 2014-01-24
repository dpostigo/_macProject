//
// Created by Dani Postigo on 1/16/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BOAPI/BOAPIDelegate.h>
#import "BOWindow.h"
#import "NotificationDelegate.h"

@class SidebarController;
@class TasksController;
@class BOController;
@class ContentController;
@class DividerSplitView;
@class NewTitleController;

@interface NewTasksWindow : BOWindow <BOAPIDelegate, NotificationDelegate> {


    IBOutlet NSSplitView *sidebarSplit;
    IBOutlet DividerSplitView *splitView;

    IBOutlet NewTitleController *titleController;
    IBOutlet SidebarController *sidebarController;
    IBOutlet TasksController *tasksController;
    IBOutlet ContentController *contentController;
//    IBOutlet BOController *mainController;

    IBOutlet NSView *left;
    IBOutlet NSView *middle;
    IBOutlet NSView *right;

    NSView *mainContent;

}

@property(nonatomic, strong) NSView *mainContent;
@property(nonatomic, strong) NSView *left;
@property(nonatomic, strong) NSView *middle;
@property(nonatomic, strong) NSView *right;
@end