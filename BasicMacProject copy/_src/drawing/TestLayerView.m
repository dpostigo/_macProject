//
//  TestLayerView.m
//  Carts
//
//  Created by Daniela Postigo on 11/17/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "TestLayerView.h"
#import "NSBezierPath+Utils.h"
#import "NSString+Utils.h"
#import "NSColor+DPColors.h"

@implementation TestLayerView {

}

@synthesize shadowLayer;
@synthesize fillLayer;
@synthesize borderLayer;

@dynamic backgroundColor;
@dynamic borderColor;
@dynamic borderWidth;
@dynamic cornerRadius;
@dynamic shadowColor;
@dynamic shadowOffset;
@dynamic shadowRadius;
@dynamic shadowOpacity;

@synthesize innerShadowLayer;

- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {
        NSLog(@"%s", __PRETTY_FUNCTION__);

    }

    return self;
}

- (BOOL) wantsDefaultClipping {
    return NO;
}

- (BOOL) isOpaque {
    return NO;
}


- (void) drawRect: (NSRect) dirtyRect {
    [[NSColor clearColor] set];
    NSRectFillUsingOperation(self.bounds, NSCompositeSourceOver);

    [self layersInit];

    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
    [self.layer renderInContext: context];
}

#pragma mark Layers

- (void) setFrame: (NSRect) frameRect {
    [super setFrame: frameRect];
    self.layer.frame = self.frame;
    self.fillLayer.frame = self.bounds;
    self.borderLayer.frame = self.bounds;
}

#pragma mark Getters / Setters


//
//- (void) setCornerRadius: (CGFloat) cornerRadius {
//    self.fillLayer.cornerRadius = cornerRadius;
//}
//
//- (CGFloat) cornerRadius {
//    return self.fillLayer.cornerRadius;
//}


#pragma mark Setters

- (void) setBackgroundColor: (NSColor *) backgroundColor {
    self.fillLayer.backgroundColor = backgroundColor.CGColor;
}

- (void) setBorderColor: (NSColor *) borderColor {
    self.borderLayer.borderColor = borderColor.CGColor;
}

- (void) setShadowColor: (NSColor *) shadowColor {
    self.fillLayer.shadowColor = shadowColor.CGColor;
}

- (void) setCornerRadius: (CGFloat) cornerRadius {
    self.fillLayer.cornerRadius = cornerRadius;
    [self updateRefs];
}


#pragma mark Update
- (void) updateRefs {
    self.borderLayer.cornerRadius = self.fillLayer.cornerRadius;
    self.innerShadowLayer.cornerRadius = self.innerShadowLayer.cornerRadius;
}

#pragma mark Awake


- (void) layersInit {
    if (self.layer == nil) {
        self.layer = [CALayer new];
        [self setWantsLayer: YES];
        [self layersSetup];
        [self firstTest];
    }
}

- (void) layersSetup {

    //    [self.layer addSublayer: shadowLayer];
    [self.layer addSublayer: self.fillLayer];
    //    [self.layer addSublayer: self.borderLayer];
    //    [self.layer addSublayer: self.innerShadowLayer];

    //    self.fillLayer.masksToBounds = NO;
    //    self.layer.masksToBounds = NO;

}

- (void) firstTest {

    self.borderWidth = 0.5;
    self.cornerRadius = 3;
    self.backgroundColor = [NSColor offwhiteColor];
    self.borderColor = [NSColor whiteColor];

    self.shadowColor = [NSColor blackColor];
    self.shadowOffset = CGSizeMake(0, -1);
    self.shadowRadius = 2.0;
    self.shadowOpacity = 1.0;

}





#pragma mark Layer Getters



- (CALayer *) fillLayer {
    [self layersInit];
    if (fillLayer == nil) {
        fillLayer = [CALayer new];
    }
    return fillLayer;
}

- (CALayer *) borderLayer {
    [self layersInit];
    if (borderLayer == nil) {
        borderLayer = [CALayer new];
        borderLayer.backgroundColor = [NSColor clearColor].CGColor;
        borderLayer.opaque = NO;
    }
    borderLayer.cornerRadius = fillLayer.cornerRadius;
    return borderLayer;
}

- (CALayer *) shadowLayer {
    [self layersInit];
    if (shadowLayer == nil) {
        shadowLayer = [CALayer new];
    }
    shadowLayer.cornerRadius = fillLayer.cornerRadius;
    return shadowLayer;
}


