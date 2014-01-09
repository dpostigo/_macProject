//
//  DPSplitView.h
//  TaskManager
//
//  Created by Daniela Postigo on 5/26/13.
//  Copyright 2013 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DPSplitView;


@protocol DPSplitViewDelegate <NSObject>

@optional
- (void) basicSplitView: (DPSplitView *) basicSplitView didResizeSplitContainer: (DPSplitViewContainer *) splitContainer;


@end

@interface DPSplitView : NSSplitView <DPSplitContainerDelegate> {
    __unsafe_unretained id <DPSplitViewDelegate> secondDelegate;
    NSColor *dividerColor;

    NSMutableArray *privateContainers;

}

@property(nonatomic, strong) NSColor *dividerColor;
@property(nonatomic, assign) id <DPSplitViewDelegate> secondDelegate;

- (void) setup;
- (NSMutableArray *) splitContainers;
- (void) addViewController: (NSViewController *) viewController;
- (CGFloat) heightForSplitContainerAtIndex: (NSInteger) index1 proposedHeight: (CGFloat) proposed;
- (CGFloat) widthForSplitContainerAtIndex: (NSInteger) index1 proposedWidth: (CGFloat) proposed;
- (DPSplitViewContainer *) splitViewContainerAtIndex: (NSInteger) index1;

@end