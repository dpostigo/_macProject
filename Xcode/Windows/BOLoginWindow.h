//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BOWindow.h"

@interface BOLoginWindow : BOWindow {

    IBOutlet NSTextField *userField;
    IBOutlet NSTextField *passwordField;

    IBOutlet NSButton *submitButton;
}

@property(nonatomic, strong) NSButton *submitButton;
@end