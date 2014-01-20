//
//  Model.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <BOAPI/User.h>
#import <BOAPI/Log.h>
#import "Model.h"
#import "NSWorkspaceNib.h"
#import "OperationHandler.h"
#import "NSObject+UserDefaults.h"
#import "BOAPIModel.h"
#import "BOFocusTypes.h"
#import "Job.h"
#import "Task.h"
#import "ServiceItem.h"

@implementation Model

@synthesize masterNib;
@synthesize operationHandler;

@synthesize currentUser;

@synthesize selectedJob;
@synthesize selectedArtist;

@synthesize selectedTask;

@synthesize usesDummyData;

+ (Model *) sharedModel {
    static Model *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}


- (NSWorkspaceNib *) masterNib {
    if (masterNib == nil) {
        masterNib = [[NSWorkspaceNib alloc] initWithNibNamed: @"Workspace" bundle: nil];
    }
    return masterNib;
}

- (id <BOAPIDelegate>) operationHandler {
    if (operationHandler == nil) {
        operationHandler = [[OperationHandler alloc] init];
    }
    return operationHandler;
}



#pragma mark Defaults
//
//- (void) setUsername: (NSString *) username {
//    _username = [username mutableCopy];
//    [[NSUserDefaults standardUserDefaults] setObject: self.username forKey: @"username"];
//
//}


- (void) setPassword: (NSString *) password {
    [self saveObject: password forKey: @"password"];
}

- (NSString *) password {
    NSString *ret = [self savedObjectForKey: @"password"];
    if (ret == nil) {
        ret = @"";
    }
    return ret;
}

- (void) setUsername: (NSString *) username {
    [self saveObject: username forKey: @"username"];
}

- (NSString *) username {
    NSString *ret = [self savedObjectForKey: @"username"];
    if (ret == nil) {
        ret = @"";
    }
    return ret;
}


- (NSString *) selectedFocusType {
    if (selectedFocusType == nil) {
        selectedFocusType = [NSString stringWithFormat: @"%@", kBOFocusTypeMyTasks];
    }
    return selectedFocusType;
}



#pragma mark Selected object setters


- (void) setSelectedFocusType: (NSString *) selectedFocusType1 {
    if (![selectedFocusType1 isEqualToString: kBOFocusTypeJobs] && ![selectedFocusType1 isEqualToString: kBOFocusTypeJobs]) {
        self.selectedJob = nil;
        self.selectedArtist = nil;
    }
    selectedFocusType = [selectedFocusType1 mutableCopy];

}

- (void) setSelectedJob: (Job *) selectedJob1 {

    selectedJob = selectedJob1;
    if (selectedJob) {
        self.selectedFocusType = kBOFocusTypeJobs;
    }
}



#pragma mark Data getters


- (NSMutableArray *) jobs {
    return [BOAPIModel sharedModel].jobs;
}

- (NSMutableArray *) tasks {
    return [BOAPIModel sharedModel].tasks;
}

- (NSMutableArray *) contacts {
    return [BOAPIModel sharedModel].contacts;
}

- (NSMutableArray *) serviceItems {
    return [BOAPIModel sharedModel].serviceItems;
}





#pragma mark Dummy data

- (void) setUsesDummyData: (BOOL) usesDummyData1 {
    usesDummyData = usesDummyData1;

    if (usesDummyData) {
        [self.serviceItems addObject: [[ServiceItem alloc] initWithTitle: @"Design"]];
        [self.serviceItems addObject: [[ServiceItem alloc] initWithTitle: @"Development"]];

        User *user = [[User alloc] initWithTitle: @"Dani"];
        user.id = @"1";
        [self.contacts addObject: user];
        self.currentUser = user;

        Task *task = self.dummyTask;
        task.assignee = user;

        Job *job = [[Job alloc] initWithTitle: @"Dummy job"];
        job.id = @"1";
        task.job = job;

        [self.tasks addObject: task];
        [self.jobs addObject: job];

        [self notifyDelegates: @selector(getTasksSucceeded) object: nil];

        NSWindow *tasksWindow = [self.masterNib objectWithIdentifier: @"TasksWindow"];
        [tasksWindow makeKeyAndOrderFront: nil];
    }
}


- (Task *) dummyTask {
    Task *task = [[Task alloc] initWithTitle: @"Task"];
    task.id = @"1";

    [task.logs addObject: [self dummyLog: 1]];
    [task.logs addObject: [self dummyLog: 2]];
    [task.logs addObject: [self dummyLog: 3]];
    [task.logs addObject: [self dummyLog: 4]];
    return task;

}


- (Log *) dummyLog: (NSUInteger) index {
    Log *log = [[Log alloc] initWithTitle: [NSString stringWithFormat: @"Log note %lu", index]];
    log.serviceItem = [self.serviceItems objectAtIndex: 0];
    log.id = [NSString stringWithFormat: @"%lu", index];
    log.date = [NSDate date];
    return log;

}

@end


