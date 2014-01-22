//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CartsAppDelegate.h"
#import "NSWorkspaceNib.h"
#import "DPStyledWindow.h"
#import "BOAPIModel.h"
#import "Task.h"
#import "BOLoginWindow.h"

@implementation CartsAppDelegate {
    NSWindow *window;
}

- (void) applicationDelegateDidFinishLaunching: (NSNotification *) notification {
    [super applicationDelegateDidFinishLaunching: notification];

    [_model.masterNib load];

    [BOAPIModel sharedModel].delegate = _model.operationHandler;

    //    [loginWindow makeKeyAndOrderFront: nil];




    //    _model.usesDummyData = YES;

    [_model subscribeDelegate: self];

    BOLoginWindow *loginWindow = [_model.masterNib objectWithIdentifier: @"LoginWindow"];
    [loginWindow validate];

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