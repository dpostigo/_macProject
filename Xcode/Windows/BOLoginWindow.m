//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/User.h>
#import "BOLoginWindow.h"
#import "NSButton+DPUtils.h"
#import "BOLoginOperation.h"
#import "Model.h"
#import "NSWorkspaceNib.h"

@implementation BOLoginWindow

@synthesize submitButton;
@synthesize userField;
@synthesize passwordField;



- (void) setUserField: (NSTextField *) userField1 {
    userField = userField1;
    if (userField) {
        userField.stringValue = _model.username;
    }
}

- (void) setPasswordField: (NSTextField *) passwordField1 {
    passwordField = passwordField1;
    if (passwordField) {
        passwordField.stringValue = _model.password;
    }
}


- (void) setSubmitButton: (NSButton *) submitButton1 {
    submitButton = submitButton1;
    if (submitButton) {
        [submitButton addTarget: self action: @selector(validate:)];
    }
}


- (void) validate {
    [self validate: nil];

}

- (void) validate: (id) sender {

    if (submitButton.isEnabled) {
        [userField setEnabled: NO];
        [passwordField setEnabled: NO];
        [submitButton setEnabled: NO];
        NSString *username = userField.stringValue;
        NSString *password = passwordField.stringValue;

        _model.username = username;
        _model.password = password;
        [_queue addOperation: [[BOLoginOperation alloc] initWithUsername: username password: password]];

    }

}


- (void) userDidLogin: (User *) user {

    NSWindow *newWindow = [_model.masterNib objectWithIdentifier: @"TasksWindow"];
    [newWindow makeKeyAndOrderFront: nil];

    [self performClose: nil];

    [userField setEnabled: YES];
    [passwordField setEnabled: YES];
    [submitButton setEnabled: YES];

}


- (void) becomeKeyWindow {
    [super becomeKeyWindow];
    [self validate: nil];
}


@end