//
// Created by Daniela Postigo on 5/8/13.
// Copyright (c) 2013 Daniela Postigo. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicFlippedViewController.h"
#import "DPSplitViewController.h"
#import "DPSplitViewContainer.h"

@interface TaskDetailViewController : DPSplitViewController <NSSplitViewDelegate> {
    IBOutlet DPSplitViewContainer *infoContainer;
    IBOutlet DPSplitViewContainer *discussionContainer;
    BOOL isOpen;
}

@property(nonatomic) BOOL isOpen;
- (void) toggleTaskDetails: (id) sender;
- (void) openTaskDetails: (id) sender;
- (void) closeTaskDetails: (id) sender;
@end