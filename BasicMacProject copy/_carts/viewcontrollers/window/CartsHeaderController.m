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
#import "NSColor+CartsUtils.h"

@implementation CartsHeaderController {

    NSColor *highlightColor;
    NSColor *strokeColor;
}

- (void) gradientMaskTest {
    CALayer *superlayer = addButton.layer;
    //    superlayer.borderColor = [NSColor colorWithString: @"262a32"].CGColor;
    //    superlayer.borderWidth = 1;
    //    superlayer.backgroundColor = [NSColor darkSlateColor].CGColor;
    //    superlayer.cornerRadius = 5;
    [superlayer makeSuperlayer];

    CALayer *stroke = [CALayer new];
    stroke.borderWidth = 0.5;
    stroke.backgroundColor = [NSColor greenColor].CGColor;
    stroke.cornerRadius = superlayer.cornerRadius;
    [superlayer addSublayer: stroke];
    [stroke superConstrainEdges: 1];
    [stroke makeSuperlayer];

    CAGradientLayer *strokeMask = [CAGradientLayer layer];
    strokeMask.colors = [NSArray arrayWithObjects: (__bridge id) [NSColor blackColor].CGColor,
                                                   (__bridge id) [NSColor clearColor].CGColor,
                                                   (__bridge id) [NSColor clearColor].CGColor,
                                                   nil];

    [superlayer addSublayer: strokeMask];
    [strokeMask superConstrain];
    stroke.mask = strokeMask;
}


- (CALayer *) shadowLayer {
    CALayer *ret = [CALayer new];
    [ret makeSuperlayer];

    CALayer *innerShadow = [CALayer new];
    innerShadow.name = @"innerShadow";
    innerShadow.backgroundColor = [NSColor colorWithWhite: 1.0 alpha: 0.5].CGColor;
    [ret addSublayer: innerShadow];
    [innerShadow superConstrain: kCAConstraintMinX];
    [innerShadow superConstrain: kCAConstraintMaxX];
    [innerShadow superConstrain: kCAConstraintMinY];
    [innerShadow superConstrain: kCAConstraintMaxY offset: -1];

    CALayer *outerShadow = [CALayer new];
    outerShadow.name = @"outerShadow";
    outerShadow.backgroundColor = [NSColor colorWithWhite: 1.0 alpha: 0.5].CGColor;
    [ret addSublayer: outerShadow];
    [outerShadow superConstrain];

    return ret;
}


- (CALayer *) strokeLayer {
    CALayer *stroke = [CALayer new];
    stroke.borderWidth = 0.5;
    stroke.borderColor = highlightColor.CGColor;
    stroke.backgroundColor = strokeColor.CGColor;
    //    //    stroke.backgroundColor = [NSColor colorWithWhite: 1.0 alpha: 0.2].CGColor;
    //    stroke.cornerRadius = superlayer.cornerRadius;
    //    [superlayer addSublayer: stroke];
    [stroke superConstrainEdges: 1];
    [stroke makeSuperlayer];

    return stroke;
}

- (CALayer *) strokeMaskLayer {
    CAGradientLayer *strokeMask = [CAGradientLayer layer];
    strokeMask.colors = [NSArray arrayWithObjects: (__bridge id) [NSColor blackColor].CGColor,
                                                   (__bridge id) [NSColor clearColor].CGColor,
                                                   (__bridge id) [NSColor clearColor].CGColor,
                                                   nil];

    //    [superlayer addSublayer: strokeMask];
    [strokeMask superConstrain];
    return strokeMask;
}


- (CALayer *) fillLayer {
    CAGradientLayer *fill = [CAGradientLayer layer];
    //    fill.backgroundColor = [NSColor darkSlateColor].CGColor;
    //    fill.borderColor = [NSColor colorWithString: @"555961"].CGColor;
    fill.borderWidth = 0.5;
    //    fill.borderColor = stroke.backgroundColor;
    //    fill.cornerRadius = superlayer.cornerRadius;
    fill.colors = [NSArray arrayWithObjects: (__bridge id) [NSColor colorWithString: @"4f535c"].CGColor,
                                             (__bridge id) [NSColor colorWithString: @"3b414d"].CGColor,
                                             nil];
    //    fill.mask = strokeMask;

    //    [stroke removeFromSuperlayer];

    CGFloat inset = 1;
    CGFloat topInset = 0.5;
    [fill superConstrain: kCAConstraintMinX offset: inset];
    [fill superConstrain: kCAConstraintMaxX offset: -inset];
    [fill superConstrain: kCAConstraintMinY offset: inset + topInset];
    [fill superConstrain: kCAConstraintMaxY offset: -inset];
    return fill;
}

