//
// Created by Dani Postigo on 12/30/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "ButtonCell.h"
#import "CALayer+ConstraintUtils.h"
#import "NSColor+NewUtils.h"
#import "CALayer+InfoUtils.h"

@implementation ButtonCell {

    CALayer *shadowLayer;
    CALayer *contentLayer;
    CALayer *highlightLayer;
    CAGradientLayer *fillLayer;
}

@synthesize imageColor;

- (NSColor *) imageColor {
    if (imageColor == nil) {
        imageColor = [NSColor yellowColor];
    }
    return imageColor;
}

- (id) init {
    self = [super init];
    if (self) {
        [self setup];
    }

    return self;
}

- (void) setup {
}


- (void) setControlView: (NSView *) view {
    [super setControlView: view];
    self.controlView.wantsLayer = YES;
    [self createButtonLayers: self.controlView.layer];
}


- (void) drawBezelWithFrame: (NSRect) frame inView: (NSView *) controlView {
    [super drawBezelWithFrame: frame inView: controlView];

    NSLog(@"frame = %@", NSStringFromRect(frame));
    controlView.layer.bounds = controlView.bounds;
}


- (void) drawImage: (NSImage *) image withFrame: (NSRect) frame inView: (NSView *) controlView {
    [super drawImage: image withFrame: frame inView: controlView];
    //    NSLog(@"%s", __PRETTY_FUNCTION__);
    //    [image lockFocus];
    //    [imageColor drawSwatchInRect: frame];
    //    [image unlockFocus];
}


- (void) drawInteriorWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    [super drawInteriorWithFrame: cellFrame inView: controlView];
    NSLog(@"cellFrame = %@", NSStringFromRect(cellFrame));
    //    NSLog(@"%s", __PRETTY_FUNCTION__);
}


- (void) drawWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    [super drawWithFrame: cellFrame inView: controlView];
    NSLog(@"cellFrame = %@", NSStringFromRect(cellFrame));
    //    NSLog(@"%s", __PRETTY_FUNCTION__);
}


- (NSColor *) highlightColorWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSColor *ret = [super highlightColorWithFrame: cellFrame inView: controlView];
    return ret;
}

//
//- (void) highlight: (BOOL) flag withFrame: (NSRect) cellFrame inView: (NSView *) controlView {
//    [super highlight: flag withFrame: cellFrame inView: controlView];
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}

- (void) editWithFrame: (NSRect) aRect inView: (NSView *) controlView editor: (NSText *) textObj delegate: (id) anObject event: (NSEvent *) theEvent {
    [super editWithFrame: aRect inView: controlView editor: textObj delegate: anObject event: theEvent];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
//
//- (void) selectWithFrame: (NSRect) aRect inView: (NSView *) controlView editor: (NSText *) textObj delegate: (id) anObject start: (NSInteger) selStart length: (NSInteger) selLength {
//    [super selectWithFrame: aRect inView: controlView editor: textObj delegate: anObject start: selStart length: selLength];
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}



- (void) setState: (NSInteger) value {
    [super setState: value];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}


- (NSRect) drawTitle: (NSAttributedString *) title withFrame: (NSRect) frame inView: (NSView *) controlView {
    return [super drawTitle: title withFrame: frame inView: controlView];
}


- (void) createButtonLayers: (CALayer *) superlayer {

    //    superlayer.backgroundColor = [NSColor yellowColor].CGColor;
    superlayer.cornerRadius = 5;
    [superlayer makeSuperlayer];

    [superlayer addSublayer: self.renderedLayer];

    //    self.shadowLayer.opacity = 0.5;
    //    self.shadowLayer.cornerRadius = superlayer.cornerRadius;
    //    [superlayer insertSublayer: shadowLayer atIndex: 0];
    //
    //    CALayer *contentLayer = self.contentLayer;
    //    contentLayer.borderWidth = 1;
    //    contentLayer.borderColor = [NSColor blackColorWithAlpha: 0.5].CGColor;
    //    contentLayer.cornerRadius = superlayer.cornerRadius;
    //    [superlayer addSublayer: contentLayer];
    //    [contentLayer superConstrain: kCAConstraintMinX];
    //    [contentLayer superConstrain: kCAConstraintMaxX];
    //    [contentLayer superConstrain: kCAConstraintMinY];
    //    [contentLayer superConstrain: kCAConstraintMaxY offset: -2];

}


- (void) updateColors {

    shadowLayer.backgroundColor = [NSColor colorWithWhite: 0.9 alpha: 1.0].CGColor;
    shadowLayer.borderColor = [NSColor colorWithWhite: 0.4 alpha: 1.0].CGColor;
    shadowLayer.borderWidth = 0.5;

    fillLayer.colors = [NSArray arrayWithObjects: (__bridge id) [NSColor colorWithString: @"4f535c"].CGColor,
                                                  (__bridge id) [NSColor colorWithString: @"3b414d"].CGColor,
                                                  nil];

    highlightLayer.borderColor = [NSColor colorWithString: @"9da0a4"].CGColor;
    highlightLayer.backgroundColor = [NSColor colorWithString: @"6b6f76"].CGColor;

    fillLayer.borderColor = highlightLayer.backgroundColor;
    fillLayer.cornerRadius = contentLayer.cornerRadius;
    [fillLayer sublayerWithName: @"stroke"].cornerRadius = contentLayer.cornerRadius - 1;
    [fillLayer sublayerWithName: @"stroke"].borderColor = highlightLayer.backgroundColor;

}

