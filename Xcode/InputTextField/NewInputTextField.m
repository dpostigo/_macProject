//
// Created by Dani Postigo on 1/20/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "NewInputTextField.h"
#import "NewInputTextFieldCell.h"
#import "CALayer+ConstraintUtils.h"
#import "CALayer+InfoUtils.h"
#import "NSView+SuperConstraints.h"
#import "NSView+NewConstraint.h"
#import "TextFieldView.h"

@implementation NewInputTextField

@synthesize holderLayer;
@synthesize backgroundView;

@synthesize backgroundContained;

- (id) initWithCoder: (NSCoder *) origCoder {
    BOOL sub = YES;

    sub = sub && [origCoder isKindOfClass: [NSKeyedUnarchiver class]]; // no support for 10.1 nibs
    sub = sub && ![self isMemberOfClass: [NSControl class]]; // no raw NSControls
    sub = sub && [[self superclass] cellClass] != nil; // need to have something to substitute
    sub = sub && [[self superclass] cellClass] != [[self class] cellClass]; // pointless if same

    if (!sub) {
        self = [super initWithCoder: origCoder];
    }
    else {
        NSKeyedUnarchiver *coder = (id) origCoder;

        // gather info about the superclass's cell and save the archiver's old mapping
        Class superCell = [[self superclass] cellClass];
        NSString *oldClassName = NSStringFromClass(superCell);
        Class oldClass = [coder classForClassName: oldClassName];
        if (!oldClass)
            oldClass = superCell;

        // override what comes out of the unarchiver
        [coder setClass: [[self class] cellClass] forClassName: oldClassName];

        // unarchive
        self = [super initWithCoder: coder];

        // set it back
        [coder setClass: oldClass forClassName: oldClassName];
        [self setup];
    }

    return self;
}


- (void) setup {

    backgroundContained = YES;

    self.inputCell.leftOffset = 50;
    self.wantsLayer = YES;

    CALayer *layer = self.layer;
    [layer makeSuperlayer];
    layer.borderColor = [NSColor blackColor].CGColor;
    layer.borderWidth = 1.0;

    //    self.canDrawSubviewsIntoLayer = YES;
    [self setupBackgroundView];

}

- (void) setupBackgroundView {

    if (backgroundContained) {
        [self addSubview: self.backgroundView];
        [backgroundView superConstrainEdges];

    } else {

//        if (self.superview) {
//
//        }

    }

    self.backgroundView.wantsLayer = YES;
    self.backgroundView.layer.backgroundColor = [NSColor blueColor].CGColor;

}

//
//- (void) setFrame: (NSRect) frameRect {
//    [super setFrame: frameRect];
//    //    self.backgroundView.frame = self.frame;
//}


- (void) setupGradient {
    //
    //    CAGradientLayer *gradient;
    //    gradient = [CAGradientLayer layer];
    //    gradient.colors = @[(__bridge id) [NSColor whiteColor].CGColor,
    //            (__bridge id) [NSColor whiteColor].CGColor,
    //            (__bridge id) [NSColor colorWithWhite: 0.5 alpha: 0.5].CGColor];
    //    [bgLayer addSublayer: gradient];
    //    [gradient superConstrain];
    //
    //    bgLayer.hidden = YES;
}
//
//- (void) viewDidMoveToSuperview {
//    [super viewDidMoveToSuperview];
//
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//    //    [self.superview addSubview: self.backgroundView];
//
//
//    //    [backgroundView superConstrainEdges];
//
//    if (!backgroundContained) {
//
//        NSLog(@"Adding backgroundView.");
//        NSLog(@"self.superview = %@", self.superview);
//        [self.superview addSubview: self.backgroundView];
//        //        [backgroundView superConstrainTopToItem: self];
//        //        [backgroundView superConstrainLeadingToItem: self];
//        //        backgroundView.width = 200;
//        //        backgroundView.height = 200;
//    }
//
//}
//
//- (void) removeFromSuperview {
//    if (!backgroundContained && backgroundView.superview) {
//        [self.backgroundView removeFromSuperview];
//    }
//    [super removeFromSuperview];
//
//}


- (NSView *) backgroundView {
    if (backgroundView == nil) {
        backgroundView = [[TextFieldView alloc] init];
        backgroundView.wantsLayer = YES;
        backgroundView.translatesAutoresizingMaskIntoConstraints = NO;

    }
    return backgroundView;
}


- (CALayer *) makeBackingLayer {
    //    CAGradientLayer *ret = [CAGradientLayer layer];
    //
    //    CALayer *superlayer =  [super makeBackingLayer];
    //    NSLog(@"superlayer = %@", superlayer);
    //    NSLog(@"superlayer.infoString = %@", superlayer.infoString);
    //    NSLog(@"ret.infoString = %@", ret.infoString);
    //    return ret;
    CALayer *ret = [super makeBackingLayer];
    ret.delegate = self;
    return ret;
}



#pragma mark Setup

- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {
        [self setup];
    }

    return self;
}

- (id) init {
    self = [super init];
    if (self) {
        [self setup];
    }

    return self;
}




#pragma mark Cell

+ (Class) cellClass {
    return [NewInputTextFieldCell class];
}

- (NewInputTextFieldCell *) inputCell {
    return [self.cell isKindOfClass: [NewInputTextFieldCell class]] ? [self cell] : nil;
}


#pragma mark Cell methods

//
//- (void) selectCell: (NSCell *) aCell {
//    [super selectCell: aCell];
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}
//
//
//- (void) updateCellInside: (NSCell *) aCell {
//    [super updateCellInside: aCell];
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}
//
//- (void) drawCellInside: (NSCell *) aCell {
//    [super drawCellInside: aCell];
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}
//
//- (void) drawCell: (NSCell *) aCell {
//    [super drawCell: aCell];
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}
//
//
//- (void) updateCell: (NSCell *) aCell {
//    [super updateCell: aCell];
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}


#pragma mark Core graphics


void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = {0.0, 1.0};

    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];

    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);


    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));

    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);

    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}


#pragma mark CALayerDelegate

//- (void) displayLayer: (CALayer *) layer {
////    [super displayLayer: layer];
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//    NSLog(@"layer.contents = %@", layer.contents);
//}
//
//
//- (void) drawLayer: (CALayer *) layer inContext: (CGContextRef) ctx {
//
//    NSRect rect = layer.bounds;
//    //    [[NSColor yellowColor] set];
//    //    NSRectFill(rect);
//
//    if (layer == self.layer) {
//        NSLog(@"Is layer.");
//        NSArray *sublayers = [NSArray arrayWithArray: layer.sublayers];
//
//        for (CALayer *sublayer in sublayers) {
//            [sublayer removeFromSuperlayer];
//            if ([sublayer isKindOfClass: [CAGradientLayer class]]) {
//            }
//        }
//
//
//        drawLinearGradient(ctx, rect, [NSColor whiteColor].CGColor, [NSColor blueColor].CGColor);
//
//    }
//
//
//    //    CGContextSetFillColorWithColor(ctx, [NSColor yellowColor].CGColor);
//    //    CGContextFillRect(ctx, rect);
//
//    [super drawLayer: layer inContext: ctx];
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}

@end