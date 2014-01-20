//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BOWindow.h"
#import "BOAPIDelegate.h"

@class DDSplitView;
@class MainController;
@class TitleController;

@interface TasksWindow : BOWindow <BOAPIDelegate> {
    IBOutlet DDSplitView *splitView;
    IBOutlet MainController *mainController;

    IBOutlet TitleController *titleController;

    NSString *contentTitle;

}

@property(nonatomic, strong) DDSplitView *splitView;
@property(nonatomic, strong) TitleController *titleController;
@property(nonatomic, copy) NSString *contentTitle;
@end