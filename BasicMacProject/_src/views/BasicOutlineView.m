//
// Created by dpostigo on 2/18/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicOutlineView.h"


@implementation BasicOutlineView {
}


@synthesize showsDisclosureTriangles;
@synthesize disclosureRect;

- (id) initWithCoder: (NSCoder *) aDecoder {
    self = [super initWithCoder: aDecoder];
    if (self) {
        self.showsDisclosureTriangles = NO;
    }

    return self;
}

//
//- (void) setShowsDisclosureTriangles: (BOOL) showsDisclosureTriangles1 {
//    showsDisclosureTriangles = showsDisclosureTriangles1;
//    if (!showsDisclosureTriangles) disclosureRect = NSZeroRect;
//}
//
//
//- (NSRect) frameOfOutlineCellAtRow: (NSInteger) row {
//    return disclosureRect;
//}


//
//
//- (NSRect) frameOfCellAtColumn: (NSInteger) column row: (NSInteger) row {
//    NSRect superFrame = [super frameOfCellAtColumn: column row: row];
//
//    //
//    //    if ((column == 0) /* && isGroupRow */) {
//    //        return NSMakeRect(0, superFrame.origin.y, [self bounds].size.width, superFrame.size.height);
//    //    }
//
//    if (column == 0) {
//        return NSMakeRect(0, superFrame.origin.y, [self bounds].size.width, superFrame.size.height);
//    }
//    return superFrame;
//}

- (NSRect) frameOfOutlineCellAtRow: (NSInteger) row {
    NSRect rect = [super frameOfOutlineCellAtRow: row];
    //    rect.size.height = self.rowHeight;
    NSLog(@"NSStringFromRect(frameOfOutlineCellAtRow) = %@", NSStringFromRect(rect));
    return rect;
}


- (NSRect) frameOfCellAtColumn: (NSInteger) column row: (NSInteger) row {
    NSRect rect = [super frameOfCellAtColumn: column row: row];
    NSLog(@"NSStringFromRect(frameOfCellAtColumn) = %@", NSStringFromRect(rect));
    return rect;
}


@end