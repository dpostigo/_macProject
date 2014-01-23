//
// Created by Dani Postigo on 1/22/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BOController.h"
#import "NotificationDelegate.h"

@interface CreateLogController : BOController <NotificationDelegate> {
    Log *selectedLog;

    IBOutlet NSButton *submitButton;
    IBOutlet NSDatePicker *datePicker;
    IBOutlet NSObjectController *objectController;

}

@property(nonatomic, strong) Log *selectedLog;
@end