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


@implementation DPOutlineViewSection {
    NSString *title;
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
    [self.items addObject: item];
}

@end


#pragma mark  DPOutlineViewItem

@implementation DPOutlineViewItem {
    NSString *title;
    NSImage *image;
}

@synthesize title;
@synthesize image;

- (instancetype) initWithTitle: (NSString *) aTitle {
    return [self initWithTitle: aTitle image: nil];
}


- (instancetype) initWithTitle: (NSString *) aTitle image: (NSImage *) anImage {
    self = [super init];
    if (self) {
        title = aTitle;
        image = anImage;
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
    if ([item isKindOfClass: [DPOutlineViewSection class]]) {

        ret = [item title];
    } else {
        ret = item;
    }
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
//- (void) outline: (NSOutlineView *) outline setObjectValue: (id) object forTableColumn: (NSTableColumn *) tableColumn byItem: (id) item {
//
//}
//
- (id) outlineView: (NSOutlineView *) outlineView itemForPersistentObject: (id) object {
    //    NSLog(@"%s", __PRETTY_FUNCTION__);
    return nil;
}

- (id) outlineView: (NSOutlineView *) outlineView persistentObjectForItem: (id) item {
    //    NSLog(@"%s", __PRETTY_FUNCTION__);
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

    //    NSLog(@"%s, item = %@, ret = %@", __PRETTY_FUNCTION__, item, ret);
    return ret;
}

- (BOOL) outlineView: (NSOutlineView *) outlineView isGroupItem: (id) item {
    BOOL ret = [item isKindOfClass: [DPOutlineViewSection class]];
    ret = [self.sections containsObject: item];
    //    NSLog(@"%s, item = %@, ret = %d", __PRETTY_FUNCTION__, item, ret);
    return ret;
}
//
//- (BOOL) outline: (NSOutlineView *) outline shouldExpandItem: (id) item {
//    BOOL ret = NO;
//    if ([item isKindOfClass: [DPOutlineViewSection class]]) {
//       ret = YES;
//    }
//    return ret;
//}

//- (BOOL) outline: (NSOutlineView *) outline shouldCollapseItem: (id) item {
//    return NO;
//}





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