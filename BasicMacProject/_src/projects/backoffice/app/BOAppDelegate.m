//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BOAppDelegate.h"
#import "BOSidebarViewController.h"
#import "LoginOutlineViewController.h"
#import "LoginTableViewController.h"
#import "TitleBarViewController.h"
#import "AddTaskViewController.h"


@implementation BOAppDelegate {
    AddTaskViewController *addTaskController;
}


- (void) applicationDelegateDidFinishLaunching: (NSNotification *) notification {
    [super applicationDelegateDidFinishLaunching: notification];

    NSLog(@"%s", __PRETTY_FUNCTION__);

    newTaskWindow.titleBarHeight = 0;
    newTaskWindow.cornerRadius = 30;

    [_model subscribeDelegate: self];
//    [contentWindow resetBottomView: self];
//    [contentWindow resetMainView: self];
//    [contentWindow resetSidebarView: self];

    [self setupTitleBar];

    [self embedViewController: [[LoginTableViewController alloc] initWithDefaultNib] inView: loginWindow.contentView];
    [self embedViewController: [[LoginTableViewController alloc] initWithDefaultNib] inView: loginPanel.contentView];
    //    [self embedViewController: [[BOSidebarViewController alloc] initWithDefaultNib] inView: leftView];

//    [loginWindow makeKeyWindow];
    [loginPanel makeKeyWindow];
    if (_model.loggedIn) {
        [contentWindow makeKeyAndOrderFront: self];
        addTaskController = [[AddTaskViewController alloc] initWithDefaultNib];
    } else {
        [loginWindow makeKeyAndOrderFront: self];
//        [loginPanel makeKeyAndOrderFront: self];
    }

}


#pragma mark Setup

- (void) setupTitleBar {
    TitleBarViewController *controller = [[TitleBarViewController alloc] initWithDefaultNib];
    controller.view.autoresizingMask = NSViewMinXMargin;
    [self embedViewController: controller inView: contentWindow.titleBarView];
    contentWindow.titleBarView.layer.masksToBounds = YES;
}

#pragma mark Callbacks


- (void) loginSucceeded: (NSDictionary *) dictionary {
    //    [SVProgressHUD showSuccessWithStatus: @"Success!"];
}

- (void) getTasksSucceeded {
    [loginWindow close];
    [contentWindow makeKeyAndOrderFront: self];
}

- (void) shouldSignOut {
    [loginWindow makeKeyAndOrderFront: self];
    [contentWindow close];
}

- (void) shouldAddTask {
    NSSize modalSize = NSMakeSize(480, 280);
    [addTaskController prepareDataSource];
    [addTaskController.table reloadData];
    [contentWindow presentModalView: addTaskController withSize: modalSize animated: YES];
}


- (void) presentModalWindow: (VeryBasicViewController *) controller {
    NSSize modalSize = NSMakeSize(480, 280);
    [contentWindow presentModalView: controller withSize: modalSize animated: YES];
}

- (void) shouldPopViewController: (VeryBasicViewController *) controller {
    [contentWindow dismissController: controller animated: YES];
}

- (void) closeAddTaskWindow {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [newTaskWindow close];
}

@end