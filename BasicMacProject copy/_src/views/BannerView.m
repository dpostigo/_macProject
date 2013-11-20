//
//  BannerView.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BannerView.h"
#import "NSColor+DPColors.h"
#import "NSTextField+DPUtils.h"
#import "BasicDisplayView+SurrogateUtils.h"
#import "NSView+LayoutConstraints.h"
#import "NSView+Masonry.h"
#import "Masonry.h"
#import "NSColor+CartsUtils.h"
#import "BasicDisplayView+Utils.h"
#import "BasicShadow.h"

@implementation BannerView {

    NSSize contentSize;
}

@synthesize displayBackground;
@synthesize textLabel;
@synthesize detailTextLabel;

- (void) viewInit {
    [super viewInit];

    vPadding = 5;

    insets = NSEdgeInsetsMake(10, 10, 10, 10);

    if (displayBackground == nil) {
        self.displayBackground = [[BasicDisplayView alloc] initWithFrame: self.bounds];
        displayBackground.backgroundColor = [NSColor offwhiteColor];
        displayBackground.borderWidth = 2;
        displayBackground.borderColor = [NSColor darkSlateColor];
        [displayBackground addBorder: [BorderOption bottomBorderWithColor: [NSColor whiteColor] borderWidth: 1.0]];
        displayBackground.innerShadow.shadowColor = [NSColor darkSlateColor];
        displayBackground.innerShadow.shadowBlurRadius = 2;
        displayBackground.innerShadow.shadowOffset = NSMakeSize(0, -2);
        displayBackground.name = @"BannerViewBackground";
    }

    if (textLabel == nil) {
        textLabel = (BasicNewTextField *) [NSTextField clearDisplayTextFieldWithFrame: self.boundsWithMargins type: [BasicNewTextField class]];
        [textLabel.cell setLineBreakMode: NSLineBreakByWordWrapping];
        [textLabel.cell setWraps: YES];
        textLabel.font = [NSFont systemFontOfSize: 14.0];
        textLabel.stringValue = @"Title";
        [self addSubview: textLabel];

    }

    if (detailTextLabel == nil) {
        detailTextLabel = (BasicNewTextField *) [NSTextField clearDisplayTextFieldWithFrame: self.boundsWithMargins type: [BasicNewTextField class]];
        [detailTextLabel.cell setLineBreakMode: NSLineBreakByWordWrapping];
        [detailTextLabel.cell setWraps: YES];
        detailTextLabel.font = [NSFont systemFontOfSize: [NSFont smallSystemFontSize]];
        detailTextLabel.textColor = [NSColor grayColor];
        detailTextLabel.stringValue = @"Subtitle";
        [self addSubview: detailTextLabel];

    }

    [self setNeedsUpdateConstraints: YES];
}

- (void) setDisplayBackground: (BasicDisplayView *) background1 {
    if (displayBackground) {
        if (displayBackground.superview) [displayBackground removeFromSuperview];
    }

    displayBackground = background1;

    if (displayBackground) {
        [self addSubview: displayBackground];
        [displayBackground fillToSuperview];
    }
}


- (void) updateConstraints {
    [super updateConstraints];

    [textLabel mas_updateConstraints: ^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(insets.top); //with is an optional semantic filler
        make.left.equalTo(self.mas_left).with.offset(insets.left);
        make.right.equalTo(self.mas_right).with.offset(-insets.right);
    }];

    [detailTextLabel mas_updateConstraints: ^(MASConstraintMaker *make) {
        make.top.equalTo(textLabel.mas_bottom).with.offset(vPadding); //with is an optional semantic filler
        make.width.equalTo(textLabel.mas_width);
        make.centerX.equalTo(textLabel.mas_centerX);
    }];

    [textLabel sizeToFit];
    [detailTextLabel sizeToFit];

    contentSize = NSMakeSize(0, textLabel.height + detailTextLabel.height + vPadding + insets.top + insets.bottom);

    [self mas_updateConstraints: ^(MASConstraintMaker *make) {
        make.height.equalTo(@(contentSize.height));
    }];
}

- (void) viewDidMoveToSuperview {
    [super viewDidMoveToSuperview];
    [self setNeedsUpdateConstraints: YES];
    [self updateConstraints];
}


@end