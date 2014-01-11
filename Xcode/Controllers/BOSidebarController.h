//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BOAPI/BOAPIDelegate.h>
#import "DPOutlineView.h"
#import "BOViewController.h"

@class DPOutlineView;

@interface BOSidebarController : BOViewController <DPOutlineViewDelegate,
        BOAPIDelegate> {
    IBOutlet DPOutlineView *outline;
}

@property(nonatomic, strong) DPOutlineView *outline;
@end