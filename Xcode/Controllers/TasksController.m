//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/User.h>
#import "TasksController.h"
#import "Model.h"
#import "Model+TaskUtils.h"
#import "BOAPIModel+Utils.h"
#import "Job.h"
#import "Task.h"
#import "DPTableRowView.h"
#import "NSColor+DPColors.h"
#import "CALayer+ConstraintUtils.h"

@implementation TasksController

@synthesize outline;

- (void) viewDidLoad {
    [super viewDidLoad];
    [outline reloadData];

    self.view.wantsLayer = YES;

    CALayer *layer = self.view.layer;
    layer.backgroundColor = [NSColor colorWithWhite: 0.9 alpha: 1.0].CGColor;

    CALayer *innerShadow = [CALayer layer];
    innerShadow.borderColor = [NSColor redColor].CGColor;
    innerShadow.borderWidth = 1.0;

    innerShadow.shadowColor = [NSColor blackColor].CGColor;
    innerShadow.shadowOpacity = 1.0;
    innerShadow.shadowOffset = CGSizeMake(0, -2);
    innerShadow.shadowRadius = 1.0;

    outline.wantsLayer = YES;
}


#pragma mark DPOutlineView

- (void) prepareDatasource {
    [outline clearSections];

    NSArray *jobs = [_apiModel jobsForTaskArray: _model.tasksForSelectedFocusType];

    DPOutlineViewSection *section;
    for (Job *job in jobs) {
        section = [[DPOutlineViewSection alloc] initWithTitle: job.title];
        NSArray *tasks = [_apiModel tasksForJobId: job.id];
        for (Task *task in tasks) {
            [section addItem: [[DPOutlineViewItem alloc] initWithTitle: task.title identifier: task.id]];
        }
        [outline addSection: section];
    }

}


- (NSTableRowView *) rowViewForItem: (id) item {
    DPTableRowView *ret = nil;
    //    if ([item isKindOfClass: [DPOutlineViewSection class]]) {
    ret = [[DPTableRowView alloc] init];
    //    }
    return ret;
}


- (void) willDisplayCellView: (NSTableCellView *) cellView forSection: (DPOutlineViewSection *) section {
    cellView.textField.stringValue = [section.title uppercaseString];


    //    [cellView.textField bind: @"value" toObject: section withKeyPath: @"title" options: nil];

}

- (void) willDisplayCellView: (NSTableCellView *) view forItem: (DPOutlineViewItem *) item {

    //    view.wantsLayer = YES;
    //
    //    [view.layer makeSuperlayer];
    //    //    view.layer.masksToBounds = NO;
    //
    //    CALayer *fillLayer = [CALayer layer];
    //    fillLayer.backgroundColor = [NSColor offwhiteColor].CGColor;
    //    fillLayer.borderColor = [NSColor whiteColor].CGColor;
    //    fillLayer.borderWidth = 1;
    //    fillLayer.cornerRadius = 3.0;
    //
    //    //    fillLayer.shadowColor = [NSColor blackColor].CGColor;
    //    //    fillLayer.shadowOpacity = 1.0;
    //    //    fillLayer.shadowOffset = CGSizeMake(0, -2);
    //    //    fillLayer.shadowRadius = 1.0;
    //    [view.layer insertSublayer: fillLayer atIndex: 0];
    //    [fillLayer superConstrain];
    //
    //
    //    //    [fillLayer superConstrainEdgesH: 0];
    //    //    [fillLayer superConstrainTopEdge: 5];
    //    //    [fillLayer superConstrainBottomEdge: 0];
    //
    //    //    CALayer *shadowLayer = [CALayer layer];
    //    //    shadowLayer.masksToBounds = NO;
    //    //    shadowLayer.backgroundColor = [NSColor offwhiteColor].CGColor;
    //    //    shadowLayer.shadowColor = [NSColor blackColor].CGColor;
    //    //    shadowLayer.shadowOpacity = 1.0;
    //    //    shadowLayer.shadowOffset = CGSizeMake(0, 1);
    //    //    shadowLayer.shadowRadius = 5.0;
    //    //    [view.layer insertSublayer: shadowLayer atIndex: 0];
    //    //    [shadowLayer superConstrainEdges: 2];
    //
    //    view.layer.bounds = view.bounds;

}

- (void) didSelectItem: (DPOutlineViewItem *) item {

    NSLog(@"%s", __PRETTY_FUNCTION__);

    NSLog(@"item.identifier = %@", item.identifier);
    Task *task = [_apiModel taskForId: item.identifier];
    _model.selectedTask = task;

}



#pragma mark Setters

- (void) setOutline: (DPOutlineView *) outline1 {
    outline = outline1;
    outline.outlineDelegate = self;
}



#pragma mark BOAPIDelegate

- (void) tasksDidUpdate {
    [outline reloadData];
}



#pragma mark Navigation

- (void) modelDidSelectFocusType {
    [super modelDidSelectFocusType];
    [outline reloadData];
}


@end