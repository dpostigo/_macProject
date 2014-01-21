//
// Created by Dani Postigo on 1/17/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BOController.h"
#import "BOAPIDelegate.h"

@class FinalInputTextField;

@interface TaskCreationController : BOController <BOAPIDelegate> {
    IBOutlet NSTextField *taskField;
    IBOutlet FinalInputTextField *jobField;
    IBOutlet FinalInputTextField *assigneeField;

    IBOutlet NSPopUpButton *jobButton;

    IBOutlet NSArrayController *jobController;
    IBOutlet NSArrayController *assigneeController;

    Job *selectedJob;

}

@property(nonatomic, strong) NSArray *jobs;

@property(nonatomic, strong) NSPopUpButton *jobButton;
@property(nonatomic, strong) Job *selectedJob;
- (IBAction) popupButtonClicked: (id) sender;
- (NSArray *) assignees;
@end