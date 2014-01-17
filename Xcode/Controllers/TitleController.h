//
// Created by Dani Postigo on 1/15/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BOAPI/BOAPIDelegate.h>
#import "BOController.h"
#import "DDSplitView.h"

@class DDSplitView;

@interface TitleController : BOController <BOAPIDelegate, DDSplitViewDelegate> {


    IBOutlet NSButton *addButton;
    IBOutlet NSTextField *titleLabel;


    IBOutlet DDSplitView *splitView;
    IBOutlet DDSplitView *mainSplitView;

    IBOutlet NSView *thirdView;

}

@property(nonatomic, strong) DDSplitView *splitView;
@property(nonatomic, strong) DDSplitView *mainSplitView;
@property(nonatomic, strong) NSButton *addButton;
@property(nonatomic, strong) NSTextField *titleLabel;
@end