//
// Created by Daniela Postigo on 5/11/13.
// Copyright (c) 2013 Daniela Postigo. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CompleteTaskProcess.h"
#import "ASIFormDataRequest.h"


@implementation CompleteTaskProcess {
}


@synthesize taskId;

@synthesize completedDate;

@synthesize taskTime;

@synthesize task;

- (id) initWithTask: (Task *) aTask completedDate: (NSDate *) aCompletedDate {
    self = [super init];
    if (self) {
        self.task = aTask;
        self.taskId = task.id;
        self.completedDate = aCompletedDate;
        self.taskTime = 0;
    }
    return self;
}


- (NSString *) urlString {
    return [NSString stringWithFormat: @"%@/tasks/%@.json", STAGING_URL, taskId];
}

- (NSURL *) url {
    return [NSURL URLWithString: self.urlString];
}


- (ASIFormDataRequest *) createDataRequest {
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL: self.url];
    request.requestMethod = @"PUT";
    [request addRequestHeader: @"Content-Type" value: @ "application/json"];
    return request;
}


- (NSDictionary *) createJSONDictionary {

    NSMutableDictionary *taskDictionary = [[NSMutableDictionary alloc] init];
    [taskDictionary setObject: [_model.defaultFormatter stringFromDate: completedDate] forKey: @"completed_date"];
    [taskDictionary setObject: [NSNumber numberWithFloat: taskTime] forKey: @"time"];

    NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];
    [jsonDict setObject: taskDictionary forKey: @"task"];
    [jsonDict setObject: [NSString stringWithFormat: @"%@", _model.currentUser.id] forKey: @"contact_id"];

    return jsonDict;
}

- (void) main {
    [super main];


    [self operationBeganWithString: @"Completing task..."];
    ASIFormDataRequest *request = [self createDataRequest];
    NSDictionary *jsonDict = [self createJSONDictionary];
    NSLog(@"jsonDict = %@", jsonDict);

    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject: jsonDict options: NSJSONWritingPrettyPrinted error: &error];
    if (error) {
        NSLog(@"error = %@", error);
    }
    NSString *jsonString = [[NSString alloc] initWithData: jsonData encoding: NSUTF8StringEncoding];
    NSLog(@"jsonString = %@", jsonString);


    NSString *postStr = [NSString stringWithFormat: @"%@", jsonString];
    [request appendPostData: [postStr dataUsingEncoding: NSUTF8StringEncoding]];
    [request startSynchronous];

    if (!request.error) {
        error = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData: request.responseData options: NSJSONReadingAllowFragments error: &error];

        if (error) {
            NSLog(@"error = %@", error);
        }
        if (dictionary == nil) {
            NSLog(@"%@ failed.", NSStringFromClass([self class]));
            NSLog(@"dictionary = %@", dictionary);
            [self operationSucceededWithString: @"Complete task process failed."];
        } else {
            NSLog(@"%@ succeeded.", NSStringFromClass([self class]));

            [self operationSucceededWithString: @"Complete task process succeeded."];
            //            [_model notifyDelegates: @selector(taskDidComplete:) object: task];
        }
    }
}

@end