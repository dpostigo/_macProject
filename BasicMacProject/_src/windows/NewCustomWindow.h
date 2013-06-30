//
//  NewCustomWindow.h
//  Carts
//
//  Created by Daniela Postigo on 6/24/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NewCustomWindow : NSWindow {
    NSView *childContentView;
    NSButton *closeButton;
    NSButton *minimizeButton;
    NSButton *maximizeButton;

    Class frameClass;
    NSString *frameClassString;


    CGFloat windowFramePadding;
    CGFloat buttonHeight;
    CGFloat buttonPadding;
    BOOL showsCloseButton;
    BOOL showsMinimizeButton;
    BOOL showsMaximizeButton;
    NSMutableArray *windowButtons;

}

@property(nonatomic, strong) NSView *childContentView;
@property(nonatomic, strong) NSButton *closeButton;
@property(nonatomic, strong) Class frameClass;
@property(nonatomic, retain) NSString *frameClassString;
@property(nonatomic) NSMutableArray *windowButtons;
@property(nonatomic) BOOL showsCloseButton;
@property(nonatomic) BOOL showsMinimizeButton;
@property(nonatomic) BOOL showsMaximizeButton;
@property(nonatomic, strong) NSButton *minimizeButton;
@property(nonatomic, strong) NSButton *maximizeButton;
@property(nonatomic) CGFloat buttonPadding;
@property(nonatomic) CGFloat windowFramePadding;
@end