//
// Created by Dani Postigo on 1/14/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/User.h>
#import "TaskEditController.h"
#import "NSColor+BlendingUtils.h"
#import "NSColor+Crayola.h"
#import "DPOutlineView.h"
#import "Model.h"
#import "Task.h"
#import "Job.h"
#import "NSColor+DPColors.h"

@implementation TaskEditController

@synthesize outline;

@synthesize task;

- (void) viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self customizeBackground];

}


- (void) setOutline: (DPOutlineView *) outline1 {
    outline = outline1;
    if (outline) {
        outline.outlineDelegate = self;
    }
}


#pragma mark Outline data

- (void) prepareDatasource {
    [outline clearSections];
    DPOutlineViewSection *section = [[DPOutlineViewSection alloc] initWithTitle: self.task.title];
    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: self.task.job.title]];
    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: self.task.assignee.title image: [NSImage imageNamed: @"assignee-icon"]]];
    [outline addSection: section];

}

- (void) customizeBackground {
    self.view.wantsLayer = YES;
    CALayer *layer = self.view.layer;

    NSColor *bgColor = [NSColor colorWithWhite: 0.99 alpha: 1.0];
    //    bgColor = [NSColor crayolaOrangeYellowColor];
    //    bgColor = [NSColor crayolaDandelionColor];
    //    bgColor = [NSColor crayolaYellowColor];

    layer.backgroundColor = bgColor.CGColor;
    layer.cornerRadius = 3.0;
    layer.borderColor = [NSColor lighten: bgColor amount: 0.5].CGColor;
    layer.borderWidth = 0.5;
    layer.masksToBounds = YES;

    layer.shadowColor = [NSColor crayolaMummysTombColor].CGColor;
    layer.shadowColor = [NSColor crayolaOuterSpaceColor].CGColor;
    layer.shadowOpacity = 1.0;
    layer.shadowRadius = 1.0;
    layer.shadowOffset = CGSizeMake(0, -1);

}

- (void) modelDidSelectTask: (Task *) task {
    [super modelDidSelectTask: task];
    self.task = _model.selectedTask;

    [outline reloadData];

}


- (void) outlineViewDidReload {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"outline.height = %f", outline.height);

//    NSLayoutConstraint *heightConstraint = outline.heightC;

}




@end