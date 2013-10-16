//
//  CartsSidebarViewController.m
//  Carts
//
//  Created by Daniela Postigo on 6/17/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartsSidebarViewController.h"
#import "OutlineRowObject.h"

@implementation CartsSidebarViewController {

    NSTrackingArea *trackingArea;
}

- (void) loadView {
    [super loadView];
    trackingArea = [[NSTrackingArea alloc] initWithRect: self.view.frame  options: (NSTrackingMouseEnteredAndExited | NSTrackingMouseMoved | NSTrackingActiveInKeyWindow) owner: self userInfo: nil];
    [self.view addTrackingArea: trackingArea];

}

- (void) prepareDataSource {
    [super prepareDataSource];
    OutlineSection *section = [[OutlineSection alloc] initWithTitle: @"Carts By Store" isExpandable: YES];
    [section.rows addObject: [[OutlineRowObject alloc] initWithTextLabel: @"ASOS"]];
    [section.rows addObject: [[OutlineRowObject alloc] initWithTextLabel: @"Forever21"]];
    [section.rows addObject: [[OutlineRowObject alloc] initWithTextLabel: @"Sephora"]];
    [section.rows addObject: [[OutlineRowObject alloc] initWithTextLabel: @"Urban Outfitters"]];
    [dataSource addObject: section];
}


- (void) mouseMoved: (NSEvent *) theEvent {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [super mouseMoved: theEvent];

}

- (void) mouseEntered: (NSEvent *) theEvent {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [super mouseEntered: theEvent];
}


@end