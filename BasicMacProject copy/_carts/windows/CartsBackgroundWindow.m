//
// Created by Dani Postigo on 12/27/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CartsBackgroundWindow.h"
#import "LayerBackedView.h"
#import "CALayer+ConstraintUtils.h"
#import "CALayer+FrameUtils.h"
#import "NSBezierPath+Utils.h"
#import "NSWindow+DPUtils.h"
#import "NSColor+CartsUtils.h"
#import "CartsMainViewController.h"
#import "CartsWindowFooterViewController.h"
#import "CartsWindowHeaderViewControllerOld.h"

@implementation CartsBackgroundWindow {

    LayerBackedView *cartsBackground;
}

@synthesize innerBorderLayer;

- (CALayer *) innerBorderLayer {
    if (innerBorderLayer == nil) {
        innerBorderLayer = [CALayer new];
        innerBorderLayer.name = @"innerBorderLayer";
        innerBorderLayer.borderColor = [NSColor colorWithWhite: 1.0 alpha: 0.5].CGColor;
        innerBorderLayer.borderWidth = 0.5;
        innerBorderLayer.cornerRadius = backgroundLayer.cornerRadius - 0.5;
        innerBorderLayer.delegate = self;

        CGFloat inset = backgroundLayer.borderWidth * 2;
        [innerBorderLayer superConstrain: kCAConstraintMidX offset: 0];
        [innerBorderLayer superConstrain: kCAConstraintMidY offset: 0];
        [innerBorderLayer superConstrain: kCAConstraintWidth offset: -2];
        [innerBorderLayer superConstrain: kCAConstraintHeight offset: -2];
    }
    return innerBorderLayer;
}

- (void) awakeFromNib {
    [super awakeFromNib];

    backgroundLayer.backgroundColor = [NSColor darkSlateColor].CGColor;
    backgroundLayer.borderColor = [NSColor blackColor].CGColor;
    backgroundLayer.borderWidth = 0.5;
    backgroundLayer.cornerRadius = 5;

    [backgroundLayer makeSuperlayer];
    [backgroundLayer addSublayer: self.innerBorderLayer];

    self.contentContentView = ([[CartsMainViewController alloc] init]).view;

    self.footerView = self.footer;
    self.headerView = self.header;

    self.titleBarHeight = 35;
}


- (NSView *) footer {

    NSView *ret = [[NSView alloc] init];
    ret.wantsLayer = YES;
    ret.layer.backgroundColor = [NSColor blueColor].CGColor;

    CartsWindowFooterViewController *footerController = [[CartsWindowFooterViewController alloc] init];
    ret = footerController.view;

    return ret;
}

- (NSView *) header {

    CartsWindowHeaderViewControllerOld *headerController = ([[CartsWindowHeaderViewControllerOld alloc] init]);
    NSView *header = headerController.view;
    headerController.background = [[NSView alloc] init];
    return header;

}

- (void) oldStuff {
    cartsBackground = [[LayerBackedView alloc] init];
    cartsBackground.alphaValue = 0.9;
    cartsBackground.shadow.shadowColor = [[NSColor blackColor] colorWithAlphaComponent: 0.8];
    cartsBackground.shadow.shadowOffset = CGSizeMake(0, 1);
    cartsBackground.shadow.shadowBlurRadius = 2.0;
    cartsBackground.layer.cornerRadius = 5;
    cartsBackground.layer.backgroundColor = [NSColor clearColor].CGColor;

    //    self.background = cartsBackground;
    self.titleBarHeight = 40;

}


@end