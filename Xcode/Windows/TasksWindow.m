//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/User.h>
#import "TasksWindow.h"
#import "Model.h"
#import "NSWorkspaceNib.h"
#import "GetTasksOperation.h"
#import "MainController.h"
#import "TitleController.h"
#import "BlueView.h"
#import "Model+BOControllers.h"

@implementation TasksWindow

@synthesize splitView;
@synthesize titleController;

- (void) awakeFromNib {
    [super awakeFromNib];

    //    self.footerBarHeight = 20;
    //    self.footerBarColor = self.titleBarColor;
    //    self.footerBarView = _model.footerController.view;
}


- (void) userDidLogin: (User *) user {
    [_queue addOperation: [[GetTasksOperation alloc] init]];

    self.titleBarView = self.titleController.view;
    [[NSUserDefaults standardUserDefaults] setBool: YES forKey: @"NSConstraintBasedLayoutVisualizeMutuallyExclusiveConstraints"];

}


- (void) setViewController: (NSViewController *) viewController1 {
    [super setViewController: viewController1];

    if (viewController) {
        self.contentTitle = viewController.title;
    }

}


- (NSString *) contentTitle {
    return self.titleController.title;
}

- (void) setContentTitle: (NSString *) contentTitle1 {
    self.titleController.title = contentTitle1;
}


- (void) setContentDisplayView: (NSView *) contentDisplayView1 {
    [super setContentDisplayView: contentDisplayView1];
    if (contentDisplayView) {
        mainController.contentView = contentDisplayView;
    }
}


- (NSView *) titleControllerView {
    return self.titleController.view;
}

@end