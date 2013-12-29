//
// Created by Dani Postigo on 12/26/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LayerHostingView;

@interface BackgroundWindow : NSWindow <NSWindowDelegate> {

    CALayer *backgroundLayer;
    NSView *background;
    NSView *titleBarView;
    NSView *titleLabelView;

    CGFloat titleBarHeight;
    CGFloat footerBarHeight;

    IBOutlet NSView *windowView;
    NSView *manualWindowView;
    NSButton *closeButton;
    NSButton *minimizeButton;
    NSButton *maximizeButton;

    NSView *contentContentView;
    NSView *headerView;
    NSView *footerView;
}

@property(nonatomic, strong) NSView *background;
@property(nonatomic, strong) NSView *titleBarView;
@property(nonatomic, strong) NSView *titleLabelView;
@property(nonatomic) CGFloat titleBarHeight;
@property(nonatomic, strong) NSButton *closeButton;
@property(nonatomic, strong) NSButton *minimizeButton;
@property(nonatomic, strong) NSButton *maximizeButton;
@property(nonatomic, strong) CALayer *backgroundLayer;
@property(nonatomic, strong) NSView *contentContentView;
@property(nonatomic) CGFloat footerBarHeight;
@property(nonatomic, strong) NSView *headerView;
@property(nonatomic, strong) NSView *footerView;
- (CALayer *) themeFrameLayer;
@end