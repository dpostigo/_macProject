//
// Created by Dani Postigo on 12/30/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "ColoredButtonCell.h"
#import "NSColor+Crayola.h"
#import "CALayer+ConstraintUtils.h"
#import "NSColor+BlendingUtils.h"
#import "CALayer+InfoUtils.h"
#import "NSColor+NewUtils.h"

@implementation ColoredButtonCell {

}

@synthesize imageColor;
@synthesize buttonColor;

@synthesize fillLayer;
@synthesize shadowLayer;
@synthesize contentLayer;
@synthesize highlightLayer;

@synthesize imageLayer;
@synthesize imageMaskLayer;
@synthesize renderedLayer;
@synthesize depressedLayer;

- (NSColor *) imageColor {
    if (imageColor == nil) {
        imageColor = [NSColor yellowColor];
    }
    return imageColor;
}

- (id) init {
    self = [super init];
    if (self) {
        [self setupButton];
    }

    return self;
}


- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {
        [self setupButton];
    }

    return self;
}


- (void) setupButton {
    self.highlightsBy = 14;
    self.showsStateBy = 0;

    //NSLog(@"coloredbutton self.showsStateBy = %li", self.showsStateBy);
    //NSLog(@"coloredbutton self.highlightsBy = %li", self.highlightsBy);

}

- (void) awakeFromNib {
    [super awakeFromNib];
    //    NSLog(@"self.type = %lu", self.type);
    //    NSLog(@"self.bezelStyle = %d", self.bezelStyle);
    //    NSLog(@"self.highlightsBy = %li", self.highlightsBy);
    //    NSLog(@"self.showsStateBy = %li", self.showsStateBy);
    //
    //    NSLog(@"self.highlightsBy = ");

    //    [self setButtonType: NSMomentaryLight];

    //    NSLog(@"[self buttonTypeString: NSMomentaryLight] = %@", [self buttonTypeString: NSMomentaryLight]);
    //    NSLog(@"[self buttonTypeString: self.type] = %@", [self buttonTypeString: self.type]);
    //    NSLog(@"[self cellTypeString: self.highlightsBy] = %@", [self cellTypeString: self.highlightsBy]);
    //    NSLog(@"[self stateMaskString: self.highlightsBy] = %@", [self stateMaskString: self.highlightsBy]);
    //    NSLog(@"[self stateMaskString: self.showsStateBy] = %@", [self stateMaskString: self.showsStateBy]);
    //    NSLog(@"[self stringForHighlightsByValue: self.highlightsBy] = %@", [self stringForHighlightsByValue: self.highlightsBy]);
}


- (NSString *) cellTypeString: (NSInteger) value {
    NSMutableArray *ret = [[NSMutableArray alloc] init];

    if (value & NSNullCellType) {
        [ret addObject: @"NSNullCellType"];
    }
    if (value & NSImageCellType) {
        [ret addObject: @"NSImageCellType"];
    }
    if (value & NSTextCellType) {
        [ret addObject: @"NSTextCellType"];
    }
    return [ret componentsJoinedByString: @", "];

}


- (NSString *) stateMaskString: (NSInteger) value {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if (value & NSNoCellMask) {
        [ret addObject: @"NSNoCellMask"];
    }
    if (value & NSContentsCellMask) {
        [ret addObject: @"NSContentsCellMask"];
    }
    if (value & NSPushInCellMask) {
        [ret addObject: @"NSPushInCellMask"];
    }
    if (value & NSChangeGrayCellMask) {
        [ret addObject: @"NSChangeGrayCellMask"];
    }
    if (value & NSChangeBackgroundCellMask) {
        [ret addObject: @"NSChangeBackgroundCellMask"];
    }
    return [ret componentsJoinedByString: @", "];
}


- (NSString *) buttonTypeString: (NSUInteger) value {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if (value == NSMomentaryLightButton) {
        [ret addObject: @"NSMomentaryLightButton"];
    }
    if (value == NSPushOnPushOffButton) {
        [ret addObject: @"NSPushOnPushOffButton"];
    }
    if (value == NSToggleButton) {
        [ret addObject: @"NSToggleButton"];
    }
    if (value == NSSwitchButton) {
        [ret addObject: @"NSSwitchButton"];
    }
    if (value == NSRadioButton) {
        [ret addObject: @"NSRadioButton"];
    }
    if (value == NSMomentaryChangeButton) {
        [ret addObject: @"NSMomentaryChangeButton"];
    }
    if (value == NSOnOffButton) {
        [ret addObject: @"NSOnOffButton"];
    }
    if (value == NSMomentaryPushInButton) {
        [ret addObject: @"NSMomentaryPushInButton"];
    }
    if (value == NSMomentaryPushButton) {
        [ret addObject: @"NSMomentaryPushButton"];
    }
    if (value == NSMomentaryLight) {
        [ret addObject: @"NSMomentaryLight"];
    }
    return [ret componentsJoinedByString: @", "];
}

