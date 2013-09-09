//
//  BasicStyledWindow.m
//  Carts
//
//  Created by Daniela Postigo on 9/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicStyledWindow.h"
#import "BasicInnerShadowView.h"
#import "NSColor+DPColors.h"
#import "BasicWindowDisplayView.h"

@implementation BasicStyledWindow {

}

- (void) setup {
    [super setup];

    self.topMargin = 30;
    self.backgroundColor = [NSColor clearColor];

    BasicWindowDisplayView *barView = [[BasicWindowDisplayView alloc] init];
    barView.identifier = @"WindowBackground";
    barView.gradient = [[NSGradient alloc] initWithColors: [NSArray arrayWithObjects: [NSColor colorWithDeviceWhite: 0.2 alpha: 1.0], [NSColor blackColor], nil]];
    [self setWindowBackgroundView: barView];

    barView.cornerRadius = 5;
    barView.borderWidth = 0;
//    barView.pathOptions.backgroundColor = [NSColor colorWithDeviceWhite: 0.1 alpha: 1.0];

    [self setPreservesContentDuringLiveResize: YES];
}


@end