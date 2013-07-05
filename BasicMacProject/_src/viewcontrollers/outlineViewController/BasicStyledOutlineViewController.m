//
//  BasicStyledOutlineViewController.m
//  Carts
//
//  Created by Daniela Postigo on 6/23/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicStyledOutlineViewController.h"
#import "BasicStyledRowView.h"


@implementation BasicStyledOutlineViewController {

}


- (void) loadView {
    [super loadView];

    outline.backgroundColor     = [NSColor colorWithString: @"F2F2F2"];
    outline.top -= 10;
    outline.indentationPerLevel = 0.5;
    self.allowsSelection        = YES;
    [self expand];
}





#pragma mark NSOutlineViewDelegate

- (BasicTableRowView *) rowViewForRowObject: (TableRowObject *) rowObject outlineSection: (OutlineSection *) outlineSection {
    BasicStyledRowView *rowView = [[BasicStyledRowView alloc] init];
    return rowView;

}


- (BasicTableRowView *) rowViewForOutlineSection: (OutlineSection *) outlineSection {
    BasicCustomRowView *rowView = [[BasicCustomRowView alloc] init];
    rowView.borderColor = [NSColor redColor];
    return rowView;
}


- (BasicTableCellView *) headerCellForOutlineSection: (OutlineSection *) outlineSection {
    BasicTableCellView *cell = [super headerCellForOutlineSection: outlineSection];
    cell.textLabel.text = [outlineSection.title uppercaseString];
    return cell;
}



#pragma mark IBActions


#pragma mark Callbacks




@end