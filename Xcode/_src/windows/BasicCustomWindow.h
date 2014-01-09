//
//  BasicCustomWindow.h
//  Carts
//
//  Created by Daniela Postigo on 6/24/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicCustomWindowFrame.h"

@interface BasicCustomWindow : NSWindow {
    NSView *titleBarView;

    NSMutableArray *windowButtonsLeft;
    NSMutableArray *windowButtonsRight;

    BOOL showsCloseButton;
    BOOL showsMinimizeButton;
    BOOL showsMaximizeButton;

    Class frameClass;
    NSString *frameClassString;
    NSView *childContentView;


    CGFloat buttonHeight;
    CGFloat buttonSpacing;
    CGFloat windowFramePadding;

    BasicCustomWindowFrame *windowFrame;

}

@property(nonatomic) BOOL showsCloseButton;
@property(nonatomic) BOOL showsMinimizeButton;
@property(nonatomic) BOOL showsMaximizeButton;

@property(nonatomic, strong) Class frameClass;
@property(nonatomic, strong) NSView *childContentView;
@property(nonatomic, retain) NSString *frameClassString;
@property(nonatomic) NSMutableArray *windowButtonsLeft;
@property(nonatomic) CGFloat buttonSpacing;
@property(nonatomic) CGFloat buttonHeight;
@property(nonatomic) CGFloat windowFramePadding;


@property(nonatomic, strong) BasicCustomWindowFrame *windowFrame;
@property(nonatomic, strong) NSMutableArray *windowButtonsRight;
@property(nonatomic, strong) NSView *titleBarView;
- (NSRect) bounds;
@end