//
//  CustomWindowOldOct18.m
//  Carts
//
//  Created by Daniela Postigo on 9/23/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CustomWindowOldOct18.h"

@implementation CustomWindowOldOct18 {

}

- (id) initWithContentRect: (NSRect) contentRect styleMask: (NSUInteger) aStyle backing: (NSBackingStoreType) bufferingType defer: (BOOL) flag {
    self = [super initWithContentRect: contentRect styleMask: aStyle backing: bufferingType defer: flag];
    if (self) {
        [self setup];

    }

    return self;
}

- (void) setup {
    [self setBackgroundColor: [NSColor clearColor]];
    [self setMovable: YES];
    [self setMovableByWindowBackground: YES];
    [self setOpaque: NO];
    [self setShowsResizeIndicator: YES];
    //    [self setLevel: NSFloatingWindowLevel];
    //    [self setAcceptsMouseMovedEvents: YES];

    self.topMargin = 30;
    self.bottomMargin = 20;
}




#pragma mark Getters / Setters

- (CGFloat) topMargin {
    return self.windowBackground.topMargin;
}

- (void) setTopMargin: (CGFloat) topMargin {
    self.windowBackground.topMargin = topMargin;
}

- (CGFloat) bottomMargin {
    return self.windowBackground.bottomMargin;
}

- (void) setBottomMargin: (CGFloat) bottomMargin {
    self.windowBackground.bottomMargin = bottomMargin;

}


#pragma mark windowBackground

- (BasicWindowDisplayView *) windowBackground {
    if (windowBackground == nil) {
        windowBackground = [[BasicWindowDisplayView alloc] initWithFrame: self.bounds];
        windowBackground.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    }
    return windowBackground;
}


- (void) setWindowBackground: (BasicWindowDisplayView *) windowBackground1 {
    if (windowBackground != nil) {
        NSArray *subviews = windowBackground.subviews;
        for (NSView *view in subviews) [windowBackground1 addSubview: view];
        windowBackground = windowBackground1;
        [super setContentView: windowBackground];

    } else {

    }
}


#pragma mark NSWindow overrides

- (id) contentView {
    return newContentView;
}

- (void) setContentView: (NSView *) aView {
    if (super.contentView == nil) {
        [self.windowBackground embedView: aView];
        [super setContentView: windowBackground];
    } else {
        newContentView = aView;
        [self.windowBackground removeAllSubviews];
        [self.windowBackground embedView: aView];
    }
}


#pragma mark Helpers

- (NSRect) bounds {
    NSRect ret = self.frame;
    ret.origin = NSMakePoint(0, 0);
    return ret;
}


#pragma mark SNRHUD

@end