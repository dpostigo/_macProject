//
// Created by Dani Postigo on 1/17/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BOController.h"
#import "BOAPIDelegate.h"

@class DPBackgroundTextField;
@class SuggestibleTextField;

@interface CreateTaskController : BOController <BOAPIDelegate> {

    Task *selectedTask;
    IBOutlet NSButton *submitButton;
    IBOutlet NSTextField *taskField;

    IBOutlet NSPopUpButton *jobButton;

    IBOutlet NSArrayController *jobController;
    IBOutlet NSArrayController *assigneeController;

    IBOutlet NSObjectController *objectController;

    IBOutlet NSTextField *jobField;
    IBOutlet SuggestibleTextField *assigneeField;

    Job *selectedJob;

}

@property(nonatomic, strong) NSArray *jobs;

@property(nonatomic, strong) NSPopUpButton *jobButton;
@property(nonatomic, strong) Job *selectedJob;
@property(nonatomic, strong) NSTextField *taskField;
@property(nonatomic, strong) NSButton *submitButton;
@property(nonatomic, strong) Task *selectedTask;
- (IBAction) popupButtonClicked: (id) sender;
- (NSArray *) assignees;
@end