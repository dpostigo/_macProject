//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BOAPI/BOAPIDelegate.h>
#import "BOController.h"
#import "DPOutlineView.h"

@class DPOutlineView;

@interface TasksController : BOController <DPOutlineViewDelegate, BOAPIDelegate> {

    IBOutlet DPOutlineView *outline;

}

@property(nonatomic, strong) DPOutlineView *outline;
@end