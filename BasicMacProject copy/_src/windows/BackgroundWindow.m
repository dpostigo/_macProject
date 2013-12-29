//
// Created by Dani Postigo on 12/26/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BackgroundWindow.h"
#import "NSWindow+DPUtils.h"
#import "CALayer+FrameUtils.h"
#import "CALayer+ConstraintUtils.h"
#import "NSColor+DPColors.h"
#import "CALayer+InfoUtils.h"
#import "NSView+ConstraintGetters.h"
#import "NSView+SuperConstraints.h"

@implementation BackgroundWindow {
    IBOutlet NSView *testView;

}

@synthesize titleBarHeight;

@synthesize closeButton;
@synthesize minimizeButton;
@synthesize maximizeButton;
@synthesize backgroundLayer;
@synthesize contentContentView;
@synthesize footerBarHeight;
@synthesize headerView;
@synthesize footerView;
#define DEBUG_COLORS 1

- (id) initWithContentRect: (NSRect) contentRect styleMask: (NSUInteger) aStyle backing: (NSBackingStoreType) bufferingType defer: (BOOL) flag {
    self = [super initWithContentRect: contentRect styleMask: aStyle backing: bufferingType defer: flag];
    if (self) {
    }

    return self;
}

- (void) awakeFromNib {
    [super awakeFromNib];

    titleBarHeight = 30;
    footerBarHeight = 30;
    self.backgroundColor = [NSColor blackColor];
    self.backgroundColor = [NSColor clearColor];
    [self setOpaque: NO];
    self.hasShadow = NO;

    [self addWindowViewConstraints];
    [self adjustThemeFrameLayer];

    CALayer *themeLayer = self.themeFrame.layer;
    themeLayer.name = @"themeFrame.layer";
    themeLayer.backgroundColor = [NSColor clearColor].CGColor;
    themeLayer.delegate = self;

}


- (void) addWindowViewConstraints {

    NSView *contentView = self.contentView;
    windowView.wantsLayer = YES;
    //    windowView.layer.backgroundColor = [NSColor offwhiteColor].CGColor;


}


- (void) adjustThemeFrameLayer {
    CALayer *superlayer = self.themeFrame.layer;
    superlayer.borderWidth = 0;

    [superlayer makeSuperlayer];
    [superlayer insertSublayer: self.backgroundLayer atIndex: 0];
    [backgroundLayer superConstrain: kCAConstraintMinX offset: 2];
    [backgroundLayer superConstrain: kCAConstraintMaxX offset: -2];
    [backgroundLayer superConstrain: kCAConstraintHeight offset: -2];
    [backgroundLayer superConstrain: kCAConstraintMidY offset: 0];
}


- (CALayer *) backgroundLayer {
    if (backgroundLayer == nil) {
        backgroundLayer = [CALayer new];
        backgroundLayer.name = @"backgroundLayer";
        [backgroundLayer setGeometryFlipped: YES];
        backgroundLayer.width = 30;
        backgroundLayer.height = 30;
        backgroundLayer.backgroundColor = [NSColor offwhiteColor].CGColor;
        backgroundLayer.backgroundColor = [NSColor offwhiteColor].CGColor;
        backgroundLayer.borderColor = [NSColor whiteColor].CGColor;
        backgroundLayer.borderWidth = 1;
        backgroundLayer.cornerRadius = 3;
        backgroundLayer.delegate = self;
    }
    return backgroundLayer;
}


- (CALayer *) themeFrameLayer {
    CALayer *ret = nil;
    NSView *themeFrame = self.contentAsView.superview;
    CALayer *superlayer = themeFrame.layer;
    NSArray *sublayers = [NSArray arrayWithArray: superlayer.sublayers];

    for (CALayer *layer in sublayers) {
        if (layer.width != 14) {
            ret = layer;
            break;
        }
    }
    return ret;

}

#pragma mark Layout




- (void) layoutIfNeeded {
    [super layoutIfNeeded];

    //    if (backgroundLayer) {
    //        //        backgroundLayer.frame = self.bounds;
    //        //        [backgroundLayer setNeedsDisplay];
    //    }
    //
    //    //    self.background.layer.masksToBounds = YES;
    //    //    [self.background.layer addSublayer: self.titleBarView.layer];
    //    //    [self.background.layer setNeedsDisplay];
    //    [self.background addSubview: self.titleBarView];
    //    //    [self.titleBarView addSubview: self.titleLabelView];
    //
    //    self.background.frame = self.bounds;
    //    self.background.frame = NSInsetRect(self.bounds, 2, 2);
    //    [self.background setNeedsDisplay: YES];
    //
    //    self.titleBarView.width = self.background.width;
    //    self.titleBarView.height = self.titleBarHeight;
    //    [self.titleBarView setNeedsDisplay: YES];
    //
    //    self.titleLabelView.width = self.titleBarView.width;
    //    self.titleLabelView.height = self.titleBarView.height;
    //    [self.titleLabelView setNeedsDisplay: YES];

}


