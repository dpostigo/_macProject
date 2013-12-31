//
// Created by Dani Postigo on 12/29/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CartsHeaderController.h"
#import "CALayer+CartsStyle.h"
#import "CALayer+ConstraintUtils.h"
#import "CALayer+FrameUtils.h"
#import "CALayer+InfoUtils.h"
#import "NSColor+NewUtils.h"

@implementation CartsHeaderController {

    NSColor *highlightColor;
    NSColor *strokeColor;
    NSColor *debugColor;
}

- (CALayer *) shadowLayer {
    CALayer *ret = [CALayer new];
    [ret makeSuperlayer];
    ret.backgroundColor = [NSColor colorWithWhite: 0.5 alpha: 1.0].CGColor;
    ret.borderColor = [NSColor colorWithWhite: 0.3 alpha: 1.0].CGColor;
    ret.borderWidth = 0.5;
    return ret;
}


- (CALayer *) highlightLayer {
    CALayer *highlight = [CALayer new];
    highlight.name = @"highlight";
    highlight.borderWidth = 0.5;
    highlight.borderColor = highlightColor.CGColor;
    highlight.backgroundColor = strokeColor.CGColor;

    //    highlight.borderColor = [NSColor blueColor].CGColor;
    //    //    highlight.backgroundColor = [NSColor colorWithWhite: 1.0 alpha: 0.2].CGColor;
    //    [highlight superConstrainEdges: 1];

    [highlight superConstrain: kCAConstraintMinX offset: 0];
    [highlight superConstrain: kCAConstraintMaxX offset: 0];
    [highlight superConstrain: kCAConstraintMinY offset: 1];
    [highlight superConstrain: kCAConstraintMaxY offset: -1];

    [highlight makeSuperlayer];

    //    CALayer *strokeMask = self.strokeGradientMaskLayer;
    //
    //    [highlight addSublayer: strokeMask];
    //    [strokeMask superConstrainEdgesH: 1];
    //    [strokeMask superConstrainTopEdge];
    //    [strokeMask superConstrain: kCAConstraintMaxY to: kCAConstraintMinY offset: 3];
    //    highlight.mask = strokeMask;

    CALayer *strokeMask = [CALayer new];
    strokeMask.backgroundColor = [NSColor greenColor].CGColor;

    [highlight addSublayer: strokeMask];
    [strokeMask superConstrainEdgesH: 1];
    [strokeMask superConstrainTopEdge];
    [strokeMask superConstrain: kCAConstraintMaxY to: kCAConstraintMidY];
    highlight.mask = strokeMask;

    //
    //    CALayer *highlightMask = [CALayer new];
    //    highlightMask.backgroundColor = [NSColor greenColor].CGColor;
    //    [superlayer addSublayer: highlightMask];
    //    [highlightMask superConstrainEdgesH: 0];
    //    [highlightMask superConstrain: kCAConstraintMinY offset: 1];
    //    [highlightMask superConstrain: kCAConstraintMaxY to: kCAConstraintMinY offset: 3];
    //    highlight.mask = highlightMask;




    return highlight;
}

- (CALayer *) strokeGradientMaskLayer {
    CAGradientLayer *strokeMask = [CAGradientLayer layer];
    strokeMask.colors = [NSArray arrayWithObjects: (__bridge id) [NSColor blackColor].CGColor,
                                                   (__bridge id) [NSColor blackColorWithAlpha: 0.1].CGColor,
                                                   nil];

    //    [strokeMask superConstrain];
    return strokeMask;
}


- (CALayer *) fillLayer {
    CAGradientLayer *fill = [CAGradientLayer layer];
    fill.borderWidth = 0.0;
    fill.colors = [NSArray arrayWithObjects: (__bridge id) [NSColor colorWithString: @"4f535c"].CGColor,
                                             (__bridge id) [NSColor colorWithString: @"3b414d"].CGColor,
                                             nil];

    CGFloat inset = 1;
    [fill superConstrain: kCAConstraintMinX offset: inset];
    [fill superConstrain: kCAConstraintMaxX offset: -inset];
    [fill superConstrain: kCAConstraintMinY offset: inset + 0.5];
    [fill superConstrain: kCAConstraintMaxY offset: -inset];

    CALayer *stroke = [CALayer layer];
    stroke.name = @"stroke";
    stroke.borderWidth = 0.5;
    stroke.borderColor = [NSColor redColor].CGColor;
    [fill addSublayer: stroke];
    [stroke superConstrain];

    CALayer *strokeMask = self.strokeGradientMaskLayer;
    [stroke addSublayer: strokeMask];
    [strokeMask superConstrain];
    stroke.mask = strokeMask;

    return fill;
}


