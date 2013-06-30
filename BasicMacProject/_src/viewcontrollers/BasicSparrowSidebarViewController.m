//
//  BasicSparrowSidebarViewController.m
//  Carts
//
//  Created by Daniela Postigo on 6/23/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicSparrowSidebarViewController.h"


@implementation BasicSparrowSidebarViewController {

}


- (void) loadView {
    [super loadView];

    self.allowsSelection = YES;
    outline.backgroundColor = [NSColor colorWithString: @"292D35"];
    [self expand];
}



#pragma mark NSOutlineViewDelegate -


- (BasicTableCellView *) cellForRowObject: (TableRowObject *) rowObject outlineSection: (OutlineSection *) outlineSection {
    BasicTableCellView *cell = [super cellForRowObject: rowObject outlineSection: outlineSection];
    cell.textField.textColor = [NSColor whiteColor];
    return cell;
}

- (BasicTableCellView *) headerCellForOutlineSection: (OutlineSection *) outlineSection {
    BasicTableCellView *cell = [super headerCellForOutlineSection: outlineSection];
    cell.textLabel.textColor = [NSColor whiteColor];
    cell.textLabel.text = outlineSection.title;

    return cell;
}



#pragma mark IBActions


#pragma mark Callbacks


@end