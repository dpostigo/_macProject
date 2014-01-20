//
// Created by Dani Postigo on 1/20/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "NewInputTextFieldCell.h"
#import "CALayer+InfoUtils.h"

@implementation NewInputTextFieldCell

#define BORDER_SIZE 5
#define IMAGE_SIZE 64

@synthesize leftOffset;

- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {[self setup];}
    return self;
}

- (void) setup {
    self.focusRingType = NSFocusRingTypeNone;
    self.backgroundColor = [NSColor clearColor];
}


- (void) drawWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    [super drawWithFrame: cellFrame inView: controlView];

    NSRect titleRect = [self labelRectForBounds: cellFrame];
    NSAttributedString *placeholder = self.placeholderAttributedString;
    //
    //    if (placeholder.length > 0) {
    //        [placeholder drawInRect: titleRect];
    //    }

    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
    NSGraphicsContext *newCtx = [NSGraphicsContext graphicsContextWithGraphicsPort: context flipped: true];
    [NSGraphicsContext saveGraphicsState];
    [NSGraphicsContext setCurrentContext: newCtx];
    [placeholder drawInRect: titleRect];
    [NSGraphicsContext restoreGraphicsState];


    //    NSLog(@"self.controlView.layer.infoString = %@", self.controlView.layer.infoString);

    CALayer *layer = self.controlView.layer;
    //    [layer renderInContext: context];


    //    nsGraphicsContext = [NSGraphicsContext graphicsContextWithGraphicsPort: ctx
    //            flipped: NO];
    //    [NSGraphicsContext saveGraphicsState];
    //    [NSGraphicsContext setCurrentContext: nsGraphicsContext];
    //
    //    // ...Draw content using NS APIs...
    //    NSRect aRect = NSMakeRect(10.0, 10.0, 30.0, 30.0);
    //    NSBezierPath *thePath = [NSBezierPath bezierPathWithRect: aRect];
    //    [[NSColor redColor] set];
    //    [thePath fill];
    //
    //    [NSGraphicsContext restoreGraphicsState];
}






#pragma mark Rects

- (NSRect) labelRectForBounds: (NSRect) bounds {
    NSRect ret = bounds;
    NSRect titleRect = [self titleRectForBounds: bounds];
    CGFloat padding = 3;
    ret.size.width = titleRect.origin.x - padding;
    return ret;
}


- (NSRect) titleRectForBounds: (NSRect) bounds {
    NSRect ret = [super titleRectForBounds: bounds];
    ret.origin.x += leftOffset;

    CGFloat maxX = NSMaxX(bounds);
    CGFloat maxWidth = maxX - NSMinX(ret);
    if (maxWidth < 0) {
        maxWidth = 0;
    }

    ret.size.width = MIN(NSWidth(ret), maxWidth);

    return ret;
}



#pragma mark Overrides

- (void) drawInteriorWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    cellFrame = [self titleRectForBounds: cellFrame];
    [super drawInteriorWithFrame: cellFrame inView: controlView];
}

- (void) selectWithFrame: (NSRect) aRect inView: (NSView *) controlView editor: (NSText *) textObj delegate: (id) anObject start: (NSInteger) selStart length: (NSInteger) selLength {
    aRect = [self titleRectForBounds: aRect];
    [super selectWithFrame: aRect inView: controlView editor: textObj delegate: anObject start: selStart length: selLength];
}


#pragma mark Label / placeholder

- (NSAttributedString *) placeholderAttributedString {
    NSAttributedString *ret = [super placeholderAttributedString];
    if (ret == nil && self.placeholderString) {
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString: self.placeholderString];
        ret = string;
    }
    return ret;
}


@end