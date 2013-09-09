//
//  BasicNewCustomWindow.m
//  Carts
//
//  Created by Daniela Postigo on 9/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicNewCustomWindow.h"

@implementation BasicNewCustomWindow {

}

@synthesize internalContentView;

@synthesize topMargin;

@synthesize bottomMargin;

@synthesize leftMargin;

@synthesize rightMargin;

- (void) awakeFromNib {
    [super awakeFromNib];

}

- (id) initWithContentRect: (NSRect) aContentRect styleMask: (NSUInteger) aStyle backing: (NSBackingStoreType) bufferingType defer: (BOOL) flag {
    self = [super initWithContentRect: contentRect styleMask: NSResizableWindowMask backing: bufferingType defer: flag];
    if (self) {
        [self setup];

    }

    return self;
}


- (void) setup {
    [self setOpaque: NO];
    self.backgroundColor = [NSColor clearColor];
    [self setMovable: YES];
    [self setMovableByWindowBackground: YES];

    self.topMargin = 10;
    self.bottomMargin = 10;

}

#pragma mark Getters

- (id) windowBackgroundView {
    return [super contentView];
}

- (void) setWindowBackgroundView: (NSView *) aView {
    aView.bounds = self.bounds;
    [super setContentView: aView];
    [super.contentView addSubview: internalContentView];
}

- (void) setContentRect: (NSRect) contentRect1 {
    contentRect = contentRect1;
    internalContentView.frame = contentRect1;
}



#pragma mark Overrides

- (id) contentView {
    return self.internalContentView;
}

- (void) setContentView: (NSView *) aView {
    if (internalContentView == nil) {
        [super setContentView: aView];
        internalContentView = [[BasicView alloc] initWithFrame: self.contentRect];
        internalContentView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
        [super.contentView addSubview: internalContentView];
    } else {
        [internalContentView removeAllSubviews];
        [internalContentView embedView: aView];
    }

}


#pragma mark Helpers

- (NSRect) bounds {
    return NSMakeRect(0, 0, self.frame.size.width, self.frame.size.height);
}

- (void) setTopMargin: (CGFloat) topMargin1 {
    topMargin = topMargin1;

    NSRect ret = NSMakeRect(leftMargin, bottomMargin, self.bounds.size.width - leftMargin - rightMargin, self.bounds.size.height - topMargin - bottomMargin);
    [self setContentRect: ret];
}

- (void) setBottomMargin: (CGFloat) bottomMargin1 {
    bottomMargin = bottomMargin1;
    NSRect ret = NSMakeRect(leftMargin, bottomMargin, self.bounds.size.width - leftMargin - rightMargin, self.bounds.size.height - topMargin - bottomMargin);
    [self setContentRect: ret];
}


- (void) setLeftMargin: (CGFloat) leftMargin1 {
    leftMargin = leftMargin1;

    NSRect ret = NSMakeRect(leftMargin, bottomMargin, self.bounds.size.width - leftMargin - rightMargin, self.bounds.size.height - topMargin - bottomMargin);
    [self setContentRect: ret];
}

- (void) setRightMargin: (CGFloat) rightMargin1 {
    rightMargin = rightMargin1;

    NSRect ret = NSMakeRect(leftMargin, bottomMargin, self.bounds.size.width - leftMargin - rightMargin, self.bounds.size.height - topMargin - bottomMargin);
    [self setContentRect: ret];
}


@end