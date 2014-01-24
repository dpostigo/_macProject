//
// Created by Dani Postigo on 1/23/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DividerSplitView : NSSplitView <NSSplitViewDelegate> {

    NSColor *dividerColor;
}

@property(nonatomic, strong) NSColor *dividerColor;
@end