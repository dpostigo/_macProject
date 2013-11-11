//
//  BasicStyledOutlineViewController.m
//  Carts
//
//  Created by Daniela Postigo on 6/23/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicStyledOutlineViewController.h"
#import "StyledRowView.h"

@implementation BasicStyledOutlineViewController {

}

- (void) loadView {
    [super loadView];

    outline.backgroundColor = [NSColor colorWithString: @"F2F2F2"];
    //    outline.top -= 10;

    NSScrollView *scrollView = outline.enclosingScrollView;
    NSClipView *clipView = scrollView.contentView;
    //    scrollView.top += 3;
    //    scrollView.height += 3;

    outline.indentationPerLevel = 0.5;
    self.allowsSelection = YES;

    [self expand];
}






#pragma mark NSOutlineViewDelegate

- (BasicTableRowView *) rowViewForRowObject: (DataItemObject *) rowObject outlineSection: (OutlineSection *) outlineSection {
    StyledRowView *rowView = [[StyledRowView alloc] init];
    return rowView;

}

- (BasicTableRowView *) rowViewForOutlineSection: (OutlineSection *) outlineSection {
    BasicCustomRowView *rowView = [[BasicCustomRowView alloc] init];
    rowView.borderColor = [NSColor darkGrayColor];
    rowView.borderType = BorderTypeTop | BorderTypeBottom;
    return rowView;
}

- (BasicTableCellView *) headerCellForOutlineSection: (OutlineSection *) outlineSection {
    BasicTableCellView *cell = [super headerCellForOutlineSection: outlineSection];
    //    cell.textFieldCustom.text = [outlineSection.title uppercaseString];
    return cell;
}

- (void) configureCell: (BasicTableCellView *) tableCell forRowObject: (DataItemObject *) rowObject outlineSection: (OutlineSection *) outlineSection {
    [super configureCell: tableCell forRowObject: rowObject outlineSection: outlineSection];

    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [NSColor whiteColor];
    shadow.shadowBlurRadius = 0;
    shadow.shadowOffset = NSMakeSize(0, -1);

    //    tableCell.textFieldCustom.attributedStringValue = [NSAttributedString attributedStringWithString: rowObject.textLabel font: [NSFont fontWithName: tableCell.textFieldCustom.font.fontName size: 10.0] textColor: tableCell.textFieldCustom.textColor shadow: shadow];
    //    [tableCell.textField setHidden: YES];
}



#pragma mark IBActions


#pragma mark Callbacks




@end