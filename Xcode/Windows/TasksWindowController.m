//
// Created by Dani Postigo on 1/23/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "TasksWindowController.h"
#import "TasksController.h"
#import "SidebarController.h"

@implementation TasksWindowController

- (void) windowDidLoad {
    [super windowDidLoad];
    NSLog(@"%s", __PRETTY_FUNCTION__);

}

- (IBAction) showWindow: (id) sender {
    [super showWindow: sender];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}


@end