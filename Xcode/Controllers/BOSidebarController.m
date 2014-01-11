//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "BOSidebarController.h"
#import "BOFocusTypes.h"
#import "BOAPIModel.h"
#import "Model.h"
#import "Job.h"
#import "BOAPIModel+Utils.h"

@implementation BOSidebarController

@synthesize outline;

- (void) viewDidLoad {
    [super viewDidLoad];
    [outline reloadData];
}


- (void) setOutline: (DPOutlineView *) outlineView1 {
    outline = outlineView1;
    if (outline) {
        outline.outlineDelegate = self;
    }
}


#pragma mark DPOutlineView

- (void) prepareDatasource {
    [outline clearSections];

    DPOutlineViewSection *section = nil;

    section = [[DPOutlineViewSection alloc] initWithTitle: @"Focus"];
    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: kBOFocusTypeDue image: [NSImage imageNamed: @"due-icon-dark.png"]]];
    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: kBOFocusTypeToday image: [NSImage imageNamed: @"today-icon-dark"]]];
    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: kBOFocusTypeObserving image: [NSImage imageNamed: @"observers-icon"]]];
    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: kBOFocusTypeMyTasks image: [NSImage imageNamed: @"mytasks-icon-selected"]]];
    [outline addSection: section];

    NSArray *jobTypes = [Job types];

    for (NSString *jobType in jobTypes) {
        NSArray *jobs = [_apiModel jobsWithStatus: jobType];

        section = [[DPOutlineViewSection alloc] initWithTitle: jobType];
        for (Job *job in jobs) {
            [section addItem: [[DPOutlineViewItem alloc] initWithTitle: job.title image: [NSImage imageNamed: @"due-icon-dark.png"]]];
        }
        [outline addSection: section];

    }

}


- (void) getTasksSucceeded {
    [outline reloadData];

}


@end