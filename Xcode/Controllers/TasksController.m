//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/User.h>
#import "TasksController.h"
#import "Model.h"
#import "Model+TaskUtils.h"
#import "BOAPIModel+Utils.h"
#import "Job.h"
#import "Task.h"
#import "DPTableRowView.h"
#import "NSColor+DPColors.h"
#import "CALayer+ConstraintUtils.h"
#import "DPOutlineViewItem.h"
#import "DPOutlineViewSection.h"
#import "AppStyles.h"
#import "NSView+NewConstraint.h"
#import "CALayer+SublayerUtils.h"

@implementation TasksController

@synthesize outline;

- (void) viewDidLoad {
    [super viewDidLoad];

    //    self.view.wantsLayer = YES;
    //
    //    CALayer *layer = self.view.layer;
    //    layer.backgroundColor = [NSColor colorWithWhite: 0.9 alpha: 1.0].CGColor;
    //
    //    CALayer *innerShadow = [CALayer layer];
    //    innerShadow.borderColor = [NSColor redColor].CGColor;
    //    innerShadow.borderWidth = 1.0;
    //
    //    innerShadow.shadowColor = [NSColor blackColor].CGColor;
    //    innerShadow.shadowOpacity = 1.0;
    //    innerShadow.shadowOffset = CGSizeMake(0, -2);
    //    innerShadow.shadowRadius = 1.0;

    //    outline.wantsLayer = YES;

    //    [outline reloadData];

    //    NSLog(@"outline.frame = %@", NSStringFromRect(outline.frame));
    //
    NSScrollView *scrollView = outline.enclosingScrollView;
    NSClipView *clipView = scrollView.contentView;
    //
    //    NSRulerView *rulerView = scrollView.verticalRulerView;
    //    NSLog(@"rulerView = %@", rulerView);
    //
    //    NSLog(@"scrollView.frame = %@", NSStringFromRect(scrollView.frame));
    //    NSLog(@"clipView.frame = %@", NSStringFromRect(clipView.frame));
    //
    //    [scrollView setHasVerticalScroller: YES];
    //    scrollView.verticalScroller
    NSLog(@"scrollView.verticalScroller = %@", scrollView.verticalScroller);
    //    [[scrollView horizontalScroller] setAlphaValue: 0];
    //    NSTableView *docView = (NSTableView *) scrollView.documentView;
    //    id newClipView = [[CustomClipView alloc] initWithFrame: [self.scrollView.contentView frame]];
    //    [self.scrollView setContentView: (NSClipView *) newClipView];
    //    [newClipView setDrawsBackground: NO];
    //
    //    NSView *documentContentView = [[NSView alloc] initWithFrame: docView.bounds];
    //    docView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    //    [documentContentView addSubview: docView];
    //    [self.scrollView setDocumentView: documentContentView];
    //    [self.scrollView setDrawsBackground: NO];

}


#pragma mark IBOutlets

- (void) setOutline: (DPOutlineView *) outline1 {
    outline = outline1;
    outline.outlineDelegate = self;
    outline.dragsItems = YES;
}


#pragma mark Cells


- (void) prepareDatasource {
    [outline clearSections];

    NSArray *jobs = [_apiModel jobsForTaskArray: _model.tasksForSelectedFocusType];


    DPOutlineViewSection *section;
    for (Job *job in jobs) {
        section = [[DPOutlineViewSection alloc] initWithTitle: job.title];
        NSArray *tasks = [_apiModel tasksForJobId: job.id];
        for (Task *task in tasks) {
            [section addItem: [[DPOutlineViewItem alloc] initWithTitle: task.title identifier: task.id]];
        }
        [outline addSection: section];
    }

}

- (void) willDisplayHeader: (NSTableCellView *) cellView forSection: (DPOutlineViewSection *) section {
    cellView.textField.stringValue = [section.title uppercaseString];

    //    [cellView.textField bind: @"value" toObject: section withKeyPath: @"title" options: nil];
}


- (void) willDisplayCell: (NSTableCellView *) view forItem: (DPOutlineViewItem *) item {

    view.wantsLayer = YES;
    CALayer *layer = view.layer;
    //    layer.backgroundColor = [NSColor whiteColor].CGColor;

    //    view.wantsLayer = YES;
    //
    //    CALayer *layer = view.layer;
    ////    [layer setGeometryFlipped: YES];
    //
    //    view.shadow = [AppStyles defaultShadowWithRadius: YES];
    //    [AppStyles addDefaultGradient: view.layer];
    ////    [view setNeedsDisplay: YES];
}

- (void) didSelectItem: (DPOutlineViewItem *) item {
    Task *task = [_apiModel taskForId: item.identifier];
    NSLog(@"task = %@", task);
    if (task) {
        NSLog(@"_model = %@", _model);
        _model.selectedTask = task;

    }
}


- (NSTableRowView *) rowViewForItem: (id) item {
    NSTableRowView *ret = nil;
    if ([item isKindOfClass: [DPOutlineViewSection class]]) {
        ret = [self rowViewForHeader: item];
    } else if ([item isKindOfClass: [DPOutlineViewItem class]]) {
        ret = [self rowViewForCell: item];
    }
    return ret;
}


- (NSTableRowView *) rowViewForHeader: (DPOutlineViewSection *) section {

    return nil;
}

- (NSTableRowView *) rowViewForCell: (DPOutlineViewItem *) item {

    DPTableRowView *ret = [[DPTableRowView alloc] init];
    ret.wantsLayer = YES;
    ret.layer.masksToBounds = NO;

    NSView *subview = [[NSView alloc] init];
    subview.translatesAutoresizingMaskIntoConstraints = NO;
    [ret addSubview: subview];
    //    [subview superConstrainLeading: 5];
    //    [subview superConstrainTrailing: 5];
    //    [subview superConstrainTop: 2];
    //    [subview superConstrainBottom: 2];
    [subview superConstrainWithInsets: NSEdgeInsetsMake(0, 0, 4, 0)];

    subview.wantsLayer = YES;
    subview.shadow = [AppStyles defaultShadowWithRadius: 1.0];

    CALayer *layer = subview.layer;
    [layer makeSuperlayer];
    [layer setGeometryFlipped: YES];
    layer.masksToBounds = NO;

    //    layer.masksToBounds = YES;
    [AppStyles addDefaultGradient: layer];
    //    [layer setSublayerCornerRadius: 3.0];
    //    [subview setNeedsDisplay: YES];

    return ret;

}



#pragma mark BOAPIDelegate

- (void) tasksDidUpdate {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [outline reloadData];
}



#pragma mark Navigation

- (void) modelDidSelectFocusType {
    [super modelDidSelectFocusType];
    [outline reloadData];
}


@end