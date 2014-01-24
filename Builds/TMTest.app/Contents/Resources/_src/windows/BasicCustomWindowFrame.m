//
//  BasicCustomWindowFrame.m
//  Carts
//
//  Created by Daniela Postigo on 6/24/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicCustomWindowFrame.h"
#import "NSBezierPath+DPUtils.h"
#import "NSAttributedString+DPUtils.h"
#import "NSParagraphStyle+DPUtils.h"

@implementation BasicCustomWindowFrame {
    int numCursors;
    NSMutableDictionary *cursorDict;
}

@synthesize windowFramePadding;
@synthesize resizeRectSize;

@synthesize pathOptions;
@synthesize rightResizeRect;

@synthesize cursors;

@synthesize cornerRadiusInset;

- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {

        resizeRectSize = NSMakeSize(16, 16);

        cornerRadiusInset = 0.5;



        pathOptions = [[PathOptions alloc] init];
        pathOptions.cornerRadius = 5.0;
        pathOptions.borderWidth = 0.5;
        pathOptions.borderColor = [NSColor blackColor];
        pathOptions.cornerType = CornerLowerLeft | CornerLowerRight | CornerUpperRight | CornerUpperLeft;
        pathOptions.gradient = [[BasicGradient alloc] initWithColorsAndLocations: [NSColor colorWithWhite: 0.3], 0.0,
                                                                                  [NSColor colorWithWhite: 0.2], 0.1,
                                                                                  [NSColor colorWithWhite: 0.2], 0.9,
                                                                                  [NSColor colorWithWhite: 0.3], 1.0,
                                                                                  nil];

        PathOptions *innerPathOptions = [pathOptions copy];
        innerPathOptions.borderColor = [NSColor colorWithDeviceWhite: 1.0 alpha: 0.3];
        innerPathOptions.borderType = BorderTypeTop;
        innerPathOptions.borderWidth = 1.0;
        pathOptions.innerPathOptions = innerPathOptions;

        numCursors = 8;

    }

    return self;
}


- (NSDictionary *) cursorDict {
    if (cursorDict == nil) {
        cursorDict = [[NSMutableDictionary alloc] init];
        [cursorDict setObject: [[NSCursor alloc] initWithImage: [NSImage imageNamed: @"eastWestResizeCursor.png"] hotSpot: NSZeroPoint] forKey: [NSString stringWithFormat: @"%lu", (NSUInteger) WindowFrameResizeTypeRight]];
        [cursorDict setObject: [[NSCursor alloc] initWithImage: [NSImage imageNamed: @"northSouthResizeCursor.png"] hotSpot: NSZeroPoint] forKey: [NSString stringWithFormat: @"%lu", (NSUInteger) WindowFrameResizeTypeBottom]];
        [cursorDict setObject: [[NSCursor alloc] initWithImage: [NSImage imageNamed: @"northWestSouthEastResizeCursor.png"] hotSpot: NSZeroPoint] forKey: [NSString stringWithFormat: @"%lu", (NSUInteger) WindowFrameResizeTypeBottomRight]];
    }
    return cursorDict;

}

- (NSCursor *) cursorForType: (WindowFrameResizeType) type {
    return [self.cursorDict objectForKey: [NSString stringWithFormat: @"%lu", (NSUInteger) type]];
}


- (void) resetCursorRects {
    [super resetCursorRects];
    NSArray *keys = [self.cursorDict allKeys];
    for (NSString *key in keys) {
        WindowFrameResizeType type = (WindowFrameResizeType) [key integerValue];
        NSCursor *cursor = [self cursorForType: type];
        [self addCursorRect: [self resizeRectForType: type] cursor: cursor];

    }
}


- (NSRect) resizeRectForType: (WindowFrameResizeType) type {
    NSRect rect = NSZeroRect;
    switch (type) {
        case WindowFrameResizeTypeRight :
            rect = self.rightResizeRect;
            break;
        case WindowFrameResizeTypeBottom :
            rect = self.bottomResizeRect;
            break;

        case WindowFrameResizeTypeBottomRight :
            rect = self.bottomRightResizeRect;
            break;
        default :
            break;
    }
    return rect;

}


- (NSRect) bottomRightResizeRect {
    NSRect bounds = self.bounds;
    NSRect rect = NSMakeRect(bounds.size.width - resizeRectSize.width, bounds.origin.y, resizeRectSize.width, resizeRectSize.height);
    return rect;
}


- (NSRect) rightResizeRect {
    NSRect rect = self.bounds;
    rect.size.width = 10;
    rect.origin.x = self.bounds.size.width - rect.size.width;
    rect.size.height -= (resizeRectSize.height * 2);
    rect.origin.y += resizeRectSize.height;
    return rect;
}

- (NSRect) bottomResizeRect {
    NSRect rect = self.bounds;
    rect = NSMakeRect(rect.origin.x + resizeRectSize.width, 0, rect.size.width - (resizeRectSize.width * 2), resizeRectSize.height);
    return rect;
}


- (void) drawRect: (NSRect) rect {

    rect = self.bounds;
    rect = NSInsetRect(rect, cornerRadiusInset, cornerRadiusInset);
    //    rect.size.width += cornerRadiusInset;
    //    rect.origin.x -= cornerRadiusInset;


    [[NSColor clearColor] set];
    NSRectFill(rect);

    [NSBezierPath drawBezierPathWithRect: rect options: pathOptions];

}


