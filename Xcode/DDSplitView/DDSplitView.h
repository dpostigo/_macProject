//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DDSplitViewDelegate <NSObject>


@optional

- (void) splitViewWillResizeSubviews: (NSNotification *) notification;
- (void) splitViewDidResizeSubviews: (NSNotification *) notification;
@end

@class DDSplitViewContainer;

@interface DDSplitView : NSSplitView <NSSplitViewDelegate> {


    BOOL allowsMouseDown;
    NSUInteger sidebarIndex;
    NSMutableArray *containers;
    BOOL isAwake;

    NSColor *splitDividerColor;

    __unsafe_unretained IBOutlet id <DDSplitViewDelegate> splitDelegate;

}

@property(nonatomic) NSUInteger sidebarIndex;
@property(nonatomic) BOOL isAwake;
@property(nonatomic, strong) NSMutableArray *containers;

@property(nonatomic, strong) NSColor *splitDividerColor;
@property(nonatomic, assign) id <DDSplitViewDelegate> splitDelegate;
@property(nonatomic) BOOL allowsMouseDown;
- (NSView *) subviewAtIndex: (NSInteger) index1;
- (DDSplitViewContainer *) containerAtIndex: (NSInteger) index1;
- (void) setSubviewAtIndex: (NSInteger) index1 with: (NSView *) view;
- (void) setMinimumValue: (CGFloat) value atIndex: (NSInteger) index1;
- (void) lockContainerAtIndex: (NSInteger) index1;
@end