//
//  BasicSplitView.h
//  TaskManager
//
//  Created by Daniela Postigo on 5/26/13.
//  Copyright 2013 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SplitViewContainer.h"

@class BasicSplitView;


@protocol BasicSplitViewDelegate <NSObject>

@optional
- (void) basicSplitView: (BasicSplitView *) basicSplitView didResizeSplitContainer: (SplitViewContainer *) splitContainer;


@end

@interface BasicSplitView : NSSplitView <SplitViewContainerDelegate> {
    __unsafe_unretained id <BasicSplitViewDelegate> secondDelegate;
    NSColor *dividerColor;

    NSMutableArray *privateContainers;

}

@property(nonatomic, strong) NSColor *dividerColor;
@property(nonatomic, assign) id <BasicSplitViewDelegate> secondDelegate;
- (void) setup;
- (NSMutableArray *) splitContainers;
- (CGFloat) heightForSplitContainerAtIndex: (NSInteger) index1 proposedHeight: (CGFloat) proposed;
- (CGFloat) widthForSplitContainerAtIndex: (NSInteger) index1 proposedWidth: (CGFloat) proposed;
- (SplitViewContainer *) splitViewContainerAtIndex: (NSInteger) index1;
@end