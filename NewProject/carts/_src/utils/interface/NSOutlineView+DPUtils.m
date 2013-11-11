//
//  NSOutlineView+DPUtils.m
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSOutlineView+DPUtils.h"
#import "BasicOutlineViewController.h"

@implementation NSOutlineView (DPUtils)

- (void) selectFirstItem {
    [self selectItemAtRow: 0 section: 0];
}

- (void) selectItemAtRow: (NSInteger) rowIndex section: (NSInteger) sectionIndex {

    if (self.dataSource) {
        if ([self.dataSource isKindOfClass: [BasicOutlineViewController class]]) {
            BasicOutlineViewController *controller = (BasicOutlineViewController *) self.dataSource;
            if (sectionIndex < [controller.dataSource count]) {
                OutlineSection *section = [controller.dataSource objectAtIndex: sectionIndex];
                if (section && rowIndex < [section.rows count]) {

                    [self selectItem: [section.rows objectAtIndex: 0]];
                }

            }

        }
    }

}

- (void) selectItem: (id) item {
    NSInteger itemIndex = [self rowForItem: item];
    if (itemIndex < 0) {
        //        [self expandParentsOfItem: item];
        itemIndex = [self rowForItem: item];
        if (itemIndex < 0)
            return;
    }

    [self selectRowIndexes: [NSIndexSet indexSetWithIndex: itemIndex] byExtendingSelection: NO];

}
@end