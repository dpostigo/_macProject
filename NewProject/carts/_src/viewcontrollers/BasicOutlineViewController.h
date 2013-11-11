//
// Created by Daniela Postigo on 5/15/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "VeryBasicViewController.h"
#import "BasicListViewController.h"
#import "DataItemObject.h"
#import "OutlineSection.h"
#import "BasicTableRowView.h"
#import "BasicTableCellView.h"
#import "BasicOutlineView.h"

@interface BasicOutlineViewController : BasicListViewController <NSOutlineViewDelegate, NSOutlineViewDataSource> {

    IBOutlet NSOutlineView *outline;
    BOOL allowsSelection;
}

@property(nonatomic, strong) NSOutlineView *outline;
@property(nonatomic) BOOL allowsSelection;
- (void) expand;
- (BasicTableRowView *) rowViewForRowObject: (DataItemObject *) rowObject outlineSection: (OutlineSection *) outlineSection;
- (BasicTableRowView *) rowViewForOutlineSection: (OutlineSection *) outlineSection;
- (CGFloat) heightForHeaderSection: (OutlineSection *) outlineSection;
- (CGFloat) heightForRowObject: (DataItemObject *) rowObject outlineSection: (OutlineSection *) outlineSection;
- (BasicTableCellView *) headerCellForOutlineSection: (OutlineSection *) outlineSection;
- (BasicTableCellView *) cellForRowObject: (DataItemObject *) rowObject outlineSection: (OutlineSection *) outlineSection;
- (void) configureCell: (BasicTableCellView *) tableCell forRowObject: (DataItemObject *) rowObject outlineSection: (OutlineSection *) outlineSection;
- (void) cellSelectedForRowObject: (DataItemObject *) rowObject outlineSection: (OutlineSection *) tableSection;
@end