//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DDSplitView;

@interface TestCartsMainController : NSViewController {
    IBOutlet DDSplitView *splitView;
    IBOutlet NSSplitView *vanilla;

}

@property(nonatomic, strong) DDSplitView *splitView;
@end