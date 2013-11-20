//
// Created by Daniela Postigo on 5/15/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicOutlineViewController.h"
#import "BasicTextFieldCellView.h"
#import "OutlineRowObject.h"

@implementation BasicOutlineViewController

@synthesize outline;
@synthesize allowsSelection;

- (void) loadView {
    [super loadView];
    outline.delegate = self;
    outline.dataSource = self;
    outline.floatsGroupRows = NO;
    //    [outline reloadData];
}

- (void) expand {
    [outline expandItem: nil expandChildren: YES];
}


#pragma mark Selection

- (BOOL) selectionShouldChangeInOutlineView: (NSOutlineView *) outlineView {
    return self.allowsSelection;
}


- (BOOL) outlineView: (NSOutlineView *) outlineView shouldSelectItem: (id) item {
    OutlineSection *outlineSection;
    if ([item isKindOfClass: [OutlineRowObject class]]) {
        DataItemObject *rowObject = item;
        outlineSection = [outline parentForItem: item];
        [self cellSelectedForRowObject: rowObject outlineSection: outlineSection];
    }
    return self.allowsSelection;
}


#pragma mark NSOutlineViewDelegate


- (NSView *) outlineView: (NSOutlineView *) outlineView viewForTableColumn: (NSTableColumn *) tableColumn item: (id) item {

    if ([item isKindOfClass: [OutlineSection class]]) {
        OutlineSection *outlineSection = item;
        BasicTableCellView *result = [self headerCellForOutlineSection: outlineSection];
        result.textField.stringValue = [outlineSection.title uppercaseString];
        return result;
    } else {

        DataItemObject *rowObject = item;
        OutlineSection *outlineSection = [outline parentForItem: item];

        BasicTableCellView *cell = [self cellForRowObject: rowObject outlineSection: outlineSection];
        [self configureCell: cell forRowObject: rowObject outlineSection: outlineSection];
        return cell;
    }
}

- (NSTableRowView *) outlineView: (NSOutlineView *) outlineView rowViewForItem: (id) item {
    NSTableRowView *rowView = nil;
    if ([item isKindOfClass: [OutlineSection class]]) {
        OutlineSection *outlineSection = item;
        rowView = [self rowViewForOutlineSection: outlineSection];
    } else {
        DataItemObject *rowObject = item;
        OutlineSection *outlineSection = [outline parentForItem: item];
        rowView = [self rowViewForRowObject: rowObject outlineSection: outlineSection];
    }
    return rowView;
}

- (id) outlineView: (NSOutlineView *) outlineView child: (NSInteger) index ofItem: (id) item {
    id ret;
    if (item == nil) {
        ret = [dataSource objectAtIndex: index];
    } else {
        OutlineSection *tableSection = item;
        ret = [tableSection.rows objectAtIndex: index];
    }
    return ret;
}

- (NSInteger) outlineView: (NSOutlineView *) outlineView numberOfChildrenOfItem: (id) item {
    NSInteger ret = -1;
    if (item == nil) {
        ret = [dataSource count];
    } else {
        OutlineSection *tableSection = item;
        ret = [tableSection.rows count];
    }
    return ret;
}

- (BOOL) outlineView: (NSOutlineView *) outlineView shouldShowOutlineCellForItem: (id) item {
    //BOOL isOutlineSection = [item isKindOfClass: [OutlineSection class]];

    if ([item isKindOfClass: [OutlineSection class]]) {
        OutlineSection *outlineSection = item;
        return outlineSection.isExpandable;
    }

    return YES;
}

- (BOOL) outlineView: (NSOutlineView *) outlineView isGroupItem: (id) item {
    BOOL ret = [dataSource containsObject: item];
    return ret;
}

- (BOOL) outlineView: (NSOutlineView *) outlineView isItemExpandable: (id) item {
    return [item isKindOfClass: [OutlineSection class]];
}


#pragma mark Rects

- (CGFloat) outlineView: (NSOutlineView *) outlineView heightOfRowByItem: (id) item {
    if ([item isKindOfClass: [OutlineSection class]]) {
        OutlineSection *outlineSection = item;
        return [self heightForHeaderSection: outlineSection];
    } else {
        DataItemObject *rowObject = item;
        OutlineSection *outlineSection = [outline parentForItem: item];
        return [self heightForRowObject: rowObject outlineSection: outlineSection];
    }
}


- (CGFloat) heightForHeaderSection: (OutlineSection *) outlineSection {
    return outline.rowHeight;
}

- (CGFloat) heightForRowObject: (DataItemObject *) rowObject outlineSection: (OutlineSection *) outlineSection {
    return outline.rowHeight;
}


- (void) outlineView: (NSOutlineView *) outlineView willDisplayCell: (id) cell forTableColumn: (NSTableColumn *) tableColumn item: (id) item {

}



#pragma mark BasicOutlineViewController


- (BasicTableCellView *) cellForRowObject: (DataItemObject *) rowObject outlineSection: (OutlineSection *) outlineSection {
    BasicTableCellView *cell;
    if (rowObject.cellIdentifier != nil) {

        if ([rowObject.cellIdentifier isEqualToString: @"TextFieldCell"]) {
            BasicTextFieldCellView *textFieldCell = [outline makeViewWithIdentifier: rowObject.cellIdentifier owner: self];
            cell = textFieldCell;

        } else {
            cell = [outline makeViewWithIdentifier: rowObject.cellIdentifier owner: self];
        }
    } else {
        cell = [outline makeViewWithIdentifier: @"DataCell" owner: self];
    }
    return cell;
}

- (BasicTableCellView *) headerCellForOutlineSection: (OutlineSection *) outlineSection {
    BasicTableCellView *cell;
    if (outlineSection.cellIdentifier != nil) {
        cell = [outline makeViewWithIdentifier: outlineSection.cellIdentifier owner: self];
    } else {
        cell = [outline makeViewWithIdentifier: @"HeaderCell" owner: self];
    }
    return cell;
}

- (BasicTableRowView *) rowViewForRowObject: (DataItemObject *) rowObject outlineSection: (OutlineSection *) outlineSection {
    return nil;
}

- (BasicTableRowView *) rowViewForOutlineSection: (OutlineSection *) outlineSection {
    return nil;
}


- (void) configureCell: (BasicTableCellView *) tableCell forRowObject: (DataItemObject *) rowObject outlineSection: (OutlineSection *) outlineSection {
    tableCell.textField.stringValue = rowObject.textLabel;
}

- (void) cellSelectedForRowObject: (DataItemObject *) rowObject outlineSection: (OutlineSection *) tableSection {
}
@end