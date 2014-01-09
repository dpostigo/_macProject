//
//  BasicCustomWindow.m
//  Carts
//
//  Created by Daniela Postigo on 6/24/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicCustomWindow.h"
#import "BasicCustomWindowFrame.h"

@implementation BasicCustomWindow {

}

@synthesize windowFrame;
@synthesize childContentView;

@synthesize windowButtonsLeft;
@synthesize showsCloseButton;
@synthesize showsMinimizeButton;
@synthesize showsMaximizeButton;

@synthesize buttonSpacing;
@synthesize buttonHeight;
@synthesize windowFramePadding;

@synthesize frameClassString;

@synthesize windowButtonsRight;

@synthesize titleBarView;

- (id) initWithContentRect: (NSRect) contentRect styleMask: (NSUInteger) aStyle backing: (NSBackingStoreType) bufferingType defer: (BOOL) flag {
    self = [super initWithContentRect: contentRect styleMask: NSBorderlessWindowMask backing: bufferingType defer: flag];
    if (self) {
        [self setOpaque: NO];
        self.backgroundColor = [NSColor clearColor];
        self.frameClass = [BasicCustomWindowFrame class];
        self.windowButtonsLeft = [[NSMutableArray alloc] init];
        self.windowButtonsRight = [[NSMutableArray alloc] init];
        self.showsCloseButton = YES;
        self.showsMaximizeButton = YES;
        self.showsMinimizeButton = YES;

        windowFramePadding = [[self class] windowFramePadding];
        buttonSpacing = 5;
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

- (BasicCustomWindowFrame *) windowFrame {
    if (windowFrame == nil) {
        NSRect bounds = self.bounds;
        windowFrame = [[self.frameClass alloc] initWithFrame: bounds];
        windowFrame.windowFramePadding = windowFramePadding;

        NSArray *buttons = self.windowButtonsLeft;

        CGFloat prevX = windowFramePadding + buttonSpacing;
        for (NSButton *button in buttons) {
            NSRect buttonRect = button.frame;
            buttonRect.origin.x = prevX;
            buttonRect.origin.y = bounds.size.height - buttonRect.size.height - ((buttonHeight - button.size.height) / 2);
            button.frame = buttonRect;
            button.autoresizingMask = NSViewMinYMargin;
            prevX += button.width + buttonSpacing;
            [windowFrame addSubview: button];
        }

        NSRect titleBarRect = NSMakeRect(prevX, bounds.size.height - buttonHeight, bounds.size.width - prevX, buttonHeight);
        titleBarView = [[NSView alloc] initWithFrame: titleBarRect];
        titleBarView.autoresizingMask = NSViewWidthSizable | NSViewMaxYMargin | NSViewMinYMargin;
        [windowFrame addSubview: titleBarView];

    }
    return windowFrame;
}

- (NSMutableArray *) windowButtonsLeft {
    for (NSButton *button in windowButtonsLeft) [button removeFromSuperview];
    [windowButtonsLeft removeAllObjects];
    if (showsCloseButton) [windowButtonsLeft addObject: [NSWindow standardWindowButton: NSWindowCloseButton forStyleMask: NSTitledWindowMask]];
    if (showsMinimizeButton) [windowButtonsLeft addObject: [NSWindow standardWindowButton: NSWindowMiniaturizeButton forStyleMask: NSTitledWindowMask]];
    if (showsMaximizeButton) [windowButtonsLeft addObject: [NSWindow standardWindowButton: NSWindowZoomButton forStyleMask: NSTitledWindowMask]];
    return windowButtonsLeft;
}


- (NSRect) bounds {
    return NSMakeRect(0, 0, self.frame.size.width, self.frame.size.height);
}


#pragma mark Overrides



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

    NSSize childBoundsSize = childContentView.bounds.size;
    sizeDelta.width -= childBoundsSize.width;
    sizeDelta.height -= childBoundsSize.height;

    BasicCustomWindowFrame *frameView = [super contentView];
    NSSize newFrameSize = frameView.bounds.size;
    newFrameSize.width += sizeDelta.width;
    newFrameSize.height += sizeDelta.height;

    [super setContentSize: newFrameSize];
}


- (NSRect) contentRectForFrameRect: (NSRect) windowFrameRect {
    windowFrameRect.origin = NSZeroPoint;
    if (windowFramePadding) windowFrameRect = NSInsetRect(windowFrameRect, windowFramePadding, windowFramePadding);
    windowFrameRect.size.height -= buttonHeight;
    return windowFrameRect;
}

- (void) setContentView: (NSView *) aView {
    if ([childContentView isEqualTo: aView]) return;

    NSRect bounds = self.frame;
    bounds.origin = NSZeroPoint;

    BasicCustomWindowFrame *frameView = [super contentView];
    if (!frameView) {
        frameView = self.windowFrame;
        super.contentView = frameView;

    }

    if (childContentView) [childContentView removeFromSuperview];
    childContentView = aView;

    NSRect childContentViewRect = [self contentRectForFrameRect: bounds];
    childContentViewRect.size.width += windowFrame.cornerRadiusInset;
    childContentViewRect.origin.x -= windowFrame.cornerRadiusInset;

    childContentView.frame = [self contentRectForFrameRect: bounds];
    childContentView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    [frameView addSubview: childContentView];
}


#pragma mark Event handlers

- (void) mainWindowChanged: (NSNotification *) aNotification {
    for (NSButton *button in windowButtonsLeft) [button setNeedsDisplay];
}

#pragma mark Class

+ (CGFloat) windowFramePadding {
    return 0.0;
}

+ (NSRect) frameRectForContentRect: (NSRect) windowContentRect styleMask: (NSUInteger) windowStyle {
    return NSInsetRect(windowContentRect, [[self class] windowFramePadding], [[self class] windowFramePadding]);
}


@end