- (void) setContentContentView: (NSView *) contentContentView1 {
    contentContentView = contentContentView1;
    [windowView addSubview: contentContentView];

    contentContentView.translatesAutoresizingMaskIntoConstraints = NO;
    CGFloat inset = 2.5;

    [contentContentView superConstrain: NSLayoutAttributeLeft constant: inset];
    [contentContentView superConstrain: NSLayoutAttributeRight constant: -inset];
    [contentContentView superConstrain: NSLayoutAttributeTop constant: inset];
    [contentContentView superConstrain: NSLayoutAttributeBottom constant: -inset];
    //    [windowView addConstraint: [NSLayoutConstraint constraintWithItem: contentContentView attribute: NSLayoutAttributeLeft relatedBy: NSLayoutRelationEqual toItem: windowView attribute: NSLayoutAttributeLeft multiplier: 1.0 constant: inset]];
    //    [windowView addConstraint: [NSLayoutConstraint constraintWithItem: contentContentView attribute: NSLayoutAttributeRight relatedBy: NSLayoutRelationEqual toItem: windowView attribute: NSLayoutAttributeRight multiplier: 1.0 constant: -inset]];
    //    [windowView addConstraint: [NSLayoutConstraint constraintWithItem: contentContentView attribute: NSLayoutAttributeTop relatedBy: NSLayoutRelationEqual toItem: windowView attribute: NSLayoutAttributeTop multiplier: 1.0 constant: inset]];
    //    [windowView addConstraint: [NSLayoutConstraint constraintWithItem: contentContentView attribute: NSLayoutAttributeBottom relatedBy: NSLayoutRelationEqual toItem: windowView attribute: NSLayoutAttributeBottom multiplier: 1.0 constant: -inset]];

}


- (void) setHeaderView: (NSView *) headerView1 {
    if (headerView && headerView.superview) {
        [headerView removeFromSuperview];
    }

    headerView = headerView1;

    if (headerView) {
        [self.themeFrame addSubview: headerView];

        headerView.translatesAutoresizingMaskIntoConstraints = NO;

        [headerView superConstrain: NSLayoutAttributeLeft constant: self.hackInset];
        [headerView superConstrain: NSLayoutAttributeRight constant: -self.hackInset];
        [headerView selfConstrain: NSLayoutAttributeHeight constant: self.titleBarHeight];
        //        [headerView superConstrain: NSLayoutAttributeTop constant: self.hackInset];
        [headerView superConstrain: NSLayoutAttributeTop constant: self.hackInset];

    }
}

- (void) setFooterView: (NSView *) footerView1 {
    if (footerView && footerView.superview) {
        [footerView removeFromSuperview];
    }

    footerView = footerView1;

    if (footerView) {
        [windowView addSubview: footerView];
        footerView.translatesAutoresizingMaskIntoConstraints = NO;

        CGFloat inset = 0;
        [footerView superConstrain: NSLayoutAttributeLeft constant: self.hackInset];
        [footerView superConstrain: NSLayoutAttributeRight constant: -self.hackInset];
        [footerView selfConstrain: NSLayoutAttributeHeight constant: self.footerBarHeight];
        [footerView superConstrain: NSLayoutAttributeBottom constant: -inset];
    }

}

- (void) setTitleBarHeight: (CGFloat) titleBarHeight1 {
    titleBarHeight = titleBarHeight1;
    [self updateConstraintsIfNeeded];
}


- (CGFloat) hackInset {
    return 2.5;
}


- (void) updateConstraintsIfNeeded {
    [super updateConstraintsIfNeeded];

    if (contentContentView) {
        NSLayoutConstraint *topConstraint = [windowView topConstraintForItem: contentContentView];
        if (topConstraint == nil) NSLog(@"did not find");

        topConstraint.constant = self.titleBarHeight - self.existingTitleBarHeight;

        NSLayoutConstraint *bottomConstraint = [windowView bottomConstraintForItem: contentContentView];
        bottomConstraint.constant = -self.footerBarHeight;
    }

    if (footerView) {
        NSLayoutConstraint *bottomConstraint = [windowView bottomConstraintForItem: footerView];
        bottomConstraint.constant = -self.hackInset;
    }

    NSArray *buttons = self.windowButtonLayers;
    for (CALayer *layer in buttons) {
        //        NSLog(@"layer.frame = %@", NSStringFromRect(layer.frame));
        CGFloat position = (self.titleBarHeight - layer.height) / 2;
        layer.top = self.frame.size.height - self.titleBarHeight + (layer.height / 2) + 2;
    }

}

- (NSArray *) windowButtonLayers {

    NSMutableArray *ret = [[NSMutableArray alloc] init];
    NSArray *sublayers = self.themeFrame.layer.sublayers;
    for (CALayer *layer in sublayers) {

        if (layer.width == 14 && layer.height == 16) {
            [ret addObject: layer];
        }
    }
    return ret;
}



