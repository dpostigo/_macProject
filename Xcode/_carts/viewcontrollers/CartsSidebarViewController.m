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
#import "NSOutlineView+DPUtils.h"
#import "DataSection+Utils.h"

#define USER_LISTS @"My Lists"

@implementation CartsSidebarViewController {

    NSTrackingArea *trackingArea;
}

- (void) loadView {
    [super loadView];
}

- (void) viewDidMoveToWindow {
    [super viewDidMoveToWindow];
    //NSLog(@"%s", __PRETTY_FUNCTION__);
    //NSLog(@"[_model.lists count] = %lu", [_model.lists count]);
    if ([_model.lists count] > 0) {
        //[outline selectFirstItem];
    }
}


- (void) prepareDataSource {
    [super prepareDataSource];
    [dataSource addObject: [OutlineSection expandableSectionWithTitle: @"My Lists" rows: _model.lists]];
    [dataSource addObject: [OutlineSection expandableSectionWithTitle: @"Lists By Store" rows: [NSArray arrayWithObjects: @"ASOS", @"Forever 21", @"Sephora", @"Urban OutFitters", nil]]];
}


- (void) cellSelectedForRowObject: (DataItemObject *) rowObject outlineSection: (OutlineSection *) outlineSection {
    [super cellSelectedForRowObject: rowObject outlineSection: outlineSection];

    if ([outlineSection.title isEqualToString: USER_LISTS]) {
        _model.selectedList = rowObject.content;
    }

}


#pragma mark Model response


- (void) listsDidUpdate {
    [OutlineSection firstObject: dataSource].rows = _model.lists;
    [outline reloadData];
}

- (void) listDidInit: (List *) list {
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex: 0];

    OutlineSection *section = [dataSource objectAtIndex: 0];
    [section addRow: list];
    [outline insertItemsAtIndexes: indexSet inParent: section withAnimation: NSTableViewAnimationEffectFade];

}

@end