//
// Created by Dani Postigo on 1/17/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "InputTextFieldCell.h"
#import "NSView+SuperConstraints.h"
#import "NSView+SuperConstaintGetters.h"
#import "NSCell+DrawingUtils.h"
#import "CALayer+InfoUtils.h"

#define DEBUG_DRAWING 1

@implementation InputTextFieldCell

@synthesize textLabel;
@synthesize padding;
@synthesize adjustsBorder;

@synthesize isEditing;

- (id) initTextCell: (NSString *) aString {
    self = [super initTextCell: aString];
    if (self) {

    }

    return self;
}


- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {[self setup];}
    return self;
}

- (void) setup {
    CGFloat topPadding = 4;
    padding = NSEdgeInsetsMake(topPadding, 5, topPadding + 1, 0);
    self.focusRingType = NSFocusRingTypeNone;
    self.adjustsBorder = YES;

    self.backgroundColor = [NSColor clearColor];
    //    self.borderColor = [NSColor clearColor];

    [self updateLabel];

}

- (void) handleAction: (id) sender {
    //    NSLog(@"%s", __PRETTY_FUNCTION__);

}

- (void) setControlView: (NSView *) view {
    [super setControlView: view];

//    NSLog(@"%s, self.controlView = %@", __PRETTY_FUNCTION__, self.controlView);

    if (self.controlView) {
        [view addSubview: self.textLabel];

        NSLayoutConstraint *leadingConstraint = self.textLabel.leadingSuperConstraint;

        if (leadingConstraint == nil) {
            [textLabel.superview addConstraint: [NSLayoutConstraint constraintWithItem: textLabel attribute: NSLayoutAttributeLeading relatedBy: NSLayoutRelationEqual toItem: textLabel.superview attribute: NSLayoutAttributeLeading multiplier: 1.0 constant: self.padding.left]];
            [textLabel.superview addConstraint: [NSLayoutConstraint constraintWithItem: textLabel.superview attribute: NSLayoutAttributeCenterY relatedBy: NSLayoutRelationEqual toItem: textLabel attribute: NSLayoutAttributeCenterY multiplier: 1.0 constant: 0]];
            //            [textLabel addConstraint: [NSLayoutConstraint constraintWithItem: textLabel attribute: NSLayoutAttributeWidth relatedBy: NSLayoutRelationEqual toItem: nil attribute: NSLayoutAttributeNotAnAttribute multiplier: 1.0 constant: padding.left]];
        }


        //        self.controlView.wantsLayer = YES;
        //        CALayer *layer = self.controlView.layer;
        //        layer.backgroundColor = [NSColor whiteColor].CGColor;
        //        layer.borderColor = [NSColor grayColor].CGColor;
        //        NSLog(@"superlayer.infoString = %@", superlayer.infoString);
        //        for (CALayer *sublayer in superlayer.sublayers) {
        //            NSLog(@"sublayer = %@", sublayer);
        //        }

    }
}

- (void) setTitle: (NSString *) aString {
    [super setTitle: aString];
    [self updateLabel];
}


- (void) setFont: (NSFont *) fontObj {
    [super setFont: fontObj];
    [self updateLabel];
}


- (void) updateLabel {
    self.textLabel.stringValue = self.title;
    //    self.textLabel.font = self.font;
    [textLabel sizeToFit];
}

- (NSSize) cellSizeForBounds: (NSRect) aRect {
    NSSize ret = [super cellSizeForBounds: aRect];
    ret.height += padding.top + padding.bottom;
    return ret;
}


- (NSRect) transformRect: (NSRect) aRect {
    CGFloat leftOffset = padding.left + self.textLabel.width + padding.left;
    //    NSLog(@"leftOffset = %f", leftOffset);
    aRect.origin.x += leftOffset;
    aRect.origin.y += padding.top;
    aRect.size.height -= (padding.top + padding.bottom);
    aRect.size.width -= (leftOffset + padding.right);
    return aRect;
}

#if DEBUG_DRAWING


