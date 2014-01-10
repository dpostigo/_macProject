//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "BOSidebarController.h"
#import "DPOutlineView.h"
#import "BOFocusTypes.h"

@implementation BOSidebarController

@synthesize outline;

- (void) viewDidLoad {
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

    DPOutlineViewSection *section = [[DPOutlineViewSection alloc] initWithTitle: @"Focus"];

    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: kBOFocusTypeDue image: [NSImage imageNamed: @"due-icon-dark.png"]]];
    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: kBOFocusTypeToday image: [NSImage imageNamed: @"today-icon-dark"]]];
    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: kBOFocusTypeObserving image: [NSImage imageNamed: @"observers-icon"]]];
    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: kBOFocusTypeMyTasks image: [NSImage imageNamed: @"mytasks-icon-selected"]]];

    [outline addSection: section];

}


@end