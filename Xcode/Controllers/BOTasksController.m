//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/User.h>
#import "BOTasksController.h"
#import "Model.h"
#import "Model+TaskUtils.h"
#import "BOAPIModel+Utils.h"
#import "Job.h"
#import "Task.h"

@implementation BOTasksController

@synthesize outline;

- (void) viewDidLoad {
    [super viewDidLoad];
    [outline reloadData];

    self.view.wantsLayer = YES;
    CALayer *layer = self.view.layer;
    layer.backgroundColor = [NSColor darkGrayColor].CGColor;
}


#pragma mark DPOutlineView

- (void) prepareDatasource {
    [outline clearSections];
    NSLog(@"%s", __PRETTY_FUNCTION__);

    NSArray *jobs = [_apiModel jobsForTaskArray: _model.tasksForSelectedFocusType];

    DPOutlineViewSection *section;
    for (Job *job in jobs) {
        section = [[DPOutlineViewSection alloc] initWithTitle: job.title];
        NSArray *tasks = [_apiModel tasksForJobId: job.id];
        for (Task *task in tasks) {
            [section addItem: [[DPOutlineViewItem alloc] initWithTitle: task.title]];
        }
        [outline addSection: section];
    }

}


#pragma mark Setters

- (void) setOutline: (DPOutlineView *) outline1 {
    outline = outline1;
    outline.outlineDelegate = self;
}



#pragma mark BOAPIDelegate

- (void) getTasksSucceeded {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [outline reloadData];

}


@end