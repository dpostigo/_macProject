//
// Created by Dani Postigo on 12/27/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CartsBackgroundWindow.h"
#import "CALayer+ConstraintUtils.h"
#import "NSColor+CartsUtils.h"
#import "CartsMainViewController.h"
#import "CartsWindowFooterViewController.h"
#import "CartsWindowHeaderViewController.h"

@implementation CartsBackgroundWindow

@synthesize innerBorderLayer;

- (void) awakeFromNib {
    [super awakeFromNib];

    backgroundLayer.backgroundColor = [NSColor darkSlateColor].CGColor;
    backgroundLayer.borderColor = [NSColor blackColor].CGColor;
    backgroundLayer.borderWidth = 0.5;
    backgroundLayer.cornerRadius = 5;
    [backgroundLayer makeSuperlayer];
    [backgroundLayer addSublayer: self.innerBorderLayer];

    //    self.contentContentView = ([[CartsMainViewController alloc] init]).view;

//    self.footerView = self.footer;
//    self.headerView = self.header;
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

    CartsWindowHeaderViewController *headerController = ([[CartsWindowHeaderViewController alloc] init]);
    NSView *header = headerController.view;
    headerController.background = [[NSView alloc] init];
    return header;

}


- (CALayer *) innerBorderLayer {
    if (innerBorderLayer == nil) {
        innerBorderLayer = [CALayer new];
        innerBorderLayer.name = @"innerSlateLayer";
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

@end