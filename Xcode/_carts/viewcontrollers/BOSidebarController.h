//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPOutlineView.h"

@class DPOutlineView;

@interface BOSidebarController : NSViewController <DPOutlineViewDelegate> {
    IBOutlet DPOutlineView *outline;
}

@property(nonatomic, strong) DPOutlineView *outline;
@end