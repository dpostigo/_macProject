//
// Created by Dani Postigo on 1/23/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BOController.h"
#import "NotificationDelegate.h"

@class DividerSplitView;
@class DDSplitView;

@interface NewTitleController : BOController <NotificationDelegate> {

    IBOutlet NSTextField *textLabel;
    IBOutlet DDSplitView *splitView;
    IBOutlet NSView *referenceView;

    IBOutlet NSView *rightView;

}

@property(nonatomic, strong) NSView *referenceView;
@end