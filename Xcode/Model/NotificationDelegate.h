//
// Created by Dani Postigo on 1/23/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Job;
@class Log;
@class Task;

@protocol NotificationDelegate <NSObject>

@optional
- (void) modelDidCreateTask: (Task *) task;
- (void) modelDidSelectTask: (Task *) task;
- (void) modelDidSelectLog: (Log *) log;
@end