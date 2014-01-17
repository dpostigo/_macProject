//
// Created by Dani Postigo on 1/14/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/User.h>
#import "TaskEditController.h"
#import "NSColor+BlendingUtils.h"
#import "NSColor+Crayola.h"
#import "DPOutlineView.h"
#import "Model.h"
#import "Task.h"
#import "Job.h"
#import "NSColor+DPColors.h"
#import "NSView+ConstraintGetters.h"
#import "NSArray+BOBasicObject.h"

@implementation TaskEditController

@synthesize task;
@synthesize outline;

- (void) viewDidLoad {
    [super viewDidLoad];

    [outline reloadData];
    [self customizeBackground];

}


- (void) setOutline: (DPOutlineView *) outline1 {
    outline = outline1;
    if (outline) {
        outline.outlineDelegate = self;
        outline.fitsScrollViewToHeight = YES;
        outline.allowsSelection = NO;
    }
}


- (void) customizeBackground {
    self.view.wantsLayer = YES;
    CALayer *layer = self.view.layer;

    NSColor *bgColor = [NSColor colorWithWhite: 0.99 alpha: 1.0];
    //    bgColor = [NSColor crayolaOrangeYellowColor];
    //    bgColor = [NSColor crayolaDandelionColor];
    //    bgColor = [NSColor crayolaYellowColor];

    layer.backgroundColor = bgColor.CGColor;
    layer.cornerRadius = 3.0;
    layer.borderColor = [NSColor lighten: bgColor amount: 0.5].CGColor;
    layer.borderWidth = 0.5;
    layer.masksToBounds = YES;

    layer.shadowColor = [NSColor crayolaMummysTombColor].CGColor;
    layer.shadowColor = [NSColor crayolaOuterSpaceColor].CGColor;
    layer.shadowOpacity = 1.0;
    layer.shadowRadius = 1.0;
    layer.shadowOffset = CGSizeMake(0, -1);

}

#pragma mark Outline data

- (void) prepareDatasource {
    [outline clearSections];
    DPOutlineViewSection *section = [[DPOutlineViewSection alloc] initWithTitle: self.task.title];
    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: self.task.job.title subtitle: @"Job" image: [NSImage imageNamed: @"job-icon-dark"]]];
    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: self.task.assignee.title image: [NSImage imageNamed: @"assignee-icon"]]];
    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: self.task.observerNames subtitle: @"Observers" image: [NSImage imageNamed: @"observers-icon"]]];

    [section addItem: [[DPOutlineViewItem alloc] initWithTitle: self.task.notes subtitle: @"Notes" image: [NSImage imageNamed: @"notes-icon"]]];
    [outline addSection: section];

}

- (void) modelDidSelectTask: (Task *) task {
    [super modelDidSelectTask: task];

    NSLog(@"%s", __PRETTY_FUNCTION__);
    self.task = _model.selectedTask;

    [outline reloadData];

    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration: 0];
    [outline noteHeightOfRowsWithIndexesChanged: [NSIndexSet indexSetWithIndex: 1]];
    [NSAnimationContext endGrouping];

}



#pragma mark Outline

- (void) outlineViewDidReload {
    NSLayoutConstraint *heightConstraint = self.viewHeightConstraint;
    if (heightConstraint == nil) {

        //        heightConstraint.constant = outline.outlineHeight;
    }

}


- (NSLayoutConstraint *) viewHeightConstraint {
    NSLayoutConstraint *ret = nil;
    NSArray *constraints = [NSArray arrayWithArray: self.view.constraints];

    for (NSLayoutConstraint *constraint in constraints) {

        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            ret = constraint;
            break;
        }
    }
    return ret;
}



#pragma mark Cells

- (void) willDisplayCellView: (NSTableCellView *) cellView forItem: (DPOutlineViewItem *) item {
    //    if (item.subtitle) {
    //        [[cellView.textField cell] setPlaceholderString: item.subtitle];
    //    }
    //
    //    if ([item.subtitle isEqualToString: @"Observers"]) {
    //        NSLog(@"cellView.textField.stringValue = %@", cellView.textField.stringValue);
    //        NSLog(@"[cellView.textField.cell placeholderString] = %@", [cellView.textField.cell placeholderString]);
    //
    //    }



    NSDictionary *options = nil;
    if (item.subtitle) {
        options = [NSDictionary dictionaryWithObject: item.subtitle forKey: NSNullPlaceholderBindingOption];
    }

    [cellView.textField bind: @"value" toObject: item withKeyPath: @"title" options: options];

}


@end