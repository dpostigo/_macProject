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

}

- (void) loadView {
    [super loadView];

    //    NSLog(@"self.outline.refusesFirstResponder = %d", self.outline.refusesFirstResponder);
    //    NSLog(@"self.outline.enclosingScrollView.nextKeyView = %@", self.outline.enclosingScrollView.nextKeyView);
    //
    //    NSClipView *clipView = self.outline.enclosingScrollView.nextKeyView;
    //    NSLog(@"clipView.nextKeyView = %@", clipView.nextKeyView);
    //    NSLog(@"clipView.nextResponder = %@", clipView.nextResponder);
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


#pragma mark UITableView


#pragma mark IBActions


#pragma mark Callbacks


@end