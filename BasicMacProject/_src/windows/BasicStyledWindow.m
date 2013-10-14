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
#import "BasicWindowTitleView.h"

@implementation BasicStyledWindow {

}

- (void) setup {
    [super setup];
    //    self.backgroundColor = [NSColor clearColor];
    //    [self setWindowBackgroundView: barView];
    //    [self setPreservesContentDuringLiveResize: YES];
}

- (BasicWindowDisplayView *) windowBackground {

    BasicWindowDisplayView *ret = [super windowBackground];
    ret.identifier = @"WindowBackground";

    ret.gradient = [[BasicGradient alloc] initWithTopColor: [NSColor colorWithWhite: 0.4] bottomColor: [NSColor colorWithWhite: 0.05]];
    ret.backgroundColor = [NSColor clearColor];
    ret.backgroundColor = [NSColor blueColor];
    ret.cornerRadius = 5;
    ret.borderColor = [NSColor blackColor];
    ret.borderWidth = 0.5;

    ret.windowHeaderView = self.windowHeaderView;
    ret.windowFooterView = self.windowFooterView;

    return ret;
}

- (BasicWindowTitleView *) windowHeaderView {
    BasicWindowTitleView *windowHeader = [[BasicWindowTitleView alloc] init];
    windowHeader.gradient = [[BasicGradient alloc] initWithTopColor: [NSColor colorWithWhite: 0.4] bottomColor: [NSColor colorWithWhite: 0.2] percent: 0.5];
    windowHeader.cornerRadius = 5;
    windowHeader.cornerOptions = CornerUpperLeft | CornerUpperRight;
    [windowHeader setBorderWidth: 0.5 borderColor: [NSColor blackColor]];

    BorderOption *topBorder = [BorderOption topBorderWithGradient: [BasicGradient whiteShineGradient] borderWidth: 0.5];
    [windowHeader addBorder: topBorder];

    return windowHeader;

}


- (BasicWindowTitleView *) windowFooterView {
    BasicWindowTitleView *ret = self.windowHeaderView;
    ret.cornerOptions = CornerLowerLeft | CornerLowerRight;

    //    ret.gradient = [[BasicGradient alloc] initWithTopColor: [NSColor colorWithWhite: 0.4] bottomColor: [NSColor colorWithWhite: 0.2] percent: 0.5];
    return ret;

}


@end