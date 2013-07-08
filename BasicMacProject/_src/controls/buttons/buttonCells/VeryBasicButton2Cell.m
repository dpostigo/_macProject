//
//  VeryBasicButton2Cell.m
//  Carts
//
//  Created by Daniela Postigo on 7/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "VeryBasicButton2Cell.h"
#import "ColorManager.h"
//#import "NSImage+JSAdditions.h"


@implementation VeryBasicButton2Cell {

}


@synthesize pathOptions;

@synthesize disabledPathOptions;

@synthesize imageOptions;

@synthesize innerBorder;

- (void) setup {

    //    self.alignment = NSCenterTextAlignment;

    [self setButtonType: NSMomentaryPushInButton];
    [self setBezelStyle: NSSmallSquareBezelStyle];

    self.imagePosition = NSImageAlignCenter;
    self.imageScaling = NSImageScaleProportionallyDown;
    self.backgroundColor = [NSColor clearColor];

    pathOptions = [[PathOptions alloc] init];
    disabledPathOptions = [[PathOptions alloc] init];
    imageOptions = [[ImageOptions alloc] init];


    innerBorder = [[BorderOption alloc] initWithBorderWidth: 1.0];
    innerBorder.borderColor = [NSColor redColor];

    //    self.imageColor = [NSColor colorWithDeviceWhite: 0.9 alpha: 1.0];
    //    self.imageShadowColor = [NSColor clearColor];


    pathOptions.gradient = [[NSGradient alloc] initWithColorsAndLocations:
            [NSColor colorWithWhite: 0.1], 0.0,
            [NSColor colorWithWhite: 0.35], 1.0,
            nil];
    pathOptions.borderColor = [NSColor colorWithWhite: 0.12];
    pathOptions.borderWidth = 1.0;
    pathOptions.cornerRadius = 3.0;

    //    self.highlightedColor = [NSColor colorWithCalibratedWhite: 0.0f alpha: 0.35];




    disabledPathOptions.gradient = [[NSGradient alloc] initWithColorsAndLocations:
            [NSColor lightGrayColor], 0.0,
            [NSColor darkGrayColor], 1.0,
            nil];

    disabledPathOptions.borderColor = [NSColor darkGrayColor];


    pathOptions.gradient = [ColorManager blackGradient];

    //    self.highlightedColor = [NSColor colorWithString: GOLD_COLOR];
    //    self.innerStrokeColor = [NSColor whiteColor];
    //    self.imageColor       = [NSColor darkGrayColor];
    //    self.imageShadowColor = [NSColor whiteColor];

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


#pragma mark Drawing

- (void) drawWithFrame: (NSRect) frame inView: (NSView *) controlView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [super drawWithFrame: frame inView: controlView];
}

- (void) drawBezelWithFrame: (NSRect) frame inView: (NSView *) controlView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"frame = %@", NSStringFromRect(frame));
    //    [super drawBezelWithFrame: frame inView: controlView];

}


- (void) drawImage: (NSImage *) image withFrame: (NSRect) frame inView: (NSView *) controlView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    //    [super drawImage: image withFrame: frame inView: controlView];

    //    [image drawInRect: frame fromRect: NSZeroRect operation: NSCompositePlusDarker fraction: imageOptions.alpha];
    //    [image drawInRect: frame withColor: [NSColor whiteColor] innerShadow: nil   dropShadow: nil fraction: 1.0];

}

//
//- (NSRect) drawTitle: (NSAttributedString *) title withFrame: (NSRect) frame inView: (NSView *) controlView {
//    //    return [super drawTitle: title withFrame: frame inView: controlView];
//    return NSZeroRect;
//}


- (void) drawInteriorWithFrame: (NSRect) frame inView: (NSView *) controlView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [super drawInteriorWithFrame: frame inView: controlView];

    [NSBezierPath drawBezierPathWithRect: NSInsetRect(frame, 0.5, 0.5) options: pathOptions];
    [NSBezierPath drawBezierPathWithRect: NSInsetRect(frame, 0.5 + pathOptions.borderWidth, 0.5 + pathOptions.borderWidth) borderOptions: innerBorder];
}


#pragma mark Bounds


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


- (NSArray *) borderOptions {
    return pathOptions.borderOptions;
}

- (void) setBorderOptions: (NSArray *) borderOptions {
    pathOptions.borderOptions = borderOptions;
}

- (NSGradient *) gradient {
    return pathOptions.gradient;
}

- (void) setGradient: (NSGradient *) gradient1 {
    pathOptions.gradient = gradient1;
}

- (NSShadow *) innerShadow {
    return pathOptions.innerShadow;
}

- (void) setInnerShadow: (NSShadow *) innerShadow {
    pathOptions.innerShadow = innerShadow;
}


//- (NSRect) titleRectForBounds: (NSRect) theRect {
//    return NSZeroRect;
//}
//
//- (NSRect) imageRectForBounds: (NSRect) theRect {
//    return NSZeroRect;
//}

//
//- (BOOL) isOpaque {
//    return NO;
//}


- (NSRect) drawingRectForBounds: (NSRect) theRect {
    NSRect drawingRect = [super drawingRectForBounds: theRect];
    NSLog(@"drawingRect = %@", NSStringFromRect(drawingRect));

    return drawingRect;
}


@end