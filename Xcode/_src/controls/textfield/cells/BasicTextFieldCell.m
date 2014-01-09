//
//  BasicTextFieldCell.m
//  TaskManager
//
//  Created by Daniela Postigo on 6/10/13.
//  Copyright 2013 Dani Postigo. All rights reserved.
//

#import "BasicTextFieldCell.h"
#import "NSBezierPath+DPUtils.h"

@implementation BasicTextFieldCell {

}

@synthesize paddingTop;
@synthesize paddingBottom;
@synthesize paddingLeft;
@synthesize paddingRight;
@synthesize cellPadding;
@synthesize borderColor;
@synthesize backgroundColor;
@synthesize borderWidth;

@synthesize selectedBackgroundColor;

- (void) setup {
    borderColor = [NSColor lightGrayColor];
    backgroundColor = [NSColor whiteColor];
    selectedBackgroundColor = [backgroundColor colorWithAlphaComponent: 0.5];
}

- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (id) initTextCell: (NSString *) aString {
    self = [super initTextCell: aString];
    if (self) {
        [self setup];
    }

    return self;
}

- (id) initImageCell: (NSImage *) image {
    self = [super initImageCell: image];
    if (self) {
        [self setup];
    }

    return self;
}


- (void) setCellPadding: (CGFloat) cellPadding1 {
    cellPadding = cellPadding1;
    paddingTop = cellPadding;
    paddingLeft = cellPadding;
    paddingBottom = cellPadding * 2;
    paddingRight = cellPadding * 2;

}


- (void) drawWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {

    NSBezierPath *path = [NSBezierPath bezierPathWithRect: cellFrame];
    [path drawStroke: borderColor width: 1.0];

    cellFrame.origin.x += paddingLeft;
    cellFrame.origin.y += paddingTop;
    cellFrame.size.height -= paddingBottom;
    cellFrame.size.width -= paddingRight;
    [super drawWithFrame: cellFrame inView: controlView];
}


- (void) selectWithFrame: (NSRect) aRect inView: (NSView *) controlView editor: (NSText *) textObj delegate: (id) anObject start: (NSInteger) selStart length: (NSInteger) selLength {
    aRect.origin.x += paddingLeft;
    aRect.origin.y += paddingTop + (paddingTop == 0 ? 0 : 0.5);
    aRect.size.height -= paddingBottom;
    aRect.size.width -= paddingRight;
    [super selectWithFrame: aRect inView: controlView editor: textObj delegate: anObject start: selStart length: selLength];
}


@end