- (CALayer *) contentLayer {
    CALayer *superlayer = [CALayer layer];
    superlayer.cornerRadius = 5;
    [superlayer makeSuperlayer];

    CALayer *highlight = self.highlightLayer;
    highlight.cornerRadius = superlayer.cornerRadius;
    [superlayer addSublayer: highlight];

    CALayer *fill = self.fillLayer;
    fill.borderColor = highlight.backgroundColor;

    fill.cornerRadius = superlayer.cornerRadius;
    [fill sublayerWithName: @"stroke"].cornerRadius = superlayer.cornerRadius - 1;
    [fill sublayerWithName: @"stroke"].borderColor = highlight.backgroundColor;
    [superlayer addSublayer: fill];

    return superlayer;
}

- (void) currentTest {

    CALayer *superlayer = addButton.layer;
    superlayer.cornerRadius = 5;
    [superlayer makeSuperlayer];

    CALayer *shadowLayer = self.shadowLayer;
    shadowLayer.opacity = 0.5;
    shadowLayer.cornerRadius = superlayer.cornerRadius;
    [superlayer insertSublayer: shadowLayer atIndex: 0];
    [shadowLayer superConstrain];

    CALayer *contentLayer = self.contentLayer;
    contentLayer.borderWidth = 1;
    contentLayer.borderColor = [NSColor blackColorWithAlpha: 0.5].CGColor;
    contentLayer.cornerRadius = superlayer.cornerRadius;
    [superlayer addSublayer: contentLayer];
    [contentLayer superConstrain: kCAConstraintMinX];
    [contentLayer superConstrain: kCAConstraintMaxX];
    [contentLayer superConstrain: kCAConstraintMinY];
    [contentLayer superConstrain: kCAConstraintMaxY offset: -1];

}

- (void) awakeFromNib {
    [super awakeFromNib];

    addButton.wantsLayer = YES;

    highlightColor = [NSColor colorWithString: @"9da0a4"];
    strokeColor = [NSColor colorWithString: @"6b6f76"];
    debugColor = [NSColor blueColor];



    //    addButton.layer.backgroundColor = debugColor.CGColor;
    //
    //    NSButtonCell *cell = [addButton cell];
    ////    NSLog(@"cell = %@", cell);
    ////    NSLog(@"cell.alignment = %lu", cell.alignment);
    ////    NSLog(@"cell.bezelStyle = %d", cell.bezelStyle);
    ////    NSLog(@"cell.gradientType = %d", cell.gradientType);
    ////    NSLog(@"cell.cellSize = %@", NSStringFromSize(cell.cellSize));
    ////    NSLog(@"cell.controlSize = %lu", cell.controlSize);
    ////    NSLog(@"cell.imageScaling = %lu", cell.imageScaling);
    ////    NSLog(@"cell.isBezeled = %d", cell.isBezeled);
    ////    NSLog(@"cell.isBordered = %d", cell.isBordered);
    ////    NSLog(@"cell.type = %lu", cell.type);
    ////    NSLog(@"cell.isOpaque = %d", cell.isOpaque);
    ////    NSLog(@"cell.controlTint = %lu", cell.controlTint);
    ////    cell.backgroundColor = debugColor;
    //
    //    [self currentTest];
    //
    //    ButtonCell *newCell = [ButtonCell new];
    //    newCell.image = cell.image;
    //    newCell.title = cell.title;
    //    newCell.bezelStyle = NSRoundedBezelStyle;
    //    newCell.imageScaling = cell.imageScaling;
    //    [newCell setBordered: NO];
    //    //    [addButton setCell: newCell];
    //
    //    cell = [addButton cell];
    ////    NSLog(@"cell = %@", cell);
    ////    NSLog(@"cell.alignment = %lu", cell.alignment);
    ////    NSLog(@"cell.bezelStyle = %d", cell.bezelStyle);
    ////    NSLog(@"cell.gradientType = %d", cell.gradientType);
    ////    NSLog(@"cell.cellSize = %@ ", NSStringFromSize(cell.cellSize));
    ////    NSLog(@"cell.controlSize = %lu", cell.controlSize);
    ////    NSLog(@"cell.imageScaling = %lu", cell.imageScaling);
    ////    NSLog(@"cell.isBezeled = %d", cell.isBezeled);
    ////    NSLog(@"cell.isBordered = %d", cell.isBordered);
    ////    NSLog(@"cell.type = %lu", cell.type);
    ////    NSLog(@"cell.isOpaque = %d", cell.isOpaque);
    ////
    ////    NSLog(@"cell.controlTint = %lu", cell.controlTint);
}



#pragma mark Deprecated


