//
// Created by Dani Postigo on 12/26/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "DPWindow.h"
#import "CALayer+FrameUtils.h"
#import "CALayer+ConstraintUtils.h"
#import "CALayer+InfoUtils.h"
#import "NSColor+DPColors.h"
#import "NSView+ConstraintGetters.h"
#import "NSView+SuperConstraints.h"

@implementation DPWindow

@synthesize titleBarHeight;

@synthesize backgroundLayer;
@synthesize contentContentView;
@synthesize footerBarHeight;

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

    [self setBackgroundColor: [NSColor clearColor]];
    [self setOpaque: NO];
    [self setHasShadow: NO];

    //    NSView *contentView = self.contentView;
    windowView.wantsLayer = YES;

    CALayer *themeLayer = self.themeFrame.layer;
    themeLayer.borderWidth = 0;
    [themeLayer makeSuperlayer];
    [themeLayer insertSublayer: self.backgroundLayer atIndex: 0];
    [backgroundLayer superConstrain: kCAConstraintMinX offset: 2];
    [backgroundLayer superConstrain: kCAConstraintMaxX offset: -2];
    [backgroundLayer superConstrain: kCAConstraintHeight offset: -2];
    [backgroundLayer superConstrain: kCAConstraintMidY offset: 0];
    themeLayer.name = @"themeFrame.layer";
    themeLayer.backgroundColor = [NSColor clearColor].CGColor;
    themeLayer.delegate = self;

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


#pragma mark Setters


- (void) setTitleBarHeight: (CGFloat) titleBarHeight1 {
    titleBarHeight = titleBarHeight1;
    [self updateConstraintsIfNeeded];
}

- (void) setFooterBarHeight: (CGFloat) footerBarHeight1 {
    footerBarHeight = footerBarHeight1;
    [self updateConstraintsIfNeeded];
}


- (void) setContentContentView: (NSView *) contentContentView1 {
    if (contentContentView && contentContentView.superview) {
        [contentContentView removeFromSuperview];
    }
    contentContentView = contentContentView1;

    [windowView addSubview: contentContentView];

    contentContentView.translatesAutoresizingMaskIntoConstraints = NO;
    CGFloat inset = 2.5;

    [contentContentView superConstrain: NSLayoutAttributeLeft constant: inset];
    [contentContentView superConstrain: NSLayoutAttributeRight constant: -inset];
    [contentContentView superConstrain: NSLayoutAttributeTop constant: inset];
    [contentContentView superConstrain: NSLayoutAttributeBottom constant: -inset];

}

#pragma mark Constraints

//
//
//- (void) updateConstraintsIfNeeded {
//    [super updateConstraintsIfNeeded];
//
////    if (contentContentView) {
////        NSLayoutConstraint *topConstraint = [windowView topConstraintForItem: contentContentView];
////        if (topConstraint == nil) NSLog(@"did not find");
////
////        topConstraint.constant = self.titleBarHeight - self.existingTitleBarHeight;
////
////        NSLayoutConstraint *bottomConstraint = [windowView bottomConstraintForItem: contentContentView];
////        bottomConstraint.constant = -self.footerBarHeight;
////    }
////
////    NSArray *buttons = self.windowButtonLayers;
////    for (CALayer *layer in buttons) {
////        //        NSLog(@"layer.frame = %@", NSStringFromRect(layer.frame));
////        CGFloat position = (self.titleBarHeight - layer.height) / 2;
////        layer.top = self.frame.size.height - self.titleBarHeight + (layer.height / 2) + 2;
////    }
//
//}








#pragma mark Background


//
//
//- (void) setContentView: (NSView *) aView {
//
//    if (aView.subviews.count && manualWindowView == nil) {
//        manualWindowView = aView;
//    }
//    [super setContentView: aView];
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



#pragma mark Layer getters

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

#pragma mark Utility Getters

- (CGFloat) hackInset {
    return 2.5;
}


- (NSView *) contentAsView {
    return ((NSView *) self.contentView);
}

- (NSView *) themeFrame {
    return self.contentAsView.superview;
}


@end