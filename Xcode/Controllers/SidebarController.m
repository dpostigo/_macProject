//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <NSColor-Crayola/NSColor+Crayola.h>
#import "SidebarController.h"
#import "BOFocusTypes.h"
#import "BOAPIModel.h"
#import "Model.h"
#import "Job.h"
#import "BOAPIModel+Utils.h"
#import "DPTableCellView.h"
#import "DPOutlineViewItem.h"
#import "DPOutlineViewSection.h"
#import "DPTableRowView.h"
#import "DPOutlineView.h"

@implementation SidebarController

@synthesize outline;

- (void) viewDidLoad {
    [super viewDidLoad];
    [outline reloadData];

    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = self.backgroundColor.CGColor;

}


- (void) setOutline: (DPOutlineView *) outlineView1 {
    outline = outlineView1;
    if (outline) {
        outline.outlineDelegate = self;
        outline.target = self;
        outline.action = @selector(testAction:);
        outline.rowViewClass = [DPTableRowView class];
    }
}

- (void) testAction: (id) sender {
    [self didSelectItem: [outline itemAtRow: outline.selectedRow]];
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
            [section addItem: [[DPOutlineViewItem alloc] initWithTitle: job.title image: [NSImage imageNamed: @"due-icon-dark.png"] identifier: job.id]];
        }
        [outline addSection: section];

    }

}




#pragma mark Cells


- (void) willDisplayHeader: (NSTableCellView *) cellView forSection: (DPOutlineViewSection *) section {
    if ([cellView isKindOfClass: [DPTableCellView class]]) {
        [self willDisplayDPHeader: (DPTableCellView *) cellView forSection: section];
    }
}


- (void) willDisplayCell: (NSTableCellView *) cellView forItem: (DPOutlineViewItem *) item {
    if ([cellView isKindOfClass: [DPTableCellView class]]) {
        [self willDisplayTableCellView: (DPTableCellView *) cellView forItem: item];
    }
}

- (void) willDisplayDPHeader: (DPTableCellView *) cellView forSection: (DPOutlineViewSection *) section {
    cellView.textLabel.textColor = self.headerTextColor;
    cellView.wantsLayer = YES;
    //    cellView.layer.backgroundColor = [NSColor blackColorWithAlpha: 0.5].CGColor;
}

- (void) willDisplayTableCellView: (DPTableCellView *) cellView forItem: (DPOutlineViewItem *) item {
    cellView.textLabel.textColor = self.itemTextColor;
}


- (void) didSelectItem: (DPOutlineViewItem *) item {
    if ([item.section.title isEqualToString: @"Focus"]) {
        _model.selectedFocusType = item.title;
    } else {

        NSString *jobId = item.identifier;
        _model.selectedJob = [_apiModel jobForId: jobId];
    }
}




#pragma mark BOAPIDelegate

- (void) jobsDidUpdate {
    [outline reloadData];
}

- (void) jobsDidUpdate: (Job *) job {
    [outline reloadData];

}



#pragma mark Colors


- (NSColor *) backgroundColor {
    return [NSColor crayolaOnyxColor];
}

- (NSColor *) headerTextColor {
    return [NSColor crayolaQuickSilverColor];
}

- (NSColor *) itemTextColor {
    return [NSColor controlColor];
}

@end