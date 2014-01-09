//
// Created by Daniela Postigo on 5/18/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class DPSplitViewContainer;

@protocol DPSplitContainerDelegate <NSObject>

@optional
- (void) splitContainerChangedMinimumWidth: (DPSplitViewContainer *) splitContainer;
- (void) splitContainerChangedMaximumWidth: (DPSplitViewContainer *) splitContainer;
- (void) splitContainerChangedMinimumHeight: (DPSplitViewContainer *) splitContainer;
- (void) splitContainerChangedMaximumHeight: (DPSplitViewContainer *) splitContainer;
- (void) splitContainerChangedMaximumValue: (DPSplitViewContainer *) splitContainer;
- (void) splitContainerChangedMinimumValue: (DPSplitViewContainer *) splitContainer;


@end

@interface DPSplitViewContainer : NSView {

    __unsafe_unretained id <DPSplitContainerDelegate> delegate;
    __unsafe_unretained NSViewController *controller;

    CGFloat minimumValue;
    CGFloat maximumValue;

    CGFloat dividerThickness;
    BOOL isLocked;
}

@property(nonatomic) BOOL isLocked;
@property(nonatomic, assign) id <DPSplitContainerDelegate> delegate;
@property(nonatomic, assign) NSViewController *controller;
@property(nonatomic) CGFloat dividerThickness;
@property(nonatomic) CGFloat minimumValue;
@property(nonatomic) CGFloat maximumValue;
@end