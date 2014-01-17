//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "DPOutlineView.h"
#import "NSOutlineView+DPUtils.h"
#import "NSOutlineView+ItemUtils.h"
#import "NSObject+CallSelector.h"



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
    NSString *subtitle;
    NSImage *image;
    NSString *identifier;
}

@synthesize title;
@synthesize subtitle;
@synthesize image;
@synthesize identifier;
@synthesize section;

- (instancetype) initWithTitle: (NSString *) aTitle {
    return [self initWithTitle: aTitle image: nil];
}


- (instancetype) initWithTitle: (NSString *) aTitle subtitle: (NSString *) aSubtitle image: (NSImage *) anImage {
    return [self initWithTitle: aTitle subtitle: aSubtitle image: anImage identifier: nil];
}

- (instancetype) initWithTitle: (NSString *) aTitle image: (NSImage *) anImage {
    return [self initWithTitle: aTitle subtitle: nil image: anImage identifier: nil];
}

- (instancetype) initWithTitle: (NSString *) aTitle identifier: (NSString *) anIdentifier {
    return [self initWithTitle: aTitle subtitle: nil image: nil identifier: anIdentifier];
}

- (instancetype) initWithTitle: (NSString *) aTitle subtitle: (NSString *) aSubtitle image: (NSImage *) anImage identifier: (NSString *) anIdentifier {
    self = [super init];
    if (self) {
        title = aTitle;
        subtitle = aSubtitle;
        image = anImage;
        identifier = anIdentifier;
    }

    return self;
}

- (instancetype) initWithTitle: (NSString *) aTitle image: (NSImage *) anImage identifier: (NSString *) anIdentifier {
    return [self initWithTitle: aTitle subtitle: nil image: anImage identifier: anIdentifier];
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

@synthesize fitsScrollViewToHeight;
@synthesize isExpanding;
@synthesize isAnimatingBackground;
@synthesize allowsSelection;

@synthesize expandedHeight;

@synthesize unexpandedHeight;

- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {

        allowsSelection = YES;
        NSLog(@"%s", __PRETTY_FUNCTION__);
    }

    return self;
}

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
        [self expandBackground];
    }

    if (fitsScrollViewToHeight) {
        //        [self fitScrollViewToHeight];
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
    //    [self setPostsFrameChangedNotifications: <#(BOOL)flag#>];

}



#pragma mark Height



- (BOOL) isExpanded {
    return [self isItemExpanded: self.firstItem];
}

- (CGFloat) outlineHeight {
    CGFloat ret = 0;

    for (int j = 0; j < self.numberOfRows; j++) {
        NSRect rowRect = [self rectOfRow: j];
        //        NSLog(@"rowRect at %i = %@", j, NSStringFromRect(rowRect));
        ret += rowRect.size.height;
    }

    if (self.numberOfRows > 0) {
        NSRect lastRect = [self rectOfRow: self.numberOfRows - 1];
        //        NSLog(@"lastRect = %@", NSStringFromRect(lastRect));
        ret = lastRect.origin.y + lastRect.size.height;
    }
    return ret;
}

- (NSLayoutConstraint *) scrollViewHeightConstraint {
    NSLayoutConstraint *ret = nil;
    NSArray *constraints = [NSArray arrayWithArray: self.enclosingScrollView.constraints];
    for (NSLayoutConstraint *constraint in constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            ret = constraint;
            break;

        }
    }
    return ret;
}


- (CGFloat) expandedHeight {
    if (expandedHeight == 0 && self.isExpanded) {
        expandedHeight = self.outlineHeight;
    }
    return expandedHeight;
}





#pragma mark Collapse / expand background

- (CGFloat) backgroundAnimationDuration {
    return 0.25;
}

- (void) expandBackground {
    if (self.fitsScrollViewToHeight && !self.isAnimatingBackground) {

        if (self.expandedHeight > 0) {
            NSLayoutConstraint *constraint = self.scrollViewHeightConstraint;
            if (constraint) {
                isAnimatingBackground = YES;
                [NSAnimationContext runAnimationGroup: ^(NSAnimationContext *context) {
                    context.duration = self.backgroundAnimationDuration - 0.05;
                    [constraint.animator setConstant: expandedHeight];

                } completionHandler: ^() {
                    isAnimatingBackground = NO;
                }];
            }

        } else {

        }
    }
}

