//
// Created by Dani Postigo on 1/21/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <DPKit/NSWorkspaceNib.h>
#import "Model+BOControllers.h"
#import "TaskCreationController.h"
#import "FooterController.h"

@implementation Model (BOControllers)

- (NSViewController *) taskCreationController {
    return [[TaskCreationController alloc] initWithNibName: @"TaskCreationView" bundle: nil];
}


- (NSViewController *) sidebarController {
    return [self.masterNib controllerForClass: @"SidebarController"];
    //    return [[TaskCreationController alloc] initWithNibName: @"TaskCreationView" bundle: nil];
}


- (NSViewController *) footerController {
    return [[FooterController alloc] initWithNibName: @"FooterController" bundle: nil];
}
@end