//
//  BasicDisplayView.m
//  Carts
//
//  Created by Daniela Postigo on 7/4/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicDisplayView.h"
#include "BasicDisplayView+SurrogateUtils.h"

@implementation BasicDisplayView

@synthesize pathOptions;

- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {[self pathOptionsInit];}
    return self;
}

- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {[self pathOptionsInit];}
    return self;
}


- (void) awakeFromNib {
    [super awakeFromNib];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}


#pragma mark NSView overrides

- (BOOL) preservesContentDuringLiveResize {
    return YES;
}

- (BOOL) isOpaque {
    return YES;
}

- (void) viewWillStartLiveResize {
    [super viewWillStartLiveResize];
//    NSLog(@"%s", __PRETTY_FUNCTION__);
}


- (void) viewDidEndLiveResize {
    [super viewDidEndLiveResize];
//    [self setNeedsDisplay: YES];
//    NSLog(@"%s", __PRETTY_FUNCTION__);
}


#pragma mark BasicDisplayView

- (void) pathOptionsInit {
    pathOptions = [[PathOptions alloc] init];
    pathOptions.cornerRadius = 0.0;
    pathOptions.borderWidth = 0.0;
    pathOptions.borderColor = [NSColor lightGrayColor];
    pathOptions.cornerType = CornerNone;
    pathOptions.backgroundColor = [NSColor colorWithDeviceWhite: 0.9 alpha: 1.0];
}

- (void) drawRect: (NSRect) dirtyRect {
    [[NSColor clearColor] set];
    NSRectFill(self.bounds);
    [pathOptions drawWithRect: self.bounds];

    if ([self.backgroundColor isEqualTo: [NSColor redColor]]) {
        //        NSLog(@"%s", __PRETTY_FUNCTION__);
        NSLog(@"self.bounds = %@", NSStringFromRect(self.bounds));
    }
}



#pragma mark View overrides

- (void) viewDidMoveToWindow {
    [super viewDidMoveToWindow];

    if (customWindow) {
        self.cornerRadius = customWindow.windowFrame.cornerRadius - 1;
    }
}


#pragma mark Helpers


- (id) copyWithZone: (NSZone *) zone {
    BasicDisplayView *copy = [[BasicDisplayView allocWithZone: zone] init];
    copy.pathOptions = self.pathOptions;
    copy.borderOptions = self.borderOptions;
    return copy;
}


@end