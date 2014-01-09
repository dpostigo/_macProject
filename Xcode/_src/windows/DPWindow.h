//
// Created by Dani Postigo on 12/26/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPWindow : NSWindow <NSWindowDelegate> {

    IBOutlet NSView *windowView;
    CALayer *backgroundLayer;
    //    NSView *background;

    CGFloat titleBarHeight;
    CGFloat footerBarHeight;

    NSView *manualWindowView;

    NSView *contentContentView;

}

//@property(nonatomic, strong) NSView *background;
@property(nonatomic) CGFloat titleBarHeight;
@property(nonatomic, strong) CALayer *backgroundLayer;
@property(nonatomic, strong) NSView *contentContentView;
@property(nonatomic) CGFloat footerBarHeight;

- (CGFloat) hackInset;
- (NSView *) contentAsView;
- (NSView *) themeFrame;
@end