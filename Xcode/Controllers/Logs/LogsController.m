//
// Created by Dani Postigo on 1/11/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/ServiceItem.h>
#import <JMSimpleDate/NSDate+JMSimpleDate.h>
#import "LogsController.h"
#import "DPOutlineView.h"
#import "Log.h"
#import "Model.h"
#import "Task.h"
#import "NSArray+BOBasicObject.h"
#import "DPTableCellView.h"
#import "GetLogsOperation.h"
#import "NSDate+DPKit.h"
#import "NSArray+DateUtils.h"
#import "NSDateFormatter+JMSimpleDate.h"
#import "NSColor+Crayola.h"
#import "NSColor+BlendingUtils.h"
#import "NSMutableAttributedString+DPKit.h"
#import "DPOutlineViewItem.h"
#import "DPOutlineViewSection.h"

@implementation LogsController

@synthesize outline;

- (void) viewDidLoad {
    [super viewDidLoad];

}

- (void) awakeFromNib {
    [super awakeFromNib];
    [outline reloadData];
    [self customizeBackground];
}


- (void) setOutline: (DPOutlineView *) outline1 {
    outline = outline1;
    outline.outlineDelegate = self;
    //    outline.fitsScrollViewToHeight = YES;
}


- (void) customizeBackground {
    self.view.wantsLayer = YES;
    CALayer *layer = self.view.layer;

    NSColor *bgColor = [NSColor colorWithString: @"fbe37d"];
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

- (Task *) task {
    return _model.selectedTask;
}



#pragma mark DPOutlineView delegate


- (void) prepareDatasource {
    [outline clearSections];

    if ([self.task.logs count] > 0) {
        DPOutlineViewSection *section;
        NSArray *uniqueDates = self.task.logDates.uniqueDates;
        for (NSDate *uniqueDate in uniqueDates) {
            section = [[DPOutlineViewSection alloc] initWithTitle: [NSDateFormatter formattedStringTimeElapsedFromDate: uniqueDate]];
            NSArray *dateLogs = [self.task logsForDate: uniqueDate];
            for (Log *log in dateLogs) {
                [section addItem: [[DPOutlineViewItem alloc] initWithTitle: log.title identifier: log.id]];
            }
            [outline addSection: section];
        }
    }

}

//}

#pragma mark Cells

- (void) willDisplayCell: (NSTableCellView *) view forItem: (DPOutlineViewItem *) item {
    if ([view isKindOfClass: [DPTableCellView class]]) {
        [self willDisplayOutlineCellView: (DPTableCellView *) view forItem: item];
    }
}


- (void) willDisplayOutlineCellView: (DPTableCellView *) view forItem: (DPOutlineViewItem *) item {
    Log *log = (Log *) [self.task.logs basicObjectForId: item.identifier];

    if (log) {

        //    view.textField.stringValue = [NSString stringWithFormat: @"%@ - %@", log.serviceItem.title, log.title];

        NSFont *font = view.textLabel.font;
        CGFloat pointSize = font.pointSize;

        if (log.serviceItem) {

            NSMutableAttributedString *serviceString = [[NSMutableAttributedString alloc] initWithString: [NSString stringWithFormat: @"%@ ", log.serviceItem.title]];
            [serviceString addAttribute: NSFontAttributeName value: [NSFont boldSystemFontOfSize: pointSize]];
            [serviceString addAttribute: NSForegroundColorAttributeName value: [NSColor blackColor]];

            NSMutableAttributedString *logString = [[NSMutableAttributedString alloc] initWithString: log.title];
            [logString addAttribute: NSFontAttributeName value: [NSFont systemFontOfSize: pointSize]];

            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithAttributedString: serviceString];
            [string appendAttributedString: logString];

            view.textLabel.stringValue = string.string;
            view.textLabel.attributedStringValue = string;

            view.detailTextLabel.stringValue = [NSString stringWithFormat: @"%@", log.timeAsString];
        } else {

            NSLog(@"log = %@", log);
        }
    }

}


- (void) didSelectItem: (DPOutlineViewItem *) item {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    Log *log = [self.task logForId: item.identifier];
    if (log) {
        [_model notifyDelegates: @selector(modelDidSelectLog:) object: log];
    } else {
        NSLog(@"log = %@", log);
    }

}


- (void) modelDidSelectTask: (Task *) task {
    [super modelDidSelectTask: task];

    [outline reloadData];

    NSLog(@"_model.selectedTask = %@", _model.selectedTask);
    if (_model.selectedTask) {
        [_queue addOperation: [[GetLogsOperation alloc] initWithTask: self.task]];
        //[self.task addObserver: self forKeyPath: @"logs" options: 0 context: NULL];
    }
}


- (void) logsDidUpdate: (Task *) task {
    [super logsDidUpdate: task];
    [outline reloadData];
}


@end