- (void) collapseBackground {
    if (self.fitsScrollViewToHeight && !self.isAnimatingBackground) {
        NSLayoutConstraint *constraint = self.scrollViewHeightConstraint;
        if (constraint && unexpandedHeight > 0) {
            isAnimatingBackground = YES;
            [NSAnimationContext runAnimationGroup: ^(NSAnimationContext *context) {
                context.duration = self.backgroundAnimationDuration;
                //                context.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut];
                [constraint.animator setConstant: unexpandedHeight];

            } completionHandler: ^() {
                //                NSLog(@"Did collapse background.");
                isAnimatingBackground = NO;
            }];
        }
    }
}


- (NSString *) animationInfoString: (CGFloat) heightValue {
    NSMutableArray *strings = [[NSMutableArray alloc] init];
    //    [strings addObject: @"{"];
    if (heightValue > 0) [strings addObject: [NSString stringWithFormat: @"\t\theightValue = %f", heightValue]];
    [strings addObject: [NSString stringWithFormat: @"\t\tself.height = %f", self.height]];
    [strings addObject: [NSString stringWithFormat: @"\t\tself.isExpanded = %d", self.isExpanded]];
    [strings addObject: [NSString stringWithFormat: @"\t\tself.numberOfRows = %li", self.numberOfRows]];
    [strings addObject: [NSString stringWithFormat: @"\t\tself.outlineHeight = %f", self.outlineHeight]];
    [strings addObject: [NSString stringWithFormat: @"\t\t[self rectOfRow: lastRow] = %@", NSStringFromRect([self rectOfRow: self.numberOfRows - 1])]];
    //    [strings addObject: @"}"];
    NSString *logString = [strings componentsJoinedByString: @", "];
    return logString;
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



#pragma mark Cells

- (NSView *) outlineView: (NSOutlineView *) outlineView viewForTableColumn: (NSTableColumn *) tableColumn item: (id) item {

    NSView *ret = nil;
    if ([item isKindOfClass: [DPOutlineViewSection class]]) {
        ret = [outlineView makeViewWithIdentifier: @"HeaderCell" owner: cellsHolder];
        [self willDisplayCellView: (NSTableCellView *) ret forSection: item];
    } else {
        ret = [outlineView makeViewWithIdentifier: @"DataCell" owner: cellsHolder];
        [self callSelector: @selector(willDisplayCellView:forItem:) object: ret object: item];
    }

    return ret;
}


- (void) willDisplayCellView: (NSTableCellView *) cellView forSection: (DPOutlineViewSection *) section {
//    cellView.textField.stringValue = [section.title uppercaseString];
    [self callSelector: @selector(willDisplayCellView:forSection:) object: cellView object: section];

}


- (BOOL) outlineView: (NSOutlineView *) outlineView isGroupItem: (id) item {
    return [self.sections containsObject: item];
}






#pragma mark Expansion

- (void) outlineViewItemWillCollapse: (NSNotification *) notification {
    expandedHeight = self.outlineHeight;
    [self collapseBackground];

    [self callSelector: @selector(outlineViewItemWillCollapse:) object: notification];
}

- (void) outlineViewItemDidCollapse: (NSNotification *) notification {
    unexpandedHeight = self.outlineHeight;
    [self collapseBackground];

    [self callSelector: @selector(outlineViewItemDidCollapse:) object: notification];
}

- (void) outlineViewItemWillExpand: (NSNotification *) notification {
    [self expandBackground];

    [self callSelector: @selector(outlineViewItemWillExpand:) object: notification];
}


- (void) outlineViewItemDidExpand: (NSNotification *) notification {
    [self expandBackground];

    [self callSelector: @selector(outlineViewItemDidExpand:) object: notification];
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






#pragma mark Selection

- (BOOL) selectionShouldChangeInOutlineView: (NSOutlineView *) outlineView {
    return self.allowsSelection;
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




#pragma mark Re-worked


- (void) didAddRowView: (NSTableRowView *) rowView forSection: (DPOutlineViewSection *) section {
    [self callSelector: @selector(didAddRowView:forSection:) object: rowView object: section];
}


- (void) didAddRowView: (NSTableRowView *) rowView forItem: (DPOutlineViewItem *) item {
    [self callSelector: @selector(didAddRowView:forItem:) object: rowView object: item];
}

- (void) didSelectItem: (DPOutlineViewItem *) item {
    [self callSelector: @selector(didSelectItem:) object: item];
}




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
//    if (outlineDelegate && [outlineDelegate respondsToSelector: selector]) {
//        id theDelegate = outlineDelegate;
//        IMP imp = [theDelegate methodForSelector: selector];
//        void (*func)(id, SEL, id, id, id) = (void *) imp;
//        func(theDelegate, selector, object, object2, object3);
//    }
    [self forwardSelector: selector delegate: outlineDelegate object: object object: object2 object: object2];
}


@end