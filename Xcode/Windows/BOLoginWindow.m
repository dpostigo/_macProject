//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/User.h>
#import <NSColor-Crayola/NSColor+Crayola.h>
#import <QuartzCore/QuartzCore.h>
#import "BOLoginWindow.h"
#import "NSButton+DPUtils.h"
#import "BOLoginOperation.h"
#import "Model.h"
#import "NSWorkspaceNib.h"
#import "NSColor+NewUtils.h"
#import "CALayer+ConstraintUtils.h"
#import "CALayer+FrameUtils.h"
#import "BOAPIModel.h"

@implementation BOLoginWindow

@synthesize submitButton;
@synthesize userField;
@synthesize passwordField;

- (void) awakeFromNib {
    [super awakeFromNib];

    [[BOAPIModel sharedModel] subscribeDelegate: self];
    userField.nextKeyView = passwordField;
    //    passwordField.nextKeyView = submitButton;

}

- (void) stylize {
    [super stylize];
    self.titleBarColor = [NSColor crayolaOnyxColor];
    self.shineColor = [[NSColor whiteColor] mix: [NSColor crayolaOnyxColor] fraction: 0.8];

    CALayer *topRule = [CALayer layer];
    topRule.delegate = self;
    [backgroundLayer.superlayer addSublayer: topRule];
    [topRule superConstrainEdgesH: 0];
    [topRule superConstrainBottomEdge: 0.5];

    topRule.backgroundColor = [NSColor crayolaBlackColor].CGColor;
    topRule.height = 0.5;
    topRule.shadowColor = [NSColor whiteColor].CGColor;
    topRule.shadowRadius = 0.5;
    topRule.shadowOffset = CGSizeMake(0, -1);
    topRule.shadowOpacity = 0.8;


    //    CALayer *borderLayer = self.titleBarLayer;
    //    borderLayer.borderColor = [NSColor whiteColor].CGColor;
    //    borderLayer.borderWidth = 1.0;
    //
    //    CAGradientLayer *layer = self.shineLayer;
    //
    ////    layer.borderColor = [NSColor blackColor].CGColor;
    //
    //    NSColor *lightColor = [[NSColor whiteColor] mix: [NSColor crayolaOnyxColor] fraction: 0.9];
    //
    //    layer.colors = @[
    //            (__bridge id) lightColor.CGColor,
    //            (__bridge id) [NSColor crayolaOnyxColor].CGColor,
    //            (__bridge id) [NSColor crayolaOnyxColor].CGColor,
    //            (__bridge id) [NSColor crayolaOnyxColor].CGColor,
    //            (__bridge id) [[NSColor blackColor] mix: [NSColor crayolaOnyxColor] fraction: 0.9].CGColor,
    //    ];
    //    //    layer.startPoint = NSMakePoint(0.5, 0.0);
    //    //    layer.startPoint = NSMakePoint(0.5, 0.0);
    ////    layer.borderColor = lightColor.CGColor;
    ////    layer.borderWidth = 1.0;

}


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



#pragma mark IBActions

- (IBAction) signOut: (id) sender {

}

- (void) validate {
    [self validate: nil];

}

- (void) validate: (id) sender {

    [self endEditingFor: passwordField];
    if (submitButton.isEnabled) {

        //        [userField resignFirstResponder];
        //        [passwordField resignFirstResponder];
        [self selectNextKeyView: passwordField];

        [userField setEnabled: NO];
        [passwordField setEnabled: NO];
        [submitButton setEnabled: NO];

        NSString *username = userField.stringValue;
        NSString *password = passwordField.stringValue;

        if ((username && [username length] > 0) && (password && [password length] > 0)) {
            [self validateSucceeded];
        } else {
            [self validateFailed];
        }
    }
}

- (void) validateFailed {
    [self enableLogin];

}


- (void) validateSucceeded {
    [self submit: nil];
}


- (void) submit: (id) sender {

    NSString *username = userField.stringValue;
    NSString *password = passwordField.stringValue;

    _model.username = username;
    _model.password = password;
    [_queue addOperation: [[BOLoginOperation alloc] initWithUsername: username password: password]];
}


- (void) enableLogin {
    [userField setEnabled: YES];
    [passwordField setEnabled: YES];
    [submitButton setEnabled: YES];
}

#pragma mark BOAPIDelegate

- (void) userDidLogin: (User *) user {

    //    NSWindow *newWindow = [_model.masterNib objectWithIdentifier: @"TasksWindow"];
    //    [newWindow makeKeyAndOrderFront: nil];

    [self performClose: nil];
    [self enableLogin];

    //    userField.stringValue = @"";
    //    passwordField.stringValue = @"";

}

- (void) loginFailed {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self enableLogin];

    NSAlert *alert = [NSAlert alertWithMessageText: @"Login failed."
            defaultButton: @"OK"
            alternateButton: nil
            otherButton: nil
            informativeTextWithFormat: @""];
    [alert runModal];
}


- (void) becomeKeyWindow {
    [super becomeKeyWindow];
    //    [self validate: nil];
}


@end