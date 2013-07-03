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


@implementation BasicCustomWindowFrame

@synthesize windowFramePadding;
@synthesize bottomRightRect;
@synthesize resizeRectSize;


@synthesize pathOptions;
@synthesize innerPathOptions;

- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {
        resizeRectSize = NSMakeSize(16, 16);

        innerPathOptions = [[PathOptions alloc] init];
        innerPathOptions.borderColor = [NSColor colorWithDeviceWhite: 1.0 alpha: 0.5];

        pathOptions = [[PathOptions alloc] init];
        pathOptions.cornerRadius = 5.0;
        pathOptions.borderWidth = 0.5;
        pathOptions.borderColor = [NSColor blackColor];
        pathOptions.cornerOptions = NSBezierPathLowerLeft | NSBezierPathLowerRight | NSBezierPathUpperRight | NSBezierPathUpperLeft;
        pathOptions.gradient = [[NSGradient alloc] initWithColorsAndLocations: [NSColor colorWithWhite: 0.3], 0.0,
                                                                               [NSColor colorWithWhite: 0.2], 0.1,
                                                                               [NSColor colorWithWhite: 0.2], 0.9,
                                                                               [NSColor colorWithWhite: 0.3], 1.0,
                                                                               nil];

    }

    return self;
}


- (NSRect) resizeRect {
    NSRect bounds = self.bounds;
    NSRect rect = NSMakeRect(bounds.size.width - resizeRectSize.width, bounds.origin.y, resizeRectSize.width, resizeRectSize.height);
    return rect;
}

- (void) mouseDown: (NSEvent *) event {
    NSPoint pointInView = [self convertPoint: [event locationInWindow] fromView: nil];

    BOOL resize = NO;
    if (NSPointInRect(pointInView, self.resizeRect)) {
        resize = YES;
    }

    NSWindow *window = self.window;
    NSPoint originalMouseLocation = [window convertBaseToScreen: [event locationInWindow]];
    NSRect originalFrame = [window frame];

    while (YES) {
        //
        // Lock focus and take all the dragged and mouse up events until we
        // receive a mouse up.
        //
        NSEvent *newEvent = [window nextEventMatchingMask: (NSLeftMouseDraggedMask | NSLeftMouseUpMask)];

        if (newEvent.type == NSLeftMouseUp) break;

        //
        // Work out how much the mouse has moved
        //
        NSPoint newMouseLocation = [window convertBaseToScreen: [newEvent locationInWindow]];
        NSPoint delta = NSMakePoint(newMouseLocation.x - originalMouseLocation.x, newMouseLocation.y - originalMouseLocation.y);

        NSRect newFrame = originalFrame;

        if (!resize) {
            //
            // Alter the frame for a drag
            //
            newFrame.origin.x += delta.x;
            newFrame.origin.y += delta.y;
        }
        else {
            //
            // Alter the frame for a resize
            //
            newFrame.size.width += delta.x;
            newFrame.size.height -= delta.y;
            newFrame.origin.y += delta.y;

            //
            // Constrain to the window's min and max size
            //
            NSRect newContentRect = [window contentRectForFrameRect: newFrame];
            NSSize maxSize = [window maxSize];
            NSSize minSize = [window minSize];
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

        [window setFrame: newFrame display: YES animate: NO];
    }
}


- (void) drawRect: (NSRect) rect {
    [[NSColor clearColor] set];
    NSRectFill(rect);


    NSBezierPath *path = [NSBezierPath bezierPathWithRect: self.bounds cornerRadius: self.cornerRadius options: self.cornerOptions];
    NSBezierPath *innerBorderPath = [NSBezierPath bezierPathWithRect: NSInsetRect(self.bounds, self.borderWidth, self.borderWidth) cornerRadius: self.cornerRadius options: self.cornerOptions];


    [self.gradient drawInBezierPath: path angle: 90];
    [path drawStroke: self.borderColor width: self.borderWidth];
    [innerBorderPath drawStroke: self.innerBorderColor width: self.borderWidth];

    NSRect resizeRect = self.resizeRect;
    NSBezierPath *resizePath = [NSBezierPath bezierPathWithRect: resizeRect];


    [resizePath drawWithFill: [NSColor lightGrayColor]];
    [resizePath drawStroke: [NSColor darkGrayColor]];

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

- (void) setCornerOptions: (NSBezierPathCornerOptions) cornerOptions1 {
    pathOptions.cornerOptions = cornerOptions1;
}

- (NSBezierPathCornerOptions) cornerOptions {
    return pathOptions.cornerOptions;
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

- (NSGradient *) gradient {
    return pathOptions.gradient;
}

- (void) setGradient: (NSGradient *) gradient1 {
    pathOptions.gradient = gradient1;
}

- (NSColor *) innerBorderColor {
    return innerPathOptions.borderColor;
}

- (void) setInnerBorderColor: (NSColor *) innerBorderColor1 {
    innerPathOptions.borderColor = innerBorderColor1;
}


@end