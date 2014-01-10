//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "DPOutlineView.h"



#pragma mark DPOutlineViewSection
@interface DPOutlineViewSection () {

    NSMutableArray *items;
}

@property(nonatomic, strong) NSMutableArray *items;

@end


@implementation DPOutlineViewSection

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
    [self.items addObject: item];
}

@end


#pragma mark  DPOutlineViewItem

@implementation DPOutlineViewItem

@synthesize title;

- (instancetype) initWithTitle: (NSString *) aTitle {
    self = [super init];
    if (self) {
        title = aTitle;
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

- (void) awakeFromNib {
    [super awakeFromNib];

    autoExpands = YES;

    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self awakeCells];

    self.dataSource = self;
    self.delegate = self;

    [self reloadData];
}

- (void) awakeCells {

    cellsHolder = [[NSObject alloc] init];
    NSView *ret = nil;
    ret = [self makeViewWithIdentifier: @"HeaderCell" owner: cellsHolder];
    ret = [self makeViewWithIdentifier: @"DataCell" owner: cellsHolder];

}


- (void) reloadData {
    [self prepareDatasource];
    [super reloadData];

    if (autoExpands) {
        [self expandAllItems];
    }
}

- (void) expandAllItems {

    for (int j = 0; j < [self sectionCount]; j++) {
        [self expandItem: [self sectionAtIndex: j]];
    }

}



//- (BOOL) isExpandable: (id) item {
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//    return [super isExpandable: item];
//}
//
//- (id) parentForItem: (id) item {
//    NSLog(@"%s, item = %@", __PRETTY_FUNCTION__, item);
//    return [super parentForItem: item];
//}
//
//- (id) itemAtRow: (NSInteger) row {
//    id ret = [super itemAtRow: row];
//    //    NSLog(@"%s, row = %li, ret = %@", __PRETTY_FUNCTION__, row, ret);
//    return ret;
//}

//- (NSInteger) rowForItem: (id) item {
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//    return [super rowForItem: item];
//}


- (void) prepareDatasource {
    sections = [[NSMutableArray alloc] init];

    DPOutlineViewSection *section = [[DPOutlineViewSection alloc] initWithTitle: @"Section 1"];
    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: @"Item 1"]];
    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: @"Item 2"]];
    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: @"Item 3"]];
    //    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: @"Item 4"]];

    [self.sections addObject: section];

}

- (void) addSection {

}


- (DPOutlineViewSection *) sectionAtIndex: (NSUInteger) index {
    DPOutlineViewSection *ret = nil;
    if ([self.sections count] > index) {
        ret = [self.sections objectAtIndex: index];
    }
    return ret;
}


#pragma mark NSOutlineViewDataSource
#pragma mark Conventional data source -

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
    if (item == nil) {
        ret = [self sectionAtIndex: index1];
    } else {
        DPOutlineViewSection *section = item;
        ret = [section itemAtIndex: index1];
    }
    //    NSLog(@"%s, index = %li, item = %@, ret = %@", __PRETTY_FUNCTION__, index1, item, ret);
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
    ret = [item title];
    //    if (item == nil) {
    //        ret = [self sectionAtIndex: index];
    //    } else {
    //        DPOutlineViewSection *section = item;
    //        ret = [section itemAtIndex: index];
    //    }

    return ret;
}


//
//#pragma mark Additional
//- (void) outlineView: (NSOutlineView *) outlineView setObjectValue: (id) object forTableColumn: (NSTableColumn *) tableColumn byItem: (id) item {
//
//}
//
- (id) outlineView: (NSOutlineView *) outlineView itemForPersistentObject: (id) object {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return nil;
}

- (id) outlineView: (NSOutlineView *) outlineView persistentObjectForItem: (id) item {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return nil;
}





#pragma mark NSOutlineView delegate

- (NSView *) outlineView: (NSOutlineView *) outlineView viewForTableColumn: (NSTableColumn *) tableColumn item: (id) item {

    NSView *ret = nil;
    if ([item isKindOfClass: [DPOutlineViewSection class]]) {
        ret = [outlineView makeViewWithIdentifier: @"HeaderCell" owner: cellsHolder];
    } else {
        ret = [outlineView makeViewWithIdentifier: @"DataCell" owner: cellsHolder];
    }

    NSLog(@"%s, item = %@, ret = %@", __PRETTY_FUNCTION__, item, ret);
    return ret;
}

- (BOOL) outlineView: (NSOutlineView *) outlineView isGroupItem: (id) item {
    BOOL ret = [item isKindOfClass: [DPOutlineViewSection class]];
    ret = [self.sections containsObject: item];
    //    NSLog(@"%s, item = %@, ret = %d", __PRETTY_FUNCTION__, item, ret);
    return ret;
}
//
//- (BOOL) outlineView: (NSOutlineView *) outlineView shouldExpandItem: (id) item {
//    BOOL ret = NO;
//    if ([item isKindOfClass: [DPOutlineViewSection class]]) {
//       ret = YES;
//    }
//    return ret;
//}

//- (BOOL) outlineView: (NSOutlineView *) outlineView shouldCollapseItem: (id) item {
//    return NO;
//}





#pragma mark Sections

- (NSUInteger) sectionCount {
    return [self.sections count];
}

- (NSMutableArray *) sections {
    if (sections == nil) {
        sections = [[NSMutableArray alloc] init];
    }
    return sections;
}


@end