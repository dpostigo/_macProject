//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicTableViewController.h"
#import "BasicTableViewDelegate.h"
#import "DataSection.h"
#import "DataItemObject.h"
#import "BasicTableCellView.h"
#import "BasicTextFieldCellView.h"
#import "BasicTableRowView.h"

@implementation BasicTableViewController {
}

@synthesize table;
@synthesize tableDelegate;

@synthesize allowsSelection;

- (void) loadView {
    [super loadView];
    tableDelegate = [[BasicTableViewDelegate alloc] initWithViewController: self];
    table.delegate = tableDelegate;
    table.dataSource = tableDelegate;
    self.allowsSelection = YES;
}

#pragma mark UITableView



- (NSInteger) numberOfRowsInTableView: (NSTableView *) tableView {
    return [self numberOfRows];
}

- (id) tableView: (NSTableView *) tableView objectValueForTableColumn: (NSTableColumn *) tableColumn row: (NSInteger) row {
    NSUInteger columnIndex = [table.tableColumns indexOfObject: tableColumn];
    DataSection *tableSection = [dataSource objectAtIndex: columnIndex];
    DataItemObject *rowObject = [tableSection.rows objectAtIndex: row];
    return [self objectValueForTableSection: tableSection andRow: rowObject];
}

- (NSView *) tableView: (NSTableView *) tableView viewForTableColumn: (NSTableColumn *) tableColumn row: (NSInteger) row {
    NSUInteger columnIndex = [table.tableColumns indexOfObject: tableColumn];
    DataSection *tableSection = [dataSource objectAtIndex: columnIndex];
    DataItemObject *rowObject = [tableSection.rows objectAtIndex: row];
    return [self cellForRowObject: rowObject tableSection: tableSection];
}

- (CGFloat) tableView: (NSTableView *) tableView heightOfRow: (NSInteger) row {

    DataSection *tableSection = [dataSource objectAtIndex: 0];
    DataItemObject *rowObject = [tableSection.rows objectAtIndex: row];
    return [self heightForRowObject: rowObject tableSection: tableSection];
}

- (BOOL) selectionShouldChangeInTableView: (NSTableView *) tableView {
    return allowsSelection;
}

- (NSTableRowView *) tableView: (NSTableView *) tableView rowViewForRow: (NSInteger) row {
    DataSection *tableSection = [dataSource objectAtIndex: 0];
    DataItemObject *rowObject = [tableSection.rows objectAtIndex: row];
    return [self tableRowView: rowObject tableSection: tableSection];
}



#pragma mark BasicTableViewController

- (NSTableRowView *) tableRowView: (DataItemObject *) rowObject tableSection: (DataSection *) tableSection {
    BasicTableRowView *rowView = [[BasicTableRowView alloc] init];
    return rowView;
}

- (CGFloat) heightForRowObject: (DataItemObject *) rowObject tableSection: (DataSection *) tableSection {
    return 30;
}

- (NSView *) cellForRowObject: (DataItemObject *) rowObject tableSection: (DataSection *) tableSection {
    BasicTableCellView *cell;
    if (rowObject.cellIdentifier != nil) {
        if ([rowObject.cellIdentifier isEqualToString: @"TextFieldCell"]) {
            BasicTextFieldCellView *textFieldCell = [table makeViewWithIdentifier: rowObject.cellIdentifier owner: self];
            cell = textFieldCell;
        } else {
            cell = [table makeViewWithIdentifier: rowObject.cellIdentifier owner: self];
        }
    } else {
        cell = [table makeViewWithIdentifier: @"DataCell" owner: self];
    }

    [self configureCell: cell forRowObject: rowObject tableSection: tableSection];

    return cell;
}

- (id) objectValueForTableSection: (DataSection *) tableSection andRow: (DataItemObject *) rowObject {
    return rowObject.textLabel;
    return nil;
}

- (NSInteger) numberOfRows {
    if ([dataSource count] == 0) return 0;
    DataSection *tableSection = [dataSource objectAtIndex: 0];
    return [tableSection.rows count];
}

- (void) configureCell: (BasicTableCellView *) cell forRowObject: (DataItemObject *) rowObject tableSection: (DataSection *) tableSection {

    if ([cell isKindOfClass: [BasicTextFieldCellView class]]) {
        [cell.textField.cell setPlaceholderString: rowObject.textLabel];
    } else {
        cell.textField.stringValue = rowObject.textLabel;
    }
}


#pragma mark IBActions


- (void) insertRowObject: (DataItemObject *) rowObject inSection: (DataSection *) tableSection {
    [self insertRowObject: rowObject inSection: tableSection withAnimation: NSTableViewAnimationEffectFade];
}


- (void) insertRowObject: (DataItemObject *) rowObject inSection: (DataSection *) tableSection withAnimation: (NSTableViewAnimationOptions) options {
    [tableSection.rows addObject: rowObject];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex: tableSection.rows.count - 1];
    [table insertRowsAtIndexes: indexSet withAnimation: options];
}



#pragma mark Callbacks


@end