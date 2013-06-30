//
//  NewCustomWindow.m
//  Carts
//
//  Created by Daniela Postigo on 6/24/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NewCustomWindow.h"
#import "BasicCustomWindowFrame.h"


@implementation NewCustomWindow {

}


@synthesize childContentView;

@synthesize closeButton;
@synthesize minimizeButton;
@synthesize maximizeButton;


@synthesize frameClassString;

@synthesize buttonPadding;
@synthesize windowButtons;
@synthesize showsCloseButton;
@synthesize showsMinimizeButton;
@synthesize showsMaximizeButton;


@synthesize windowFramePadding;

- (id) initWithContentRect: (NSRect) contentRect styleMask: (NSUInteger) aStyle backing: (NSBackingStoreType) bufferingType defer: (BOOL) flag {
    self = [super initWithContentRect: contentRect styleMask: NSBorderlessWindowMask backing: bufferingType defer: flag];
    if (self) {
        [self setOpaque: NO];
        self.backgroundColor = [NSColor clearColor];
        self.frameClass = [BasicCustomWindowFrame class];
        self.windowButtons = [[NSMutableArray alloc] init];
        self.showsCloseButton = YES;
        self.showsMaximizeButton = YES;
        self.showsMinimizeButton = YES;

        windowFramePadding = [[self class] windowFramePadding];
        buttonPadding = 5;
        buttonHeight = 25;

        [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(mainWindowChanged:) name: NSWindowDidBecomeMainNotification object: self];
        [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(mainWindowChanged:) name: NSWindowDidResignMainNotification object: self];
    }
    return self;
}



#pragma mark Getters / Setters

- (void) setFrameClass: (Class) frameClass1 {
    self.frameClassString = NSStringFromClass(frameClass1);
}

- (Class) frameClass {
    return NSClassFromString(frameClassString);
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


- (void) setContentSize: (NSSize) newSize {
    NSSize sizeDelta = newSize;
    NSSize childBoundsSize = [childContentView bounds].size;
    sizeDelta.width -= childBoundsSize.width;
    sizeDelta.height -= childBoundsSize.height;

    BasicCustomWindowFrame *frameView = [super contentView];
    NSSize newFrameSize = frameView.bounds.size;
    newFrameSize.width += sizeDelta.width;
    newFrameSize.height += sizeDelta.height;
    [super setContentSize: newFrameSize];
}


- (NSRect) contentRectForFrameRect: (NSRect) windowFrame {
    windowFrame.origin = NSZeroPoint;
    windowFrame = NSInsetRect(windowFrame, windowFramePadding, windowFramePadding);
    windowFrame.size.height -= buttonHeight;
    return windowFrame;
}

- (void) setContentView: (NSView *) aView {
    if ([childContentView isEqualTo: aView]) return;

    for (NSButton *button in windowButtons) [button removeFromSuperview];
    [windowButtons removeAllObjects];

    NSRect bounds = [self frame];
    bounds.origin = NSZeroPoint;

    BasicCustomWindowFrame *frameView = [super contentView];
    if (!frameView) {
        frameView = [[self.frameClass alloc] initWithFrame: bounds];
        frameView.windowFramePadding = windowFramePadding;
        super.contentView = frameView;


        if (showsCloseButton) [windowButtons addObject: [NSWindow standardWindowButton: NSWindowCloseButton forStyleMask: NSTitledWindowMask]];
        if (showsMinimizeButton) [windowButtons addObject: [NSWindow standardWindowButton: NSWindowMiniaturizeButton forStyleMask: NSTitledWindowMask]];
        if (showsMaximizeButton) [windowButtons addObject: [NSWindow standardWindowButton: NSWindowZoomButton forStyleMask: NSTitledWindowMask]];

        CGFloat prevX = windowFramePadding + buttonPadding;
        for (NSButton *button in windowButtons) {
            NSRect buttonRect = button.frame;
            buttonRect.origin.x = prevX;
            buttonRect.origin.y = bounds.size.height - buttonRect.size.height - 5;
            button.frame = buttonRect;
            button.autoresizingMask = NSViewMinYMargin;
            prevX += button.width + buttonPadding;
            [frameView addSubview: button];
        }

    }

    if (childContentView) [childContentView removeFromSuperview];
    childContentView = aView;
    childContentView.frame = [self contentRectForFrameRect: bounds];
    childContentView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    [frameView addSubview: childContentView];
}


#pragma mark Event handlers

- (void) mainWindowChanged: (NSNotification *) aNotification {
    for (NSButton *button in windowButtons) [button setNeedsDisplay];
}

#pragma mark Class

+ (CGFloat) windowFramePadding {
    return 0.0;
}

+ (NSRect) frameRectForContentRect: (NSRect) windowContentRect styleMask: (NSUInteger) windowStyle {
    NSLog(@"[self class] = %@", [self class]);
    return NSInsetRect(windowContentRect, -[[self class] windowFramePadding], -[[self class] windowFramePadding]);
}


@end