- (void) firstTry {
    CALayer *layer = addButton.layer;
    [layer makeSuperlayer];

    CALayer *bgLayer = [CALayer new];
    bgLayer.frame = NSInsetRect(layer.bounds, 1, 0);
    [bgLayer superConstrain: kCAConstraintWidth offset: -2];
    [bgLayer superConstrain: kCAConstraintHeight offset: -2];
    [bgLayer superConstrain: kCAConstraintMidX offset: 0];
    [bgLayer superConstrain: kCAConstraintMidY offset: 0];
    [layer insertSublayer: bgLayer atIndex: 0];
    [bgLayer applySlateStyle];

    bgLayer.borderColor = [NSColor colorWithString: @"262a32"].CGColor;
    //    bgLayer.borderColor = [NSColor colorWithString: @"555961"].CGColor;

    //    bgLayer.shadowColor = [NSColor colorWithString: @"262a32"].CGColor;
    //    bgLayer.shadowColor = [NSColor blackColor].CGColor;
    //    bgLayer.shadowOffset = CGSizeMake(0, 0);
    //    bgLayer.shadowOpacity = 1.0;
    //    bgLayer.shadowRadius = 1.0;
    bgLayer.edgeAntialiasingMask = kCALayerLeftEdge;

    CALayer *innerLayer = [bgLayer applyInnerSlateStyle];
    innerLayer.borderColor = [NSColor colorWithString: @"555961"].CGColor;
    //    innerLayer.hidden = YES;

    NSColor *highColor = [NSColor colorWithWhite: 1.0 alpha: 0.4];
    NSColor *lowColor = [NSColor colorWithWhite: 1.0 alpha: 0.0];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = layer.bounds;
    gradient.startPoint = CGPointMake(0.5, 0.0);
    gradient.endPoint = CGPointMake(0.5, 0.6);
    //    [gradient setColors: [NSArray arrayWithObjects: (__bridge id) [highColor CGColor], /* (__bridge id) [lowColor CGColor],*/ (id) [NSColor clearColor].CGColor, nil]];


    //the rounded rect, with a corner radius of 6 points.
    //this *does* maskToBounds so that any sublayers are masked
    //this allows the gradient to appear to have rounded corners
    CALayer *roundRect = [CALayer layer];
    roundRect.frame = layer.bounds;
    roundRect.cornerRadius = 6.0;
    roundRect.masksToBounds = YES;
    [roundRect addSublayer: gradient];

    [bgLayer insertSublayer: roundRect atIndex: 0];
    [roundRect superConstrain];
    [gradient superConstrain];

    layer.edgeAntialiasingMask = kCALayerLeftEdge;

    highColor = [NSColor colorWithWhite: 1.0 alpha: 0.2];
    lowColor = [NSColor colorWithWhite: 1.0 alpha: 0.1];

    CALayer *shadowLayer = [CALayer new];
    shadowLayer.backgroundColor = [NSColor colorWithString: @"555961"].CGColor;
    shadowLayer.frame = bgLayer.bounds;
    shadowLayer.top = 2;
    //    [layer addSublayer: shadowLayer];
    //    [layer insertSublayer: shadowLayer atIndex: 0];

    //
    //    CAGradientLayer *shadowLayer = [CAGradientLayer layer];
    //
    //    shadowLayer.frame = NSInsetRect(bgLayer.bounds, 1, 0);
    //    shadowLayer.top += 1;
    ////    shadowLayer.frame = (CGRect) {{0, 2}, {layer.width, layer.height}};
    //    shadowLayer.cornerRadius = bgLayer.cornerRadius;
    //    shadowLayer.startPoint = CGPointMake(0.0, 0.5);
    //    shadowLayer.endPoint = CGPointMake(1.0, 0.5);
    //    [shadowLayer setColors: [NSArray arrayWithObjects: (__bridge id) [lowColor CGColor], (__bridge id) [highColor CGColor], (__bridge id) [highColor CGColor], (id) [lowColor CGColor], nil]];
    //
    //    shadowLayer.shadowColor = [NSColor whiteColor].CGColor;
    //    shadowLayer.shadowOffset = CGSizeMake(0, 1);
    //    shadowLayer.shadowOpacity = 1.0;
    //    shadowLayer.shadowRadius = 0.5;



    //    [layer insertSublayer: shadowLayer atIndex: 0];
    //    CALayer *shadowLayer = [CALayer layer];
    //    shadowLayer.frame = layer.bounds;
    //    shadowLayer.backgroundColor = [NSColor greenColor].CGColor;
    //    shadowLayer.shadowColor = [NSColor redColor].CGColor;
    //    shadowLayer.shadowOffset = CGSizeMake(0, -6);
    //    shadowLayer.borderWidth = 1;
    //    shadowLayer.shadowOpacity = 1.0;
    //    shadowLayer.shadowRadius = 10.0;
    //    shadowLayer.masksToBounds = NO;
    //    [layer addSublayer: shadowLayer];


    //    addButton.shadow = [NSShadow shadowWithColor: [NSColor colorWithWhite: 1.0 alpha: 0.5] offset: CGSizeMake(0, 2) radius: 2.0];

    //    layer.masksToBounds = NO;
}


@end