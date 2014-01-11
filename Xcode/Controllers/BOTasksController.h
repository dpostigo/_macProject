//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BOAPI/BOAPIDelegate.h>
#import "BOViewController.h"
#import "DPOutlineView.h"

@class DPOutlineView;

@interface BOTasksController : BOViewController <DPOutlineViewDelegate, BOAPIDelegate> {

    IBOutlet DPOutlineView *outline;

}

@property(nonatomic, strong) DPOutlineView *outline;
@end