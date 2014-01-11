//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <JMSimpleDate/NSDate+JMSimpleDate.h>
#import <BOAPI/User.h>
#import <BOAPI/Job.h>
#import "Model+TaskUtils.h"
#import "BOFocusTypes.h"
#import "Task.h"

@implementation Model (TaskUtils)


//
//- (NSString *) titleForMode: (NSString *) mode {
//    if ([mode isEqualToString: TASKLISTMODE_JOBS]) {
//        return self.selectedJob.title;
//    } else if ([mode isEqualToString: TASKLISTMODE_ARTISTS]) {
//        return [NSString stringWithFormat: @"%@'s Tasks", self.selectedArtist.title];
//    }
//    else return mode;
//}
//


- (NSArray *) tasksForSelectedFocusType {
    return [self tasksForFocusType: self.selectedFocusType];
}

- (NSArray *) tasksForFocusType: (NSString *) mode {
    NSArray *array;
    NSPredicate *predicate;

    if ([mode isEqualToString: kBOFocusTypeDue]) {
        predicate = [NSPredicate predicateWithBlock: ^BOOL(id object, NSDictionary *bindings) {
            Task *task = object;
            return task.dueDate != nil && [task.dueDate isEarlierThanDate: [NSDate date]];
        }];
    } else if ([mode isEqualToString: kBOFocusTypeToday]) {
        predicate = [NSPredicate predicateWithBlock: ^BOOL(id object, NSDictionary *bindings) {
            Task *task = object;
            return task.startDate != nil && task.startDate.isToday;
        }];
    } else if ([mode isEqualToString: kBOFocusTypeObserving]) {
        predicate = [NSPredicate predicateWithBlock: ^BOOL(id object, NSDictionary *bindings) {
            Task *task = object;
            return [task.observerIds containsObject: self.currentUser.id];
        }];
    } else if ([mode isEqualToString: kBOFocusTypeMyTasks]) {
        predicate = [NSPredicate predicateWithBlock: ^BOOL(id object, NSDictionary *bindings) {
            Task *task = object;
            // NSLog(@"task.assignee = %@", task.assignee);
            return [task.assignee.id isEqualToString: self.currentUser.id];
        }];
    } else if ([mode isEqualToString: kBOFocusTypeJobs]) {
        predicate = [NSPredicate predicateWithBlock: ^BOOL(id object, NSDictionary *bindings) {
            Task *task = object;
            return [task.job.id isEqualToString: self.selectedJob.id];
        }];
    } else if ([mode isEqualToString: kBOFocusTypeArtists]) {
        predicate = [NSPredicate predicateWithBlock: ^BOOL(id object, NSDictionary *bindings) {
            Task *task = object;
            return [task.assignee.id isEqualToString: self.selectedArtist.id];
        }];
    }

    array = [self.tasks filteredArrayUsingPredicate: predicate];
    return array;
}
@end