- (DPInnerShadowLayer *) innerShadowLayer {
    [self layersInit];
    if (innerShadowLayer == nil) {
        innerShadowLayer = [DPInnerShadowLayer layer];
        innerShadowLayer.frame = self.bounds;
        innerShadowLayer.shadowMask = YIInnerShadowMaskAll;
    }
    innerShadowLayer.cornerRadius = fillLayer.cornerRadius;
    return innerShadowLayer;
}


#pragma mark Surrogates / forwarding

- (NSDictionary *) surrogateDictionary {
    NSMutableDictionary *ret = [[NSMutableDictionary alloc] init];
    [ret setObject: self.fillLayer forKey: @"backgroundColor"];
    [ret setObject: self.fillLayer forKey: @"cornerRadius"];
    [ret setObject: self.borderLayer forKey: @"borderColor"];
    [ret setObject: self.borderLayer forKey: @"borderWidth"];

    [ret setObject: self.innerShadowLayer forKey: @"innerShadowColor"];

    [ret setObject: self.fillLayer forKey: @"shadowColor"];
    [ret setObject: self.fillLayer forKey: @"shadowRadius"];
    [ret setObject: self.fillLayer forKey: @"shadowOpacity"];
    [ret setObject: self.fillLayer forKey: @"shadowOffset"];
    ret = [self translateDictionary: ret];
    return ret;
}

- (NSDictionary *) methodDictionary {
    NSMutableDictionary *ret = [[NSMutableDictionary alloc] init];

    [ret setObject: @"shadowColor" forKey: @"innerShadowColor"];

    ret = [self translateDictionary: ret];
    return ret;
}

- (NSArray *) cgColors {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    [ret addObject: @"backgroundColor"];
    return ret;

}

- (NSMutableDictionary *) translateDictionary: (NSDictionary *) dictionary {

    NSMutableDictionary *ret = [[NSMutableDictionary alloc] init];

    NSArray *keys = [dictionary allKeys];

    for (NSString *key in keys) {
        id value = [dictionary objectForKey: key];
        [ret setObject: value forKey: key];

        NSString *setterString = [key stringByReplacingCharactersInRange: NSMakeRange(0, 1) withString: [[key substringToIndex: 1] capitalizedString]];
        [ret setObject: value forKey: [NSString stringWithFormat: @"set%@:", setterString]];
    }

    return ret;
}


- (id) forwardingTargetForSelector: (SEL) aSelector {
    id ret = nil;

    NSDictionary *surrDict = [self surrogateDictionary];
    NSString *selectorString = NSStringFromSelector(aSelector);


    id surrogate = [surrDict objectForKey: selectorString];
    if (surrogate) {
        NSMethodSignature *signature = [surrogate methodSignatureForSelector: aSelector];
        if (signature) {
            ret = surrogate;
        } else {
            NSLog(@"No signature.");
        }
    } else {
        NSLog(@"No surrogate.");
    }


    //
    //    for (int j = 0; j < [self.surrogates count]; j++) {
    //        id surrogate = [self.surrogates objectAtIndex: j];
    //        NSMethodSignature *signature = [surrogate methodSignatureForSelector: aSelector];
    //
    //        if (signature) {
    //            ret = surrogate;
    //            break;
    //        }
    //    }
    return ret == nil ? [super forwardingTargetForSelector: aSelector] : ret;
}


- (NSMethodSignature *) methodSignatureForSelector: (SEL) selector {

    NSMethodSignature *signature = [super methodSignatureForSelector: selector];
    if (!signature) {

        //        for (int j = 0; j < [self.surrogates count]; j++) {
        //            id surrogate = [self.surrogates objectAtIndex: j];
        //            signature = [surrogate methodSignatureForSelector: selector];
        //
        //            if (signature) {
        //                break;
        //            }
        //        }
    }
    return signature;
}




#pragma mark Old



