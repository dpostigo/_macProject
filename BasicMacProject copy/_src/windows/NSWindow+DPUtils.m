//
//  NSWindow+DPUtils.m
//  Carts
//
//  Created by Daniela Postigo on 10/18/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSWindow+DPUtils.h"

@implementation NSWindow (DPUtils)

- (NSRect) bounds {
    NSRect ret = self.frame;
    ret.origin = NSMakePoint(0, 0);
    return ret;
}


- (NSView *) contentAsView {
    return ((NSView *) self.contentView);
}

- (NSArray *) windowButtons {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if (self.closeButton) [ret addObject: self.closeButton];
    if (self.minimizeButton) [ret addObject: self.minimizeButton];
    if (self.maximizeButton) [ret addObject: self.maximizeButton];
    return ret;
}


- (NSArray *) windowButtonClones {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if (self.closeButton) [ret addObject: self.newCloseButton];
    if (self.minimizeButton) [ret addObject: self.newMinimizeButton];
    if (self.maximizeButton) [ret addObject: self.newMaximizeButton];
    return ret;
}

- (NSButton *) newCloseButton {
    return [NSWindow standardWindowButton: NSWindowCloseButton forStyleMask: self.styleMask];
}

- (NSButton *) newMinimizeButton {
    return [NSWindow standardWindowButton: NSWindowMiniaturizeButton forStyleMask: self.styleMask];
}

- (NSButton *) newMaximizeButton {
    return [NSWindow standardWindowButton: NSWindowZoomButton forStyleMask: self.styleMask];
}


- (NSButton *) closeButton {
    return [self standardWindowButton: NSWindowCloseButton];
}


- (NSButton *) minimizeButton {
    return [self standardWindowButton: NSWindowMiniaturizeButton];
}

- (NSButton *) maximizeButton {
    return [self standardWindowButton: NSWindowZoomButton];
}


- (BOOL) isTexturedWindow {
    return (self.styleMask & NSTexturedBackgroundWindowMask) != 0;
}

- (void) setIsTexturedWindow: (BOOL) flag {
    if (flag) {
        self.styleMask = self.styleMask | NSTexturedBackgroundWindowMask;
    } else {
        self.styleMask = self.styleMask & ~NSTexturedBackgroundWindowMask;
    }
}

#pragma mark contentBorderThickness

- (CGFloat) contentBorderThicknessForTopEdge {
    return [self contentBorderThicknessForEdge: NSMaxYEdge];
}


- (CGFloat) contentBorderThicknessForBottomEdge {
    return [self contentBorderThicknessForEdge: NSMinYEdge];
}

- (void) setContentBorderThicknessForTopEdge: (CGFloat) thickness {
    [self setContentBorderThickness: thickness forEdge: NSMaxYEdge];
}


- (void) setContentBorderThicknessForBottomEdge: (CGFloat) thickness {
    [self setContentBorderThickness: thickness forEdge: NSMinYEdge];
}


- (void) addSubviewToWindowFrame: (NSView *) aView {
    NSView *firstSubview = [self.windowFrame.subviews objectAtIndex: 0];
    [self.windowFrame addSubview: aView positioned: NSWindowBelow relativeTo: firstSubview];
}


- (NSView *) windowFrame {
    return [self.contentView superview];
}


- (NSString *) styleMaskAsString {

    NSMutableArray *result = [[NSMutableArray alloc] init];

    if (self.styleMask & NSBorderlessWindowMask) {
        [result addObject: @"NSBorderlessWindowMask"];
    }
    if (self.styleMask & NSTitledWindowMask) {
        [result addObject: @"NSTitledWindowMask"];
    }
    if (self.styleMask & NSClosableWindowMask) {
        [result addObject: @"NSClosableWindowMask"];
    }
    if (self.styleMask & NSMiniaturizableWindowMask) {
        [result addObject: @"NSMiniaturizableWindowMask"];
    }
    if (self.styleMask & NSResizableWindowMask) {
        [result addObject: @"NSResizableWindowMask"];
    }
    if (self.styleMask & NSTexturedBackgroundWindowMask) {
        [result addObject: @"NSTexturedBackgroundWindowMask"];
    }

    return [result componentsJoinedByString: @" | "];
}


- (void) addViewToTitleBar: (NSView *) viewToAdd atXPosition: (CGFloat) x {
    viewToAdd.frame = NSMakeRect(x, [[self contentView] frame].size.height, viewToAdd.frame.size.width, [self heightOfTitleBar]);

    NSUInteger mask = 0;
    if (x > self.frame.size.width / 2.0) {
        mask |= NSViewMinXMargin;
    }
    else {
        mask |= NSViewMaxXMargin;
    }
    [viewToAdd setAutoresizingMask: mask | NSViewMinYMargin];

    [[[self contentView] superview] addSubview: viewToAdd];
}

- (CGFloat) heightOfTitleBar {
    NSRect outerFrame = [self.windowFrame frame];
    NSRect innerFrame = [self.contentView frame];
    return outerFrame.size.height - innerFrame.size.height;
}


@end