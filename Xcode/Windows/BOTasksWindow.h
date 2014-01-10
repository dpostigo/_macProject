//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BOWindow.h"
#import "BOAPIDelegate.h"

@class DDSplitView;

@interface BOTasksWindow : BOWindow <BOAPIDelegate> {

    IBOutlet DDSplitView *splitView;

}

@property(nonatomic, strong) DDSplitView *splitView;
@end