//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CartsAppDelegate.h"
#import "NSNib+WorkspaceNib.h"
#import "NSWorkspaceNib.h"
#import "NSWindow+DPUtils.h"
#import "DPStyledWindow.h"
#import "BOAPIModel.h"
#import "Task.h"
#import "Job.h"
#import "User.h"
#import "Log.h"
#import "ServiceItem.h"

@implementation CartsAppDelegate {
    NSWindow *window;
}

- (void) applicationDelegateDidFinishLaunching: (NSNotification *) notification {
    [super applicationDelegateDidFinishLaunching: notification];


    //    NSLog(@"macWindow.contentView = %@", macWindow.contentView);
    [_model.masterNib load];
    NSView *view = [_model.masterNib viewForClass: @"MainController"];
    //    [macWindow setContentView: view];
    //    NSLog(@"macWindow.contentView = %@", macWindow.contentView);

    //    bgWindow.headerView = [_model.masterNib viewForClass: @"CartsHeaderController"];
    //    bgWindow.contentContentView = view;
    //    bgWindow.isVisible = NO;
    //    [bgWindow close];
    //    [bgWindow performClose: nil];

    //    window = [[NSWindow alloc] initWithContentRect: view.bounds styleMask: (NSResizableWindowMask | NSClosableWindowMask | NSTitledWindowMask) backing: NSBackingStoreBuffered defer: NO];
    //    [window setContentView: view];
    //    [window makeKeyAndOrderFront: nil];


    [BOAPIModel sharedModel].delegate = _model.operationHandler;

    //    NSWindow *loginWindow = [_model.masterNib objectWithIdentifier: @"LoginWindow"];
    //    [loginWindow makeKeyAndOrderFront: nil];


    //    [self createDummyData];

}

- (Task *) dummyTask {
    Task *task = [[Task alloc] initWithTitle: @"Task"];
    task.id = @"1";

    [task.logs addObject: [self dummyLog: 1]];
    [task.logs addObject: [self dummyLog: 2]];
    [task.logs addObject: [self dummyLog: 3]];
    [task.logs addObject: [self dummyLog: 4]];
    return task;

}


- (Log *) dummyLog: (NSUInteger) index {
    Log *log = [[Log alloc] initWithTitle: [NSString stringWithFormat: @"Log note %lu", index]];
    log.serviceItem = [_model.serviceItems objectAtIndex: 0];
    log.id = [NSString stringWithFormat: @"%lu", index];
    return log;

}

- (void) createDummyData {

    [_model.serviceItems addObject: [[ServiceItem alloc] initWithTitle: @"Design"]];
    [_model.serviceItems addObject: [[ServiceItem alloc] initWithTitle: @"Development"]];

    User *user = [[User alloc] initWithTitle: @"Dani"];
    user.id = @"1";
    [_model.contacts addObject: user];
    _model.currentUser = user;

    Task *task = self.dummyTask;
    task.assignee = user;

    Job *job = [[Job alloc] initWithTitle: @"Dummy job"];
    job.id = @"1";
    task.job = job;

    [_model.tasks addObject: task];
    [_model.jobs addObject: job];

    [_model notifyDelegates: @selector(getTasksSucceeded) object: nil];

    NSWindow *tasksWindow = [_model.masterNib objectWithIdentifier: @"TasksWindow"];
    [tasksWindow makeKeyAndOrderFront: nil];
}


@end