- (void) drawWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    //    NSLog(@"%s", __PRETTY_FUNCTION__);

    NSRect altFrame = [self transformRect: cellFrame];
    //    NSLog(@"Frames: cellFrame = %@, altFrame = %@", NSStringFromRect(cellFrame), NSStringFromRect(altFrame));

    //    [super drawWithFrame: cellFrame inView: controlView];
    //    [super drawWithFrame: altFrame inView: controlView];
    [self drawInteriorWithFrame: cellFrame inView: controlView];

    //    NSLog(@"self.controlView.wantsLayer = %d", self.controlView.wantsLayer);
    //    CALayer *superlayer = self.controlView.layer;
    //    NSLog(@"superlayer.infoString = %@", superlayer.infoString);

}


- (void) drawInteriorWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    //    NSLog(@"%s", __PRETTY_FUNCTION__);

    NSRect altFrame = [self drawingRectForBounds: cellFrame];
    //    NSLog(@"Frames: cellFrame = %@, altFrame = %@", NSStringFromRect(cellFrame), NSStringFromRect(altFrame));

    //    [super drawInteriorWithFrame: cellFrame inView: controlView];
    [super drawInteriorWithFrame: altFrame inView: controlView];
}


- (NSRect) drawingRectForBounds: (NSRect) theRect {
    //    NSLog(@"Called drawingRectForBounds");
    theRect = [self transformRect: theRect];
    return [super drawingRectForBounds: theRect];
}


- (NSRect) titleRectForBounds: (NSRect) theRect {
    //    NSLog(@"Called titleRectForBounds");
    theRect = [self transformRect: theRect];
    return [super titleRectForBounds: theRect];
}


- (NSRect) imageRectForBounds: (NSRect) theRect {
    return [super imageRectForBounds: theRect];
}

#endif

- (void) setState: (NSInteger) value {
    [super setState: value];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}


- (void) editWithFrame: (NSRect) aRect inView: (NSView *) controlView editor: (NSText *) textObj delegate: (id) anObject event: (NSEvent *) theEvent {
    [super editWithFrame: aRect inView: controlView editor: textObj delegate: anObject event: theEvent];
    self.isEditing = YES;
}


- (void) selectWithFrame: (NSRect) aRect inView: (NSView *) controlView editor: (NSText *) textObj delegate: (id) anObject start: (NSInteger) selStart length: (NSInteger) selLength {
    [super selectWithFrame: aRect inView: controlView editor: textObj delegate: anObject start: selStart length: selLength];
    self.isEditing = YES;
}

- (void) endEditing: (NSText *) textObj {
    [super endEditing: textObj];
    self. isEditing = NO;
}


- (void) textDidChange: (NSNotification *) notification {
    //    NSLog(@"NSTextFieldCell noticed that text did change to: %@", self.stringValue);
    //    NSLog(@"Was notified by: \n%@, which is its controlView's currentEditor: \n%@", notification.object, ((NSTextField *) self.controlView).currentEditor);
}




//- (void) editWithFrame: (NSRect) aRect inView: (NSView *) controlView editor: (NSText *) textObj delegate: (id) anObject event: (NSEvent *) theEvent {
//    [super editWithFrame: aRect inView: controlView editor: textObj delegate: anObject event: theEvent];
//}


- (NSTextField *) textLabel {
    if (textLabel == nil) {
        textLabel = [[NSTextField alloc] init];
        textLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [textLabel setBordered: NO];
        [textLabel setEditable: NO];
        [textLabel.cell setUsesSingleLineMode: YES];
        textLabel.backgroundColor = [NSColor clearColor];
        textLabel.postsFrameChangedNotifications = YES;
        [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(textLabelResized:) name: NSViewFrameDidChangeNotification object: textLabel];
    }
    return textLabel;
}

- (void) textLabelResized: (id) sender {

}








//
//- (NSRect) titleRectForBounds: (NSRect) theRect {
//
//    NSRect ret = [super titleRectForBounds: theRect];
//    ret = NSInsetRect(ret, 40, 0);
//    NSLog(@"ret = %@", NSStringFromRect(ret));
//    return ret;
//}
//
//
//- (void) editWithFrame: (NSRect) aRect inView: (NSView *) controlView editor: (NSText *) textObj delegate: (id) anObject event: (NSEvent *) theEvent {
//
//  aRect = NSInsetRect(aRect, 40, 0);
//    [super editWithFrame: aRect inView: controlView editor: textObj delegate: anObject event: theEvent];
//}


@end