- (CALayer *) contentLayer {

    CALayer *superlayer = [CALayer layer];
    //    superlayer.borderColor = [NSColor colorWithString: @"262a32"].CGColor;
    superlayer.borderWidth = 1;
    superlayer.backgroundColor = [NSColor darkSlateColor].CGColor;
    superlayer.cornerRadius = 5;
    [superlayer makeSuperlayer];

    CALayer *stroke = self.strokeLayer;
    stroke.cornerRadius = superlayer.cornerRadius;
    [superlayer addSublayer: stroke];

    CALayer *strokeMask = self.strokeMaskLayer;
    stroke.mask = strokeMask;
    [superlayer addSublayer: strokeMask];

    CALayer *fill = self.fillLayer;
    fill.borderColor = stroke.backgroundColor;
    fill.cornerRadius = superlayer.cornerRadius;
    [superlayer addSublayer: fill];

    return superlayer;
}

- (void) currentTest {

    highlightColor = [NSColor colorWithString: @"9da0a4"];
    strokeColor = [NSColor colorWithString: @"6b6f76"];

    CALayer *superlayer = addButton.layer;
    superlayer.cornerRadius = 5;
    [superlayer makeSuperlayer];

    CALayer *shadowLayer = self.shadowLayer;
    [shadowLayer sublayerWithName: @"innerShadow"].cornerRadius = superlayer.cornerRadius;
    [shadowLayer sublayerWithName: @"outerShadow"].cornerRadius = superlayer.cornerRadius;
    shadowLayer.cornerRadius = superlayer.cornerRadius;
//    [superlayer insertSublayer: shadowLayer atIndex: 0];
    [shadowLayer superConstrain];



    //    CALayer *superlayer = [CALayer layer];
    //    superlayer.borderColor = [NSColor colorWithString: @"262a32"].CGColor;
    //    superlayer.borderWidth = 1;
    //    superlayer.backgroundColor = [NSColor darkSlateColor].CGColor;
    superlayer.cornerRadius = 5;
    [superlayer makeSuperlayer];

    CALayer *stroke = self.strokeLayer;
    stroke.cornerRadius = superlayer.cornerRadius;
    [superlayer addSublayer: stroke];

    CALayer *strokeMask = self.strokeMaskLayer;
    stroke.mask = strokeMask;
    [superlayer addSublayer: strokeMask];

    CALayer *fill = self.fillLayer;
    fill.borderColor = stroke.backgroundColor;
    fill.cornerRadius = superlayer.cornerRadius;
    [superlayer addSublayer: fill];

    //
    //
    //    CALayer *contentLayer;
    //    contentLayer = [CALayer new];
    //    contentLayer.backgroundColor = [NSColor darkSlateColor].CGColor;
    //    contentLayer = self.contentLayer;
    //    contentLayer.cornerRadius = superlayer.cornerRadius;
    //    [superlayer addSublayer: contentLayer];
    //    [contentLayer superConstrain: kCAConstraintMinX];
    //    [contentLayer superConstrain: kCAConstraintMaxX];
    //    [contentLayer superConstrain: kCAConstraintMinY];
    //    [contentLayer superConstrain: kCAConstraintMaxY offset: -2];
    //    //    CALayer *contentLayer = self.contentLayer;
    //    //    [superlayer addSublayer: contentLayer];
    //    //    [contentLayer superConstrain];

}

