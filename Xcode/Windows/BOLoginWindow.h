//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BOAPI/BOAPIDelegate.h>
#import "BOWindow.h"

@interface BOLoginWindow : BOWindow <BOAPIDelegate> {

    IBOutlet NSTextField *userField;
    IBOutlet NSTextField *passwordField;

    IBOutlet NSButton *submitButton;
}

@property(nonatomic, strong) NSButton *submitButton;
@property(nonatomic, strong) NSTextField *userField;
@property(nonatomic, strong) NSTextField *passwordField;
- (void) validate;
@end