//
// Created by Dani Postigo on 1/14/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BOController.h"
#import "DPOutlineViewDelegate.h"

@class DPOutlineView;

@interface TaskEditController : BOController <DPOutlineViewDelegate> {

    Task *task;
    IBOutlet DPOutlineView *outline;

}

@property(nonatomic, strong) DPOutlineView *outline;
@property(nonatomic, strong) Task *task;
@end