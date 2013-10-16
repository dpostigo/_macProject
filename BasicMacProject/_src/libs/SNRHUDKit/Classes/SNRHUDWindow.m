//
//  SNRHUDWindow.m
//  SNRHUDKit
//
//  Created by Indragie Karunaratne on 12-01-22.
//  Copyright (c) 2012 indragie.com. All rights reserved.
//

#import "SNRHUDWindow.h"
#import "NSBezierPath+MCAdditions.h"
#import "SNRHUDConstants.h"
#import "SNRHUDWindowButtonCell.h"
#import "SNRHUDWindowFrameView.h"

@implementation SNRHUDWindow {
    NSView *__customContentView;
}

- (id) initWithContentRect: (NSRect) contentRect styleMask: (NSUInteger) windowStyle backing: (NSBackingStoreType) bufferingType defer: (BOOL) deferCreation {
    if ((self = [super initWithContentRect: contentRect styleMask: NSBorderlessWindowMask backing: bufferingType defer: deferCreation])) {
//        [self setOpaque: NO];
//        [self setBackgroundColor: [NSColor clearColor]];
//        [self setMovableByWindowBackground: YES];
//        //        [self setLevel: NSFloatingWindowLevel];



        [self setBackgroundColor: [NSColor clearColor]];
        [self setMovable: YES];
        [self setMovableByWindowBackground: YES];
        [self setOpaque: NO];
        [self setShowsResizeIndicator: YES];
    }
    return self;
}

- (NSRect) contentRectForFrameRect: (NSRect) windowFrame {
    windowFrame.origin = NSZeroPoint;
    windowFrame.size.height -= SNRWindowTitlebarHeight;
    return windowFrame;
}

+ (NSRect) frameRectForContentRect: (NSRect) windowContentRect styleMask: (NSUInteger) windowStyle {
    windowContentRect.size.height += SNRWindowTitlebarHeight;
    return windowContentRect;
}

- (NSRect) frameRectForContentRect: (NSRect) windowContent {
    windowContent.size.height += SNRWindowTitlebarHeight;
    return windowContent;
}

- (void) setContentView: (NSView *) aView {
    if ([__customContentView isEqualTo: aView]) {
        return;
    }
    NSRect bounds = [self frame];
    bounds.origin = NSZeroPoint;
    SNRHUDWindowFrameView *frameView = [super contentView];
    if (!frameView) {
        frameView = [[SNRHUDWindowFrameView alloc] initWithFrame: bounds];
        NSSize buttonSize = SNRWindowButtonSize;
        NSRect buttonRect = NSMakeRect(SNRWindowButtonEdgeMargin, NSMaxY(frameView.bounds) - (SNRWindowButtonEdgeMargin + buttonSize.height), buttonSize.width, buttonSize.height);
        NSButton *closeButton = [[NSButton alloc] initWithFrame: buttonRect];
        [closeButton setCell: [[SNRHUDWindowButtonCell alloc] init]];
        [closeButton setButtonType: NSMomentaryChangeButton];
        [closeButton setTarget: self];
        [closeButton setAction: @selector(close)];
        [closeButton setAutoresizingMask: NSViewMaxXMargin | NSViewMinYMargin];
        [frameView addSubview: closeButton];
        [super setContentView: frameView];
    }
    if (__customContentView) {
        [__customContentView removeFromSuperview];
    }
    __customContentView = aView;
    [__customContentView setFrame: [self contentRectForFrameRect: bounds]];
    [__customContentView setAutoresizingMask: NSViewWidthSizable | NSViewHeightSizable];
    [frameView addSubview: __customContentView];
}

- (NSView *) contentView {
    return __customContentView;
}

- (void) setTitle: (NSString *) aString {
    [super setTitle: aString];
    [[super contentView] setNeedsDisplay: YES];
}

- (BOOL) canBecomeKeyWindow {
    return YES;
}
@end


