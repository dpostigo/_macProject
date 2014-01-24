//
// Created by Dani Postigo on 1/22/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/Job.h>
#import "CreateLogController.h"
#import "NSColor+BlendingUtils.h"
#import "AppStyles.h"
#import "Log.h"

@implementation CreateLogController

@synthesize selectedLog;

- (NSArray *) fields {
    return @[@"Log note", @"Service Item", @"Date", @"Time"];
}

- (void) viewDidLoad {
    [super viewDidLoad];

    datePicker.dateValue = [NSDate date];
    [self customizeBackground];
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
    layer.masksToBounds = NO;


    //    layer.shadowColor = [NSColor crayolaMummysTombColor].CGColor;
    //    layer.shadowColor = [NSColor crayolaOuterSpaceColor].CGColor;
    //    layer.shadowOpacity = 1.0;
    //    layer.shadowRadius = 1.0;
    //    layer.shadowOffset = CGSizeMake(0, -1);

}

#pragma mark Notifications

- (void) modelDidSelectLog: (Log *) log {
    self.selectedLog = log;
    [objectController setContent: log];

    submitButton.title = @"Update Log";

}


- (IBAction) submit: (id) sender {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    self.selectedLog = nil;
    submitButton.title = @"Create Log";

}

@end