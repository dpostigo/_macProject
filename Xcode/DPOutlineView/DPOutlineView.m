//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "DPOutlineView.h"
#import "NSOutlineView+DPUtils.h"



#pragma mark DPOutlineViewSection
@interface DPOutlineViewSection ()

@property(nonatomic, strong) NSMutableArray *items;

@end


@implementation DPOutlineViewSection {
    NSString *title;
    NSMutableArray *items;
}

@synthesize title;
@synthesize items;

- (instancetype) initWithTitle: (NSString *) aTitle items: (NSMutableArray *) anItems {
    self = [super init];
    if (self) {
        title = aTitle;
        items = [NSMutableArray arrayWithArray: anItems];
    }

    return self;
}


- (instancetype) initWithTitle: (NSString *) aTitle {
    return [self initWithTitle: aTitle items: nil];
}

- (NSUInteger) itemCount {
    return [self.items count];
}

- (DPOutlineViewItem *) itemAtIndex: (NSUInteger) index {
    return [self.items objectAtIndex: index];
}

- (void) addItem: (DPOutlineViewItem *) item {
    item.section = self;
    [self.items addObject: item];
}

@end


#pragma mark  DPOutlineViewItem

@implementation DPOutlineViewItem {
    NSString *title;
    NSImage *image;
    NSString *identifier;
}

@synthesize title;
@synthesize image;
@synthesize identifier;

@synthesize section;

- (instancetype) initWithTitle: (NSString *) aTitle {
    return [self initWithTitle: aTitle image: nil];
}


- (instancetype) initWithTitle: (NSString *) aTitle image: (NSImage *) anImage {
    return [self initWithTitle: aTitle image: anImage identifier: nil];
}

- (instancetype) initWithTitle: (NSString *) aTitle identifier: (NSString *) anIdentifier {
    return [self initWithTitle: aTitle image: nil identifier: anIdentifier];
}

- (instancetype) initWithTitle: (NSString *) aTitle image: (NSImage *) anImage identifier: (NSString *) anIdentifier {
    self = [super init];
    if (self) {
        title = aTitle;
        image = anImage;
        identifier = anIdentifier;
    }

    return self;
}

@end


#pragma mark DPOutlineView

@interface DPOutlineView ()

@property(nonatomic, strong) NSMutableArray *sections;
@end

@implementation DPOutlineView {
    NSMutableArray *sections;
    NSObject *cellsHolder;
}

@synthesize sections;
@synthesize autoExpands;
@synthesize outlineDelegate;

- (void) awakeFromNib {
    [super awakeFromNib];

    [self awakeCells];

    autoExpands = YES;

    super.dataSource = self;
    super.delegate = self;
    self.floatsGroupRows = NO;

    //    [self reloadData];
}


- (void) awakeCells {
    cellsHolder = [[NSObject alloc] init];
    NSView *ret = nil;
    ret = [self makeViewWithIdentifier: @"HeaderCell" owner: cellsHolder];
    ret = [self makeViewWithIdentifier: @"DataCell" owner: cellsHolder];
}


- (void) reloadData {
    [self callSelector: @selector(prepareDatasource) object: nil];
    [self prepareDatasource];
    [super reloadData];

    if (autoExpands) {
        [self expandAllItems];
    }


    [self callSelector: @selector(outlineViewDidReload) object: nil];
}

- (void) expandAllItems {
    for (int j = 0; j < [self sectionCount]; j++) {
        [self expandItem: [self sectionAtIndex: j]];
    }
}


- (void) prepareDatasource {

    //    DPOutlineViewSection *section = [[DPOutlineViewSection alloc] initWithTitle: @"Section 1"];
    //    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: @"Item 1"]];
    //    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: @"Item 2"]];
    //    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: @"Item 3"]];
    //    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: @"Item 4"]];
    //
    //    [self.sections addObject: section];

}




#pragma mark NSOutlineViewDataSource

- (NSInteger) outlineView: (NSOutlineView *) outlineView numberOfChildrenOfItem: (id) item {
    NSInteger ret = 0;
    if (item == nil) {
        ret = [self.sections count];
    } else {
        DPOutlineViewSection *section = item;
        ret = [section itemCount];
    }
    return ret;
}

- (id) outlineView: (NSOutlineView *) outlineView child: (NSInteger) index1 ofItem: (id) item {
    id ret = nil;
    if (item == nil)
        ret = [self sectionAtIndex: index1];
    else {
        DPOutlineViewSection *section = item;
        ret = [section itemAtIndex: index1];
    }
    return ret;
}

- (BOOL) outlineView: (NSOutlineView *) outlineView isItemExpandable: (id) item {
    BOOL ret = NO;
    if ([item isKindOfClass: [DPOutlineViewSection class]]) {
        DPOutlineViewSection *section = item;
        ret = section.itemCount > 0;
    }
    return ret;
}

