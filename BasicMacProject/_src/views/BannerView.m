//
//  BannerView.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "BannerView.h"
#import "NSColor+DPColors.h"
#import "NSTextField+DPUtils.h"

@implementation BannerView {

}

@synthesize background;

@synthesize textLabel;

@synthesize detailTextLabel;

- (void) viewInit {
    [super viewInit];

    topMargin = 10;
    bottomMargin = 10;
    leftMargin = rightMargin = 10;
    vPadding = 5;

    if (background == nil) {
        background = [[BasicDisplayView alloc] initWithFrame: self.bounds];
        background.backgroundColor = [NSColor offwhiteColor];
        background.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
        [self addSubview: background];
    }

    if (textLabel == nil) {
        textLabel = (BasicNewTextField *) [NSTextField clearDisplayTextFieldWithFrame: self.boundsWithMargins type: [BasicNewTextField class]];
        [textLabel.cell setLineBreakMode: NSLineBreakByWordWrapping];
        [textLabel.cell setWraps: YES];
        textLabel.autoresizingMask = NSViewWidthSizable;
        textLabel.autosizesToHeight = YES;
        textLabel.font = [NSFont systemFontOfSize: 14.0];
        [self addSubview: textLabel];
        textLabel.stringValue = @"Title";
    }

    if (detailTextLabel == nil) {
        detailTextLabel = [textLabel copy];
        detailTextLabel.autoresizingMask = NSViewWidthSizable;
        detailTextLabel.font = [NSFont systemFontOfSize: [NSFont smallSystemFontSize]];
        detailTextLabel.textColor = [NSColor grayColor];
        detailTextLabel.top = textLabel.bottom + vPadding;
        [self addSubview: detailTextLabel];
        detailTextLabel.stringValue = @"Subtitle";

    }

    self.height = 100;
}


- (void) layout {
    self.height = detailTextLabel.bottom + bottomMargin;
    [super layout];

}


@end