- (NSString *) stringForHighlightsByValue: (NSInteger) value {

    NSMutableArray *ret = [[NSMutableArray alloc] init];

    if (value & NSNoCellMask) {
        [ret addObject: @"NSNoCellMask"];
    }
    if (value & NSContentsCellMask) {
        [ret addObject: @"NSContentsCellMask"];
    }
    if (value & NSPushInCellMask) {
        [ret addObject: @"NSPushInCellMask"];
    }

    if (value & NSChangeGrayCellMask) {
        [ret addObject: @"NSChangeGrayCellMask"];
    }
    if (value & NSChangeBackgroundCellMask) {
        [ret addObject: @"NSChangeBackgroundCellMask"];
    }

    return [ret componentsJoinedByString: @", "];

}


- (void) setButtonType: (NSButtonType) aType {
    [super setButtonType: aType];
}


- (void) setControlView: (NSView *) view {

    [super setControlView: view];

    self.controlView.wantsLayer = YES;
    [self createButtonLayers: self.controlView.layer];
    self.buttonColor = [NSColor greenColor];
    self.buttonColor = [NSColor crayolaBdazzledBlueColor];
}


- (void) drawBezelWithFrame: (NSRect) frame inView: (NSView *) controlView {
    [super drawBezelWithFrame: frame inView: controlView];
    controlView.layer.bounds = controlView.bounds;
}


- (void) drawImage: (NSImage *) image withFrame: (NSRect) frame inView: (NSView *) controlView {
    //    [super drawImage: image withFrame: frame inView: controlView];
    imageLayer.bounds = NSMakeRect(0, 0, image.size.width, image.size.height);
    imageLayer.backgroundColor = (self.state == NSOnState ? [NSColor whiteColor] : [NSColor lightGrayColor]).CGColor;
    imageMaskLayer.contents = image;
}

- (void) drawInteriorWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    [super drawInteriorWithFrame: cellFrame inView: controlView];

    [self drawImage: self.image withFrame: cellFrame inView: controlView];
    //    self.contentLayer.geometryFlipped = self.isHighlighted;
    depressedLayer.hidden = !self.isHighlighted;


    //    depressedLayer.opacity = self.isHighlighted ? 0.8 : (self.state == NSOnState ? 0.0 : 0.5);
}


- (void) setButtonColor: (NSColor *) buttonColor1 {
    buttonColor = buttonColor1;
    [self updateColors];
}


#pragma mark Layers

- (void) createButtonLayers: (CALayer *) superlayer {
    superlayer.cornerRadius = 5;
    [superlayer makeSuperlayer];

    [superlayer addSublayer: self.renderedLayer];
    [renderedLayer superConstrain];

}


- (CALayer *) imageLayer {
    if (imageLayer == nil) {
        imageLayer = [CALayer new];
        imageLayer.backgroundColor = [NSColor yellowColor].CGColor;

        [imageLayer makeSuperlayer];
        [imageLayer addSublayer: self.imageMaskLayer];
        [imageMaskLayer superConstrain];
        imageLayer.mask = imageMaskLayer;
    }
    return imageLayer;
}


- (CALayer *) imageMaskLayer {
    if (imageMaskLayer == nil) {
        imageMaskLayer = [CALayer new];
        imageMaskLayer.frame = NSMakeRect(0, 0, 5, 5);
        [imageMaskLayer makeSuperlayer];
    }
    return imageMaskLayer;
}

- (CALayer *) depressedLayer {
    if (depressedLayer == nil) {
        depressedLayer = [CALayer new];

        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.backgroundColor = [NSColor blackColorWithAlpha: 0.1].CGColor;
        gradient.colors = [NSArray arrayWithObjects: (__bridge id) [NSColor blackColorWithAlpha: 0.5].CGColor,
                                                     (__bridge id) [NSColor clearColor].CGColor,
                                                     (__bridge id) [NSColor blackColorWithAlpha: 0.1].CGColor,
                                                     nil];
        gradient.opacity = 1.0;

        [depressedLayer makeSuperlayer];

        [depressedLayer addSublayer: gradient];
        depressedLayer.delegate = self;
        depressedLayer.masksToBounds = YES;
        depressedLayer.borderWidth = 1.0;
        depressedLayer.borderColor = [NSColor blackColor].CGColor;
        [gradient superConstrain];
    }
    return depressedLayer;
}

