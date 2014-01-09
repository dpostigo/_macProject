//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicFlippedViewController.h"
#import "BasicListViewController.h"
#import "DataItemObject.h"
#import "DataSection.h"
#import "BasicTableCellView.h"

@class BasicTableViewDelegate;


@interface BasicTableViewController : BasicListViewController {

    BOOL allowsSelection;
    IBOutlet NSTableView *table;
    BasicTableViewDelegate *tableDelegate;
}

@property(nonatomic, strong) NSTableView *table;
@property(nonatomic, strong) BasicTableViewDelegate *tableDelegate;
@property(nonatomic) BOOL allowsSelection;
- (NSInteger) numberOfRowsInTableView: (NSTableView *) tableView;
- (id) tableView: (NSTableView *) tableView objectValueForTableColumn: (NSTableColumn *) tableColumn row: (NSInteger) row;
- (NSView *) tableView: (NSTableView *) tableView viewForTableColumn: (NSTableColumn *) tableColumn row: (NSInteger) row;
- (CGFloat) tableView: (NSTableView *) tableView heightOfRow: (NSInteger) row;
- (BOOL) selectionShouldChangeInTableView: (NSTableView *) tableView;
- (NSTableRowView *) tableView: (NSTableView *) tableView rowViewForRow: (NSInteger) row;
- (NSTableRowView *) tableRowView: (DataItemObject *) rowObject tableSection: (DataSection *) tableSection;
- (CGFloat) heightForRowObject: (DataItemObject *) rowObject tableSection: (DataSection *) tableSection;
- (NSView *) cellForRowObject: (DataItemObject *) rowObject tableSection: (DataSection *) tableSection;
- (id) objectValueForTableSection: (DataSection *) tableSection andRow: (DataItemObject *) rowObject;
- (void) configureCell: (BasicTableCellView *) cell forRowObject: (DataItemObject *) rowObject tableSection: (DataSection *) tableSection;
- (void) insertRowObject: (DataItemObject *) rowObject inSection: (DataSection *) tableSection;
- (void) insertRowObject: (DataItemObject *) rowObject inSection: (DataSection *) tableSection withAnimation: (NSTableViewAnimationOptions) options;
@end