#pragma mark Getters



#pragma mark TitleBar

- (NSView *) titleBarView {
    if (titleBarView == nil) {
        titleBarView = [[NSView alloc] init];
        titleBarView.wantsLayer = YES;

        closeButton = [self standardWindowButton: NSWindowCloseButton];
        minimizeButton = [self standardWindowButton: NSWindowCloseButton];
        maximizeButton = [self standardWindowButton: NSWindowCloseButton];

    }
    return titleBarView;
}


- (void) setTitleBarView: (NSView *) headerView1 {
    if (titleBarView && titleBarView.superview) {
        [titleBarView removeFromSuperview];
    }
    titleBarView = headerView1;
    if (titleBarView) {
        //        [self.background addSubview: titleBarView];
    }
}



#pragma mark TitleView


- (NSView *) titleLabelView {
    if (titleLabelView == nil) {
        titleLabelView = [[NSView alloc] init];

    }
    return titleLabelView;
}

- (void) setTitleLabelView: (NSView *) titleView1 {
    if (titleLabelView && titleLabelView.superview) {
        [titleLabelView removeFromSuperview];
    }
    titleLabelView = titleView1;
    if (titleLabelView) {
        //        [self.titleBarView addSubview: titleLabelView];
    }
}

#pragma mark Background

- (void) setBackground: (NSView *) background1 {
    background = background1;
    if (background) {
        NSView *content = nil;

        [self setContentView: background];
        [background addSubview: windowView];

    }
}


- (NSView *) background {
    if (background == nil) {
        background = [[NSView alloc] init];
    }
    return background;
}


- (void) setContentView: (NSView *) aView {

    if (aView.subviews.count && manualWindowView == nil) {
        manualWindowView = aView;
    }
    [super setContentView: aView];
}


//- (NSSize) windowWillResize: (NSWindow *) sender toSize: (NSSize) frameSize {
////    NSSize result;
////    //    NSLog(@"%s", __PRETTY_FUNCTION__);
////    //    backgroundLayer.size = result;
////    return result;
////}
//
//
//- (void) windowDidResize: (NSNotification *) notification {
//
//}
//
//- (void) windowWillStartLiveResize: (NSNotification *) notification {
//
//}
//
//- (void) windowDidEndLiveResize: (NSNotification *) notification {
//
//}


- (CGFloat) existingTitleBarHeight {

    NSRect frame = self.frame;
    NSRect contentRect = [NSWindow contentRectForFrameRect: frame styleMask: self.styleMask];

    return frame.size.height - contentRect.size.height;
}

+ (NSRect) frameRectForContentRect: (NSRect) cRect styleMask: (NSUInteger) aStyle {
    NSRect ret = [super frameRectForContentRect: cRect styleMask: aStyle];
//    NSLog(@"%s", __PRETTY_FUNCTION__);
    //    //    ret = NSInsetRect(ret, -10, 0);
    //    NSLog(@"%@, ret = %@", NSStringFromRect(cRect), NSStringFromRect(ret));
    return ret;
}

+ (NSRect) contentRectForFrameRect: (NSRect) fRect styleMask: (NSUInteger) aStyle {
    NSRect ret = [super contentRectForFrameRect: fRect styleMask: aStyle];
//    NSLog(@"%s", __PRETTY_FUNCTION__);
    //    NSLog(@"%@, ret = %@", NSStringFromRect(fRect), NSStringFromRect(ret));
    return ret;
}



#pragma mark CALayerDelegate

- (void) displayLayer: (CALayer *) layer {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void) drawLayer: (CALayer *) layer inContext: (CGContextRef) ctx {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void) layoutSublayersOfLayer: (CALayer *) layer {
    if (layer == self.themeFrame.layer) {
        //        NSLog(@"%s", __PRETTY_FUNCTION__);
        //        NSLog(@"layer.name = %@", layer.name);
    } else {
        //        NSLog(@"layer.name = %@", layer.name);
    }
}

- (id <CAAction>) actionForLayer: (CALayer *) layer forKey: (NSString *) event {
    return (id) [NSNull null]; // disable all implicit animations
    //    else return nil; // allow implicit animations
    //
    //    // you can also test specific key names; for example, to disable bounds animation:
    //    // if ([event isEqualToString:@"bounds"]) return (id)[NSNull null];
}

- (void) logtests {

    NSView *themeFrame = self.contentAsView.superview;
    CALayer *superlayer = themeFrame.layer;
    NSArray *sublayers = [NSArray arrayWithArray: superlayer.sublayers];

    for (CALayer *sublayer in superlayer.sublayers) {
        NSLog(@"sublayer.infoString = %@", sublayer.infoString);
    }

    for (CALayer *sublayer in sublayers) {
        //        [layer addSublayer: sublayer];
    }

    //    NSLog(@"superlayer.infoString = %@", superlayer.infoString);
    //    superlayer.backgroundColor = [NSColor greenColor].CGColor;

}


@end