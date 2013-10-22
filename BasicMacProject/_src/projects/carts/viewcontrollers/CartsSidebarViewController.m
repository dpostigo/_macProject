//
//  CartsSidebarViewController.m
//  Carts
//
//  Created by Daniela Postigo on 6/17/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartsSidebarViewController.h"
#import "OutlineSection+Utils.h"
#import "NSMutableArray+BasicObject.h"

#define USER_LISTS @"My Lists"

@implementation CartsSidebarViewController {

    NSTrackingArea *trackingArea;
}

- (void) loadView {
    [super loadView];
    trackingArea = [[NSTrackingArea alloc] initWithRect: self.view.frame options: (NSTrackingMouseEnteredAndExited | NSTrackingMouseMoved | NSTrackingActiveInKeyWindow) owner: self userInfo: nil];
    [self.view addTrackingArea: trackingArea];

}

- (void) prepareDataSource {
    [super prepareDataSource];

    [dataSource addObject: [OutlineSection expandableSectionWithTitle: @"My Lists" rows: _model.lists]];
    [dataSource addObject: [OutlineSection expandableSectionWithTitle: @"Lists By Store" rows: [NSArray arrayWithObjects: @"ASOS", @"Forever 21", @"Sephora", @"Urban OutFitters", nil]]];
}


- (void) cellSelectedForRowObject: (TableRowObject *) rowObject outlineSection: (OutlineSection *) outlineSection {
    [super cellSelectedForRowObject: rowObject outlineSection: outlineSection];

    if ([outlineSection.title isEqualToString: USER_LISTS]) {
        _model.selectedList = rowObject.content;

    }

}

@end