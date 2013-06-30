//
//  RoundWindow.m
//  RoundWindow
//
//  Created by Matt Gallagher on 12/12/08.
//  Copyright 2008 Matt Gallagher. All rights reserved.
//
//  Permission is given to use this source code file without charge in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import "RoundWindow.h"
#import "RoundWindowFrameView.h"

@implementation RoundWindow


- (id) initWithContentRect: (NSRect) contentRect  styleMask: (NSUInteger) windowStyle backing: (NSBackingStoreType) bufferingType defer: (BOOL) deferCreation {
    self = [super initWithContentRect: contentRect styleMask: NSBorderlessWindowMask backing: bufferingType defer: deferCreation];
    if (self) {
        [self setOpaque: NO];
        [self setBackgroundColor: [NSColor clearColor]];
        [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(mainWindowChanged:) name: NSWindowDidBecomeMainNotification object: self];
        [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(mainWindowChanged:) name: NSWindowDidResignMainNotification object: self];
    }
    return self;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

- (void) setContentSize: (NSSize) newSize {
    NSSize sizeDelta = newSize;
    NSSize childBoundsSize = [childContentView bounds].size;
    sizeDelta.width -= childBoundsSize.width;
    sizeDelta.height -= childBoundsSize.height;

    RoundWindowFrameView *frameView = [super contentView];
    NSSize newFrameSize = [frameView bounds].size;
    newFrameSize.width += sizeDelta.width;
    newFrameSize.height += sizeDelta.height;

    [super setContentSize: newFrameSize];
}

- (void) mainWindowChanged: (NSNotification *) aNotification {
    [closeButton setNeedsDisplay];
}

- (void) setContentView: (NSView *) aView {
    if ([childContentView isEqualTo: aView]) return;

    NSRect bounds = [self frame];
    bounds.origin = NSZeroPoint;

    RoundWindowFrameView *frameView = [super contentView];
    if (!frameView) {
        frameView = [[RoundWindowFrameView alloc] initWithFrame: bounds];

        [super setContentView: frameView];

        closeButton = [NSWindow standardWindowButton: NSWindowCloseButton forStyleMask: NSTitledWindowMask];
        NSRect closeButtonRect = [closeButton frame];
        [closeButton setFrame: NSMakeRect(WINDOW_FRAME_PADDING - 20, bounds.size.height - (WINDOW_FRAME_PADDING - 20) - closeButtonRect.size.height, closeButtonRect.size.width, closeButtonRect.size.height)];
        [closeButton setAutoresizingMask: NSViewMaxXMargin | NSViewMinYMargin];
        [frameView addSubview: closeButton];
    }

    if (childContentView) {
        [childContentView removeFromSuperview];
    }
    childContentView = aView;
    [childContentView setFrame: [self contentRectForFrameRect: bounds]];
    [childContentView setAutoresizingMask: NSViewWidthSizable | NSViewHeightSizable];
    [frameView addSubview: childContentView];
}

- (NSView *) contentView {
    return childContentView;
}

- (BOOL) canBecomeKeyWindow {
    return YES;
}

- (BOOL) canBecomeMainWindow {
    return YES;
}

- (NSRect) contentRectForFrameRect: (NSRect) windowFrame {
    windowFrame.origin = NSZeroPoint;
    return NSInsetRect(windowFrame, WINDOW_FRAME_PADDING, WINDOW_FRAME_PADDING);
}

+ (NSRect) frameRectForContentRect: (NSRect) windowContentRect styleMask: (NSUInteger) windowStyle {
    return NSInsetRect(windowContentRect, -WINDOW_FRAME_PADDING, -WINDOW_FRAME_PADDING);
}

@end
