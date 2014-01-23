//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BOAPI/BOAPIDelegate.h>
#import "BOController.h"
#import "DPOutlineViewDelegate.h"

@class DPOutlineView;

@interface SidebarController : BOController <DPOutlineViewDelegate,
        BOAPIDelegate,
        NSTextViewDelegate> {
    IBOutlet DPOutlineView *outline;
}

@property(nonatomic, strong) DPOutlineView *outline;
@end