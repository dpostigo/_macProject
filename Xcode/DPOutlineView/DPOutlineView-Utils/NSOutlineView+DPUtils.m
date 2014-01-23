//
// Created by Dani Postigo on 1/22/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "NSOutlineView+DPUtils.h"

@implementation NSOutlineView (DPUtils)

- (void) insertItemAtIndex: (NSInteger) index inParent: (id) parent withAnimation: (NSTableViewAnimationOptions) animationOptions {
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex: index];
    [self insertItemsAtIndexes: indexSet inParent: parent withAnimation: animationOptions];
}


- (void) removeItemAtIndex: (NSInteger) index inParent: (id) parent {
    [self removeItemAtIndex: index inParent: parent withAnimation: NSTableViewAnimationEffectGap];
}

- (void) removeItemAtIndex: (NSInteger) index inParent: (id) parent withAnimation: (NSTableViewAnimationOptions) animationOptions {
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex: index];
    [self removeItemsAtIndexes: indexSet inParent: parent withAnimation: animationOptions];
}


- (void) selectFirstItem {
    [self selectItemAtRow: 0 section: 0];
}

- (void) selectItemAtRow: (NSInteger) rowIndex section: (NSInteger) sectionIndex {
    //    if (self.dataSource) {
    //        if ([self.dataSource isKindOfClass: [BasicOutlineViewController class]]) {
    //            BasicOutlineViewController *controller = (BasicOutlineViewController *) self.dataSource;
    //            if (sectionIndex < [controller.dataSource count]) {
    //                OutlineSection *section = [controller.dataSource objectAtIndex: sectionIndex];
    //                if (section && rowIndex < [section.rows count]) {
    //
    //                    [self selectItem: [section.rows objectAtIndex: 0]];
    //                }
    //
    //            }
    //
    //        }
    //    }

}

- (void) selectItem: (id) item {
    NSInteger itemIndex = [self rowForItem: item];
    if (itemIndex < 0) {
        itemIndex = [self rowForItem: item];
        if (itemIndex < 0)
            return;
    }

    [self selectRowIndexes: [NSIndexSet indexSetWithIndex: itemIndex] byExtendingSelection: NO];

}
@end