//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "DPOutlineView.h"

@implementation DPOutlineView

- (void) awakeFromNib {
    [super awakeFromNib];

    super.delegate = self;
    super.dataSource = self;
}



#pragma mark NSOutlineViewDataSource
#pragma mark Conventional data source -

- (NSInteger) outlineView: (NSOutlineView *) outlineView numberOfChildrenOfItem: (id) item {
    NSInteger ret = 0;
    NSLog(@"%s, item = %@", __PRETTY_FUNCTION__, item);
    return 0;
}

- (id) outlineView: (NSOutlineView *) outlineView child: (NSInteger) index1 ofItem: (id) item {
    return nil;
}

- (BOOL) outlineView: (NSOutlineView *) outlineView isItemExpandable: (id) item {
    return NO;
}

- (id) outlineView: (NSOutlineView *) outlineView objectValueForTableColumn: (NSTableColumn *) tableColumn byItem: (id) item {
    return nil;
}



- (void) outlineView: (NSOutlineView *) outlineView setObjectValue: (id) object forTableColumn: (NSTableColumn *) tableColumn byItem: (id) item {

}

- (id) outlineView: (NSOutlineView *) outlineView itemForPersistentObject: (id) object {
    return nil;
}

- (id) outlineView: (NSOutlineView *) outlineView persistentObjectForItem: (id) item {
    return nil;
}

- (void) outlineView: (NSOutlineView *) outlineView sortDescriptorsDidChange: (NSArray *) oldDescriptors {

}

- (id <NSPasteboardWriting>) outlineView: (NSOutlineView *) outlineView pasteboardWriterForItem: (id) item {
    return nil;
}

- (void) outlineView: (NSOutlineView *) outlineView draggingSession: (NSDraggingSession *) session willBeginAtPoint: (NSPoint) screenPoint forItems: (NSArray *) draggedItems {

}

- (void) outlineView: (NSOutlineView *) outlineView draggingSession: (NSDraggingSession *) session endedAtPoint: (NSPoint) screenPoint operation: (NSDragOperation) operation {

}

- (BOOL) outlineView: (NSOutlineView *) outlineView writeItems: (NSArray *) items toPasteboard: (NSPasteboard *) pasteboard {
    return NO;
}

- (void) outlineView: (NSOutlineView *) outlineView updateDraggingItemsForDrag: (id <NSDraggingInfo>) draggingInfo {

}

- (NSDragOperation) outlineView: (NSOutlineView *) outlineView validateDrop: (id <NSDraggingInfo>) info proposedItem: (id) item proposedChildIndex: (NSInteger) index1 {
    return 0;
}

- (BOOL) outlineView: (NSOutlineView *) outlineView acceptDrop: (id <NSDraggingInfo>) info item: (id) item childIndex: (NSInteger) index1 {
    return NO;
}

- (NSArray *) outlineView: (NSOutlineView *) outlineView namesOfPromisedFilesDroppedAtDestination: (NSURL *) dropDestination forDraggedItems: (NSArray *) items {
    return nil;
}


@end