- (void) awakeFromNib {
    [super awakeFromNib];

    //    addButton.layer = [CALayer new];
    addButton.wantsLayer = YES;

    //    [self gradientMaskTest];
    [self currentTest];



    //    CAShapeLayer *topHighlight = [CAShapeLayer new];
    //    topHighlight.backgroundColor = [NSColor alphaWhite: 0.5].CGColor;
    //    //    topHighlight.backgroundColor = [NSColor blueColor].CGColor;
    //
    //    [stroke.superlayer addSublayer: topHighlight];
    //    stroke.masksToBounds = YES;
    //
    //    [topHighlight superConstrain: kCAConstraintWidth];
    //    [topHighlight superConstrain: kCAConstraintMidX];
    //    [topHighlight superConstrain: kCAConstraintMinY];
    //    topHighlight.height = 1;
    //
    //    CALayer *innerLayer2 = [CALayer new];
    //    //    stroke.borderWidth = 1;
    //    innerLayer2.backgroundColor = superlayer.backgroundColor;
    //    innerLayer2.borderColor = [NSColor alphaWhite: 0.5].CGColor;
    //    innerLayer2.borderWidth = 1;
    //    innerLayer2.cornerRadius = superlayer.cornerRadius;
    //    //    innerLayer2.borderColor = [NSColor colorWithString: @"555961"].CGColor;
    //    innerLayer2.borderColor = [NSColor blueColor].CGColor;
    //    //    [stroke addSublayer: innerLayer2];
    //
    //    [innerLayer2 superConstrain: kCAConstraintWidth];
    //    [innerLayer2 superConstrain: kCAConstraintMidX];
    //    [innerLayer2 superConstrain: kCAConstraintHeight offset: 1];
    //    [innerLayer2 superConstrain: kCAConstraintMidY offset: 1];
    //
    //    CAGradientLayer *underlayer = [CAGradientLayer layer];
    //    underlayer.frame = superlayer.bounds;
    //    underlayer.startPoint = CGPointMake(0.0, 0.5);
    //    underlayer.endPoint = CGPointMake(1.0, 0.5);
    //
    //    NSColor *centerColor = [NSColor colorWithWhite: 1.0 alpha: 0.6];
    //    NSColor *edgeColor = [NSColor colorWithWhite: 1.0 alpha: 0.05];
    //    underlayer.colors = [NSArray arrayWithObjects: (__bridge id) edgeColor.CGColor,
    //                                                   (__bridge id) centerColor.CGColor,
    //                                                   (__bridge id) centerColor.CGColor,
    //                                                   (__bridge id) edgeColor.CGColor,
    //                                                   nil];
    //    //    underlayer.top = 1;
    //    //    underlayer.left += 1;
    //    //    underlayer.width -= 2;
    //
    //    [underlayer superConstrain: kCAConstraintWidth offset: 0];
    //    [underlayer superConstrain: kCAConstraintMidX offset: 0];
    //    [underlayer superConstrain: kCAConstraintHeight offset: 0];
    //    [underlayer superConstrain: kCAConstraintMidY offset: 1];
    //    underlayer.borderColor = [NSColor colorWithString: @"5a606a"].CGColor;
    //    //    underlayer.borderColor = [NSColor blueColor].CGColor;
    //    //    underlayer.borderColor = [NSColor whiteColor].CGColor;
    //    underlayer.borderWidth = 0.5;
    //    //    underlayer.shadowColor = [NSColor colorWithString: @"262a32"].CGColor;
    //    //    underlayer.shadowColor = [NSColor whiteColor].CGColor;
    //    //    underlayer.backgroundColor = [NSColor colorWithWhite: 1.0 alpha: 0.5].CGColor;
    //    underlayer.cornerRadius = superlayer.cornerRadius;
    //    //    underlayer.opacity = 0.5;
    //    [superlayer insertSublayer: underlayer atIndex: 0];
    //    //    [superlayer addSublayer: underlayer];
    //
    //
    //    //    superlayer.shadowColor = [NSColor colorWithString: @"262a32"].CGColor;
    //    //    superlayer.shadowColor = [NSColor whiteColor].CGColor;
    //    //    superlayer.shadowOffset = CGSizeMake(0, 1);
    //    //    superlayer.shadowOpacity = 0.5;
    //    //    superlayer.shadowRadius = 1.0;



}


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

    //    layer.shadowColor = [NSColor redColor].CGColor;
    //    layer.shadowOffset = CGSizeMake(0, 0);
    //    layer.shadowOpacity = 1.0;
    //    layer.shadowRadius = 3.0;

    //
    //    bgLayer.shadowColor = [NSColor colorWithWhite: 1.0 alpha: 0.5].CGColor;
    //    bgLayer.shadowOffset = CGSizeMake(0, 0);
    //    bgLayer.shadowOpacity = 1.0;
    //    bgLayer.shadowRadius = 1.0;




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