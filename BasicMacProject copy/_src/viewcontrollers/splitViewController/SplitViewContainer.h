//
// Created by Daniela Postigo on 5/18/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class SplitViewContainer;

@protocol SplitViewContainerDelegate <NSObject>

@optional
- (void) splitContainerChangedMinimumWidth: (SplitViewContainer *) splitContainer;
- (void) splitContainerChangedMaximumWidth: (SplitViewContainer *) splitContainer;
- (void) splitContainerChangedMinimumHeight: (SplitViewContainer *) splitContainer;
- (void) splitContainerChangedMaximumHeight: (SplitViewContainer *) splitContainer;
- (void) splitContainerChangedMaximumValue: (SplitViewContainer *) splitContainer;
- (void) splitContainerChangedMinimumValue: (SplitViewContainer *) splitContainer;


@end

@interface SplitViewContainer : NSView {

    __unsafe_unretained id <SplitViewContainerDelegate> delegate;
    __unsafe_unretained NSViewController *controller;

    CGFloat minimumValue;
    CGFloat maximumValue;

    CGFloat dividerThickness;
    BOOL isLocked;
}

@property(nonatomic) BOOL isLocked;
@property(nonatomic, assign) id <SplitViewContainerDelegate> delegate;
@property(nonatomic, assign) NSViewController *controller;
@property(nonatomic) CGFloat dividerThickness;
@property(nonatomic) CGFloat minimumValue;
@property(nonatomic) CGFloat maximumValue;
@end