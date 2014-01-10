//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDSplitView : NSSplitView <NSSplitViewDelegate> {

    NSUInteger sidebarIndex;
    NSMutableArray *containers;
    BOOL isAwake;

}

@property(nonatomic) NSUInteger sidebarIndex;
@property(nonatomic) BOOL isAwake;
@property(nonatomic, strong) NSMutableArray *containers;

- (NSView *) subviewAtIndex: (NSInteger) index1;
- (void) setSubviewAtIndex: (NSInteger) index1 with: (NSView *) view;
- (void) lockContainerAtIndex: (NSInteger) index1;
@end