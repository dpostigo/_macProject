//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BOController.h"

@class DDSplitView;

@interface MainController : BOController {
    IBOutlet DDSplitView *splitView;
    IBOutlet DDSplitView *contentSplitView;
    IBOutlet NSSplitView *vanilla;

}

@property(nonatomic, strong) DDSplitView *splitView;
@end