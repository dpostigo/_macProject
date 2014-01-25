//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <BOAPI/BOAPIStorage.h>
#import <BOAPI/Task.h>
#import "CartsAppDelegate.h"
#import "NSWorkspaceNib.h"
#import "DPStyledWindow.h"
#import "BOAPIModel.h"
#import "TasksWindowController.h"
#import "BOLoginWindow.h"
#import "AutoCoding.h"

@implementation CartsAppDelegate {
    NSWindow *window;
}

- (void) applicationDelegateDidFinishLaunching: (NSNotification *) notification {
    [super applicationDelegateDidFinishLaunching: notification];

    BOAPIStorage *storage = [[BOAPIStorage alloc] initWithUsername: @"hello"];
    [storage.tasks addObject: [[Task alloc] initWithTitle: @"hello"]];

    [storage archive];

    NSLog(@"storage.filename = %@", storage.filename);

    BOAPIStorage *unarchived = [BOAPIStorage objectWithContentsOfFile: storage.filename];
    NSLog(@"unarchived = %@", unarchived);
    NSLog(@"[unarchived.tasks count] = %lu", [unarchived.tasks count]);

    //    [BOAPIModel sharedModel].defaultUsername = _model.username;
//    //    if (_model.username) {
//    //        [self showTasksWindow];
//    //    } else {
//    //        BOLoginWindow *loginWindow = [_model.masterNib objectWithIdentifier: @"LoginWindow"];
//    //        [loginWindow makeKeyAndOrderFront: nil];
//    //        [loginWindow validate];
//    //
//    //    }
//
//
//    NSLog(@"_model.username = %@", _model.username);
//    //
//    [BOAPIModel sharedModel].delegate = _model.operationHandler;
//
//    [[BOAPIModel sharedModel] subscribeDelegate: self];
//    [_model subscribeDelegate: self];
//
//    [_model.masterNib load];
//
//
//    BOLoginWindow *loginWindow = [_model.masterNib objectWithIdentifier: @"LoginWindow"];
//    [loginWindow makeKeyAndOrderFront: nil];
//    [loginWindow validate];

}

#pragma mark Getters

- (BOAPIModel *) apiModel {
    return [BOAPIModel sharedModel];
}


- (void) showTasksWindow {
    TasksWindowController *controller = [[TasksWindowController alloc] initWithWindowNibName: @"NewTasksWindow" owner: self];
    [controller.window makeKeyAndOrderFront: nil];

}
#pragma mark BOAPIDelegate


- (void) userDidLogin: (User *) user {
    //    NSWindowController *controller = [[NSWindowController alloc] initWithWindow: _model.tasksWindow];
    //    [controller.window makeKeyAndOrderFront: nil];


    [self showTasksWindow];
}

#pragma mark IBActions

- (IBAction) signOut: (id) sender {
    [_model signOut];
}

- (void) userDidSignOff {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSWindow *loginWindow = [_model.masterNib objectWithIdentifier: @"LoginWindow"];


    NSArray *windows = [[NSApplication sharedApplication] windows];
    for (NSWindow *openWindow in windows) {
        [openWindow performClose: nil];
    }

    [loginWindow makeKeyAndOrderFront: nil];

}

@end