- (CALayer *) renderedLayer {
    CALayer *superlayer = [CALayer new];
    superlayer.cornerRadius = 5;
    [superlayer makeSuperlayer];

    [superlayer insertSublayer: self.shadowLayer atIndex: 0];
    self.shadowLayer.opacity = 0.5;
    self.shadowLayer.cornerRadius = superlayer.cornerRadius;

//    [superlayer addSublayer: self.contentLayer];
    contentLayer.borderWidth = 1;
    contentLayer.borderColor = [NSColor blackColorWithAlpha: 0.5].CGColor;
    contentLayer.cornerRadius = superlayer.cornerRadius;
    [contentLayer superConstrain: kCAConstraintMinX];
    [contentLayer superConstrain: kCAConstraintMaxX];
    [contentLayer superConstrain: kCAConstraintMinY];
    [contentLayer superConstrain: kCAConstraintMaxY offset: -2];
    return superlayer;

}

- (CALayer *) shadowLayer {
    if (shadowLayer == nil) {
        shadowLayer = [CALayer new];
        [shadowLayer makeSuperlayer];
        shadowLayer.backgroundColor = [NSColor colorWithWhite: 0.9 alpha: 1.0].CGColor;
        shadowLayer.borderColor = [NSColor colorWithWhite: 0.4 alpha: 1.0].CGColor;
        shadowLayer.borderWidth = 0.5;
        [shadowLayer superConstrainEdgesH: 0];
        [shadowLayer superConstrainTopEdge];
        [shadowLayer superConstrainBottomEdge: -1];
    }
    return shadowLayer;
}


- (CALayer *) fillLayer {
    if (fillLayer == nil) {
        fillLayer = [CAGradientLayer layer];
        fillLayer.borderWidth = 0.0;
        fillLayer.colors = [NSArray arrayWithObjects: (__bridge id) [NSColor colorWithString: @"4f535c"].CGColor,
                                                      (__bridge id) [NSColor colorWithString: @"3b414d"].CGColor,
                                                      nil];

        CGFloat inset = 1;
        [fillLayer superConstrain: kCAConstraintMinX offset: inset];
        [fillLayer superConstrain: kCAConstraintMaxX offset: -inset];
        [fillLayer superConstrain: kCAConstraintMinY offset: inset + 0.5];
        [fillLayer superConstrain: kCAConstraintMaxY offset: -inset];

        CALayer *stroke = [CALayer layer];
        stroke.name = @"stroke";
        stroke.borderWidth = 0.5;
        stroke.borderColor = [NSColor redColor].CGColor;
        [fillLayer addSublayer: stroke];
        [stroke superConstrain];

        CALayer *strokeMask = self.strokeGradientMaskLayer;
        [stroke addSublayer: strokeMask];
        [strokeMask superConstrain];
        stroke.mask = strokeMask;
    }

    return fillLayer;
}


- (CALayer *) highlightLayer {

    if (highlightLayer == nil) {
        highlightLayer = [CALayer new];
        highlightLayer.name = @"highlightLayer";
        highlightLayer.borderWidth = 0.5;
        highlightLayer.borderColor = [NSColor colorWithString: @"9da0a4"].CGColor;
        highlightLayer.backgroundColor = [NSColor colorWithString: @"6b6f76"].CGColor;

        //    highlightLayer.borderColor = [NSColor blueColor].CGColor;
        //    //    highlightLayer.backgroundColor = [NSColor colorWithWhite: 1.0 alpha: 0.2].CGColor;
        //    [highlightLayer superConstrainEdges: 1];

        [highlightLayer superConstrain: kCAConstraintMinX offset: 0];
        [highlightLayer superConstrain: kCAConstraintMaxX offset: 0];
        [highlightLayer superConstrain: kCAConstraintMinY offset: 1];
        [highlightLayer superConstrain: kCAConstraintMaxY offset: -1];

        [highlightLayer makeSuperlayer];
        CALayer *strokeMask = [CALayer new];
        strokeMask.backgroundColor = [NSColor greenColor].CGColor;

        [highlightLayer addSublayer: strokeMask];
        [strokeMask superConstrainEdgesH: 1];
        [strokeMask superConstrainTopEdge];
        [strokeMask superConstrain: kCAConstraintMaxY to: kCAConstraintMidY];
        highlightLayer.mask = strokeMask;


        //
        //    CALayer *highlightMask = [CALayer new];
        //    highlightMask.backgroundColor = [NSColor greenColor].CGColor;
        //    [superlayer addSublayer: highlightMask];
        //    [highlightMask superConstrainEdgesH: 0];
        //    [highlightMask superConstrain: kCAConstraintMinY offset: 1];
        //    [highlightMask superConstrain: kCAConstraintMaxY to: kCAConstraintMinY offset: 3];
        //    highlightLayer.mask = highlightMask;


    }

    return highlightLayer;
}

- (CALayer *) contentLayer {
    if (contentLayer == nil) {
        contentLayer = [CALayer layer];

        contentLayer.cornerRadius = 5;
        [contentLayer makeSuperlayer];

        [contentLayer addSublayer: self.highlightLayer];
        highlightLayer.cornerRadius = contentLayer.cornerRadius;

        [contentLayer addSublayer: self.fillLayer];
        fillLayer.borderColor = highlightLayer.backgroundColor;
        fillLayer.cornerRadius = contentLayer.cornerRadius;
        [fillLayer sublayerWithName: @"stroke"].cornerRadius = contentLayer.cornerRadius - 1;
        [fillLayer sublayerWithName: @"stroke"].borderColor = highlightLayer.backgroundColor;
    }
    return contentLayer;
}


- (CALayer *) strokeGradientMaskLayer {
    CAGradientLayer *strokeMask = [CAGradientLayer layer];
    strokeMask.colors = [NSArray arrayWithObjects: (__bridge id) [NSColor blackColor].CGColor,
                                                   (__bridge id) [NSColor blackColorWithAlpha: 0.1].CGColor,
                                                   nil];

    return strokeMask;
}


@end