- (void) maskTest2 {
    // Do any additional setup after loading the view, typically from a nib.

    // create a yellow background

    CALayer *innerLayer = [CALayer new];
    innerLayer.frame = self.bounds;
    innerLayer.backgroundColor = [NSColor yellowColor].CGColor;


    // create the layer on top of the yellow background that will be masked
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = self.layer.bounds;
    imageLayer.backgroundColor = [NSColor clearColor].CGColor;
    imageLayer.shadowColor = [NSColor blackColor].CGColor;
    imageLayer.shadowOpacity = 1.0;
    imageLayer.shadowRadius = 2.0;
    imageLayer.borderWidth = 1.0;
    imageLayer.borderColor = [NSColor blackColor].CGColor;

    // create the mask that will be applied to the layer on top of the yellow background
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.fillRule = kCAFillRuleEvenOdd;
    maskLayer.frame = self.bounds;

    // add the paths to sublayers of the mask
    CGMutablePathRef p1 = CGPathCreateMutable();
    //    CGPathAddPath(p1, nil, CGPathCreateWithRect((CGRect) {{20, 60}, {100, 150}}, nil));
    CGPathAddPath(p1, nil, CGPathCreateWithRect((CGRect) self.bounds, nil));
    //    CGPathAddPath(p1, nil, CGPathCreateWithEllipseInRect((CGRect) {{0, 0}, {190, 190}}, nil));
    maskLayer.path = p1;

    // apply the mask to the layer on top of the yellow background
    imageLayer.mask = maskLayer;
    [innerLayer addSublayer: imageLayer];



    //    // display the path of the masks the for screenshot
    //    CAShapeLayer *pathLayer1 = [CAShapeLayer layer];
    //    pathLayer1.path = maskLayer.path;
    //    pathLayer1.lineWidth = 2.0;
    //    pathLayer1.strokeColor = [NSColor blackColor].CGColor;
    //    pathLayer1.fillColor = [NSColor clearColor].CGColor;
    //    [innerLayer addSublayer: pathLayer1];

    [self.layer addSublayer: innerLayer];

}


- (void) maskTest {

    // create a yellow background
    self.layer.backgroundColor = [NSColor yellowColor].CGColor;

    // create the layer on top of the yellow background that will be masked
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = self.bounds;
    imageLayer.backgroundColor = [NSColor blueColor].CGColor;
    //    imageLayer.backgroundColor = [NSColor clearColor].CGColor;
    //    imageLayer.borderColor = [NSColor blackColor].CGColor;
    imageLayer.borderWidth = 1.0;

    // create the mask that will be applied to the layer on top of the yellow background
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.fillRule = kCAFillRuleEvenOdd;
    maskLayer.frame = self.bounds;

    CAShapeLayer *maskSubLayer1 = [CAShapeLayer layer];
    maskSubLayer1.fillRule = kCAFillRuleEvenOdd;
    maskSubLayer1.frame = self.bounds;

    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    circleLayer.fillRule = kCAFillRuleEvenOdd;
    circleLayer.frame = self.bounds;
    circleLayer.shadowColor = [NSColor blackColor].CGColor;
    circleLayer.shadowOpacity = 1.0;
    circleLayer.shadowRadius = 2.0;

    // add the paths to sublayers of the mask
    NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect: self.bounds xRadius: self.cornerRadius yRadius: self.cornerRadius];
    //    maskSubLayer1.path = path.quartzPath;


    maskSubLayer1.path = CGPathCreateWithRect((CGRect) {{0, 0}, {100, 150}}, nil);
    circleLayer.path = CGPathCreateWithEllipseInRect((CGRect) {{0, 0}, {190, 190}}, nil);



    // add the sublayers to the mask (instead of using CGPathAddPath())
    [maskLayer addSublayer: maskSubLayer1];
    [maskLayer addSublayer: circleLayer];

    // apply the mask to the layer on top of the yellow background
    imageLayer.mask = maskLayer;
    [self.layer addSublayer: imageLayer];


    //    // display the path of the masks the for screenshot
    CAShapeLayer *pathLayer1 = [CAShapeLayer layer];
    pathLayer1.path = maskSubLayer1.path;
    pathLayer1.lineWidth = 2.0;
    pathLayer1.strokeColor = [NSColor blackColor].CGColor;
    pathLayer1.fillColor = [NSColor clearColor].CGColor;
    [self.layer addSublayer: pathLayer1];
    //

    NSBezierPath *framePath = [NSBezierPath bezierPathWithRect: self.bounds];
    CAShapeLayer *pathLayer2 = [CAShapeLayer layer];
    pathLayer2.path = framePath.quartzPath;
    pathLayer2.lineWidth = 2.0;
    pathLayer2.strokeColor = [NSColor blackColor].CGColor;
    pathLayer2.fillColor = [NSColor clearColor].CGColor;
    //
    //    pathLayer2.shadowColor = [NSColor blackColor].CGColor;
    //    pathLayer2.shadowOpacity = 1.0;
    //    pathLayer2.shadowRadius = 2.0;
    [self.layer addSublayer: pathLayer2];
}


@end