- (id) outlineView: (NSOutlineView *) outlineView objectValueForTableColumn: (NSTableColumn *) tableColumn byItem: (id) item {
    id ret = nil;
    if ([item isKindOfClass: [DPOutlineViewSection class]]) {

        ret = [item title];
    } else {
        ret = item;
    }
    return ret;
}




#pragma mark NSOutlineView delegate

- (NSView *) outlineView: (NSOutlineView *) outlineView viewForTableColumn: (NSTableColumn *) tableColumn item: (id) item {

    NSView *ret = nil;
    if ([item isKindOfClass: [DPOutlineViewSection class]]) {
        ret = [outlineView makeViewWithIdentifier: @"HeaderCell" owner: cellsHolder];
        [self callSelector: @selector(willDisplayCellView:forSection:) object: ret object: item];
    } else {
        ret = [outlineView makeViewWithIdentifier: @"DataCell" owner: cellsHolder];
        [self callSelector: @selector(willDisplayCellView:forItem:) object: ret object: item];
    }

    return ret;
}

- (BOOL) outlineView: (NSOutlineView *) outlineView isGroupItem: (id) item {
    return [self.sections containsObject: item];
}


- (void) outlineView: (NSOutlineView *) outlineView willDisplayCell: (id) cell forTableColumn: (NSTableColumn *) tableColumn item: (id) item {
}


- (void) outlineView: (NSOutlineView *) outlineView mouseDownInHeaderOfTableColumn: (NSTableColumn *) tableColumn {

}






#pragma mark Row views

- (NSTableRowView *) outlineView: (NSOutlineView *) outlineView rowViewForItem: (id) item {
    NSTableRowView *ret = [self rowViewForItem: item];
    return ret;
}


- (NSTableRowView *) rowViewForItem: (id) item {
    NSTableRowView *ret = nil;
    if (outlineDelegate && [outlineDelegate respondsToSelector: @selector(rowViewForItem:)]) {
        ret = [outlineDelegate rowViewForItem: item];
    }
    return ret;
}

- (void) didAddRowView: (NSTableRowView *) rowView forRow: (NSInteger) row {
    [super didAddRowView: rowView forRow: row];

    id item = [self itemAtRow: row];
    if ([item isKindOfClass: [DPOutlineViewSection class]]) {
        [self didAddRowView: rowView forSection: item];
    } else {
        [self didAddRowView: rowView forItem: item];
    }
}


- (void) didAddRowView: (NSTableRowView *) rowView forSection: (DPOutlineViewSection *) section {
    [self callSelector: @selector(didAddRowView:forSection:) object: rowView object: section];
}


- (void) didAddRowView: (NSTableRowView *) rowView forItem: (DPOutlineViewItem *) item {
    [self callSelector: @selector(didAddRowView:forItem:) object: rowView object: item];
}



#pragma mark Selection



- (BOOL) selectionShouldChangeInOutlineView: (NSOutlineView *) outlineView {
    return YES;
}

- (BOOL) outlineView: (NSOutlineView *) outlineView shouldSelectItem: (id) item {
    BOOL ret = YES;
    if ([item isKindOfClass: [DPOutlineViewSection class]]) {
        ret = NO;
    }
    return ret;
}

- (void) outlineViewSelectionDidChange: (NSNotification *) notification {
    id item = [self itemAtRow: self.selectedRow];
    if ([item isKindOfClass: [DPOutlineViewSection class]]) {

    } else {
        [self didSelectItem: item];
    }

}

- (void) didSelectItem: (DPOutlineViewItem *) item {
    [self callSelector: @selector(didSelectItem:) object: item];
}






#pragma mark Sections

#pragma mark Sections

- (void) clearSections {
    [self.sections removeAllObjects];
}

- (DPOutlineViewSection *) sectionAtIndex: (NSUInteger) index {
    DPOutlineViewSection *ret = nil;
    if ([self.sections count] > index) {
        ret = [self.sections objectAtIndex: index];
    }
    return ret;
}

- (void) addSection: (DPOutlineViewSection *) section {
    [self.sections addObject: section];
}

- (NSUInteger) sectionCount {
    return [self.sections count];
}

- (NSMutableArray *) sections {
    if (sections == nil) {
        sections = [[NSMutableArray alloc] init];
    }
    return sections;
}



#pragma mark Call selectors


- (void) callSelector: (SEL) selector object: (id) object {
    [self callSelector: selector object: object object: nil object: nil];
}

- (void) callSelector: (SEL) selector object: (id) object object: (id) object2 {
    [self callSelector: selector object: object object: object2 object: nil];
}

- (void) callSelector: (SEL) selector object: (id) object object: (id) object2 object: (id) object3 {
    if (outlineDelegate && [outlineDelegate respondsToSelector: selector]) {
        id theDelegate = outlineDelegate;
        IMP imp = [theDelegate methodForSelector: selector];
        void (*func)(id, SEL, id, id, id) = (void *) imp;
        func(theDelegate, selector, object, object2, object3);
    }
}
@end