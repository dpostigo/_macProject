//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/User.h>
#import "BOTasksWindow.h"
#import "Model.h"
#import "NSWorkspaceNib.h"
#import "DDSplitView.h"
#import "GetTasksOperation.h"

@implementation BOTasksWindow

@synthesize splitView;

- (id) initWithContentRect: (NSRect) contentRect styleMask: (NSUInteger) aStyle backing: (NSBackingStoreType) bufferingType defer: (BOOL) flag {
    self = [super initWithContentRect: contentRect styleMask: aStyle backing: bufferingType defer: flag];
    if (self) {
    }

    return self;
}


- (void) awakeFromNib {
    [super awakeFromNib];
}


- (void) userDidLogin: (User *) user {
    [_queue addOperation: [[GetTasksOperation alloc] init]];
}



#pragma mark Navigation


@end