- (CALayer *) renderedLayer {
    if (renderedLayer == nil) {
        renderedLayer = [CALayer new];
        renderedLayer.cornerRadius = 5;
        [renderedLayer makeSuperlayer];

        self.shadowLayer.opacity = 0.5;
        self.shadowLayer.cornerRadius = renderedLayer.cornerRadius;
        [shadowLayer setSublayerCornerRadius: shadowLayer.cornerRadius];
        [renderedLayer insertSublayer: self.shadowLayer atIndex: 0];

        self.contentLayer.borderWidth = 1;
        contentLayer.borderColor = [NSColor blackColorWithAlpha: 0.5].CGColor;
        contentLayer.cornerRadius = renderedLayer.cornerRadius;
        [renderedLayer addSublayer: contentLayer];
        [contentLayer superConstrain: kCAConstraintMinX];
        [contentLayer superConstrain: kCAConstraintMaxX];
        [contentLayer superConstrain: kCAConstraintMinY];
        [contentLayer superConstrain: kCAConstraintMaxY offset: -2];

        [renderedLayer addSublayer: self.imageLayer];
        [imageLayer superConstrain: kCAConstraintMidX];
        [imageLayer superConstrain: kCAConstraintMidY offset: -1];

        renderedLayer.delegate = self;
    }

    return renderedLayer;

}


- (void) updateColors {

    if (buttonColor) {
        imageLayer.backgroundColor = [NSColor lightGrayColor].CGColor;

        contentLayer.borderColor = [buttonColor darken: 0.8].CGColor;

        shadowLayer.backgroundColor = [buttonColor lighten: 0.5].CGColor;
        shadowLayer.borderColor = [[buttonColor desaturate: 0.5] darken: 0.2].CGColor;
        shadowLayer.opacity = 0.5;

        [shadowLayer sublayerWithName: @"inside"].hidden = YES;
        [shadowLayer sublayerWithName: @"outside"].hidden = YES;

        //        shadowLayer.backgroundColor = [NSColor clearColor].CGColor;
        //        shadowLayer.borderColor = [NSColor clearColor].CGColor;
        //        shadowLayer.borderWidth = 0.0;

        //        [shadowLayer sublayerWithName: @"inside"].borderWidth = 0.0;
        //        [shadowLayer sublayerWithName: @"inside"].borderColor = [NSColor clearColor].CGColor;
        //        [shadowLayer sublayerWithName: @"inside"].backgroundColor = [NSColor whiteColor].CGColor;
        //        [shadowLayer sublayerWithName: @"outside"].borderColor = [NSColor colorWithWhite: 1.0 alpha: 0.5].CGColor;


        contentLayer.backgroundColor = buttonColor.CGColor;
        fillLayer.colors = [NSArray arrayWithObjects: (__bridge id) [buttonColor darken: 0.1].CGColor,
                                                      (__bridge id) [buttonColor darken: 0.6].CGColor,
                                                      nil];

        highlightLayer.borderColor = [buttonColor lighten: 0.5].CGColor;
        highlightLayer.backgroundColor = [buttonColor lighten: 0.1].CGColor;

        fillLayer.borderColor = highlightLayer.backgroundColor;
        [fillLayer sublayerWithName: @"stroke"].borderColor = highlightLayer.backgroundColor;

    }

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

        CALayer *outside = [CALayer new];
        outside.name = @"outside";
        outside.borderWidth = 0.5;
        [shadowLayer addSublayer: outside];
        [outside superConstrain];

        CALayer *inside = [CALayer new];
        inside.name = @"inside";
        inside.borderWidth = 0.5;
        [shadowLayer addSublayer: inside];
        [inside superConstrainEdgesH: 0];
        [inside superConstrainTopEdge];
        [inside superConstrainBottomEdge: -1];

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

        [contentLayer addSublayer: self.fillLayer];
        fillLayer.borderColor = highlightLayer.backgroundColor;
        [fillLayer sublayerWithName: @"stroke"].cornerRadius = contentLayer.cornerRadius - 1;
        [fillLayer sublayerWithName: @"stroke"].borderColor = highlightLayer.backgroundColor;

        [contentLayer addSublayer: self.depressedLayer];
        [depressedLayer superConstrain];

        highlightLayer.cornerRadius = contentLayer.cornerRadius;
        fillLayer.cornerRadius = contentLayer.cornerRadius;
        depressedLayer.cornerRadius = contentLayer.cornerRadius;
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


- (id <CAAction>) actionForLayer: (CALayer *) layer forKey: (NSString *) event {
    return (id) [NSNull null]; // disable all implicit animations
}


#pragma mark Deprecated


- (void) filterTest: (NSImage *) image withFrame: (NSRect) frame {
    //
    //    image.name = @"image";
    //
    //    CIImage *ciImage = [CIImage imageWithCGImage: [image CGImageForProposedRect: &frame context: context hints: NULL]];
    //    CIFilter *filter = [CIFilter filterWithName: @"CIMaskToAlpha"];
    //    [filter setValue: ciImage forKey: @"inputImage"];
    //
    //    NSImage *outputImage = nil;
    //    outputImage = [filter valueForKey: @"outputImage"];
    //    self.imageLayer.contents = outputImage;

}


@end