- (void) mouseDown: (NSEvent *) event {
    NSPoint pointInView = [self convertPoint: event.locationInWindow fromView: nil];

    BOOL resize = NO;
    WindowFrameResizeType resizeType = WindowFrameResizeTypeNone;
    if (NSPointInRect(pointInView, self.bottomRightResizeRect)) {
        resize = YES;
        resizeType = WindowFrameResizeTypeBottom | WindowFrameResizeTypeRight;
    }
    else if (NSPointInRect(pointInView, self.rightResizeRect)) {
        resize = YES;
        resizeType = WindowFrameResizeTypeRight;
    }

    else if (NSPointInRect(pointInView, self.bottomResizeRect)) {
        resize = YES;
        resizeType = WindowFrameResizeTypeBottom;
    }

    NSWindow *window = self.window;
    NSPoint originalMouseLocation = [window convertBaseToScreen: [event locationInWindow]];
    NSRect originalFrame = window.frame;

    while (YES) {
        NSEvent *newEvent = [window nextEventMatchingMask: (NSLeftMouseDraggedMask | NSLeftMouseUpMask)];

        if (newEvent.type == NSLeftMouseUp) break;

        //
        // Work out how much the mouse has moved
        //
        NSPoint newMouseLocation = [window convertBaseToScreen: newEvent.locationInWindow];
        NSPoint delta = NSMakePoint(newMouseLocation.x - originalMouseLocation.x, newMouseLocation.y - originalMouseLocation.y);

        NSRect newFrame = originalFrame;

        if (!resize) {
            newFrame.origin.x += delta.x;
            newFrame.origin.y += delta.y;
        }
        else {
            //
            // Alter the frame for a resize
            //
            if (resizeType & WindowFrameResizeTypeRight) newFrame.size.width += delta.x;
            if (resizeType & WindowFrameResizeTypeBottom) {
                newFrame.size.height -= delta.y;
                newFrame.origin.y += delta.y;
            }

            //
            // Constrain to the window's min and max size
            //
            NSRect newContentRect = [window contentRectForFrameRect: newFrame];
            NSSize maxSize = window.maxSize;
            NSSize minSize = window.minSize;
            if (newContentRect.size.width > maxSize.width) {
                newFrame.size.width -= newContentRect.size.width - maxSize.width;
            }
            else if (newContentRect.size.width < minSize.width) {
                newFrame.size.width += minSize.width - newContentRect.size.width;
            }
            if (newContentRect.size.height > maxSize.height) {
                newFrame.size.height -= newContentRect.size.height - maxSize.height;
                newFrame.origin.y += newContentRect.size.height - maxSize.height;
            }
            else if (newContentRect.size.height < minSize.height) {
                newFrame.size.height += minSize.height - newContentRect.size.height;
                newFrame.origin.y -= minSize.height - newContentRect.size.height;
            }

        }

        newFrame = NSInsetRect(newFrame, cornerRadiusInset, cornerRadiusInset);
        //        NSLog(@"NSStringFromRect(originalFrame) = %@", NSStringFromRect(originalFrame));
        //        NSLog(@"NSStringFromRect(self.window.frame) = %@", NSStringFromRect(self.window.frame));
        //        NSLog(@"NSStringFromRect(newFrame) = %@", NSStringFromRect(newFrame));
        [window setFrame: newFrame display: YES animate: NO];
    }
}


- (void) drawTitle {
    [[NSColor blackColor] set];
    NSString *windowTitle = self.window.title;
    NSRect titleRect = self.bounds;
    titleRect.origin.y = titleRect.size.height - (windowFramePadding - 7);
    titleRect.size.height = (windowFramePadding - 7);

    NSParagraphStyle *paragraphStyle = [NSParagraphStyle paragraphWithAlignment: NSCenterTextAlignment];
    NSAttributedString *attributedString = [NSAttributedString attributedStringWithString: windowTitle font: [NSFont systemFontOfSize: 14] paragraphStyle: paragraphStyle];
    [attributedString drawWithRect: titleRect options: 0];

}


#pragma mark Getters / Setters

- (void) setCornerOptions: (CornerType) cornerOptions1 {
    pathOptions.cornerType = cornerOptions1;
}

- (CornerType) cornerOptions {
    return pathOptions.cornerType;
}


- (CGFloat) cornerRadius {
    return pathOptions.cornerRadius;
}

- (void) setCornerRadius: (CGFloat) cornerRadius1 {
    pathOptions.cornerRadius = cornerRadius1;
}

- (NSColor *) borderColor {
    return pathOptions.borderColor;
}

- (void) setBorderColor: (NSColor *) borderColor1 {
    pathOptions.borderColor = borderColor1;
}

- (CGFloat) borderWidth {
    return pathOptions.borderWidth;
}

- (void) setBorderWidth: (CGFloat) borderWidth1 {
    pathOptions.borderWidth = borderWidth1;
}

- (BasicGradient *) gradient {
    return pathOptions.gradient;
}

- (void) setGradient: (BasicGradient *) gradient1 {
    pathOptions.gradient = gradient1;
}

- (NSColor *) innerBorderColor {
    return pathOptions.innerPathOptions.borderColor;
}

- (void) setInnerBorderColor: (NSColor *) innerBorderColor1 {
    pathOptions.innerPathOptions.borderColor = innerBorderColor1;
}

- (PathOptions *) innerPathOptions {
    return pathOptions.innerPathOptions;
}

- (void) setInnerPathOptions: (PathOptions *) innerPathOptions {
    pathOptions.innerPathOptions = innerPathOptions;
}


@end