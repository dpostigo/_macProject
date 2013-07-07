//
//  VeryBasicButtonCell.m
//  Carts
//
//  Created by Daniela Postigo on 7/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "VeryBasicButtonCell.h"
#import "NSImage+EtchedImageDrawing.h"
//#import "NSImage+JSAdditions.h"


@implementation VeryBasicButtonCell {

}


@synthesize pathOptions;

@synthesize disabledPathOptions;

@synthesize imageOptions;

@synthesize innerBorder;

- (void) setup {

    self.imageScaling = NSImageScaleProportionallyDown;
    self.alignment = NSCenterTextAlignment;
    //    self.backgroundColor = [NSColor clearColor];

    pathOptions = [[PathOptions alloc] init];
    disabledPathOptions = [[PathOptions alloc] init];
    imageOptions = [[ImageOptions alloc] init];
    innerBorder = [[BorderOption alloc] init];

    //    self.imageColor = [NSColor colorWithDeviceWhite: 0.9 alpha: 1.0];
    //    self.imageShadowColor = [NSColor clearColor];


    pathOptions.gradient = [[NSGradient alloc] initWithColorsAndLocations:
            [NSColor colorWithWhite: 0.1], 0.0,
            [NSColor colorWithWhite: 0.35], 1.0,
            nil];
    pathOptions.borderColor = [NSColor colorWithWhite: 0.12];
    pathOptions.borderWidth = 1.0;
    pathOptions.cornerRadius = 3.0;

    innerBorder.borderColor = [NSColor colorWithDeviceWhite: 1.0f alpha: 0.05f];
    //    self.highlightedColor = [NSColor colorWithCalibratedWhite: 0.0f alpha: 0.35];




    disabledPathOptions.gradient = [[NSGradient alloc] initWithColorsAndLocations:
            [NSColor lightGrayColor], 0.0,
            [NSColor darkGrayColor], 1.0,
            nil];

    disabledPathOptions.borderColor = [NSColor darkGrayColor];


    pathOptions.gradient = BLACK_GRADIENT;

//    self.highlightedColor = [NSColor colorWithString: GOLD_COLOR];
//    self.innerStrokeColor = [NSColor whiteColor];
//    self.imageColor       = [NSColor darkGrayColor];
//    self.imageShadowColor = [NSColor whiteColor];

    [self setButtonType: NSMomentaryPushButton];
    self.bezelStyle = NSSmallSquareBezelStyle;
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

- (void) drawBezelWithFrame: (NSRect) frame inView: (NSView *) controlView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    //    [super drawBezelWithFrame: frame inView: controlView];
    //    [[NSColor clearColor] set];
    //    NSRectFill(frame);
    [NSBezierPath drawBezierPathWithRect: frame options: pathOptions];
}


- (void) drawImage: (NSImage *) image withFrame: (NSRect) frame inView: (NSView *) controlView {

    NSLog(@"%s", __PRETTY_FUNCTION__);
    //    [super drawImage: image withFrame: frame inView: controlView];



    //    [image drawInRect: frame fromRect: NSZeroRect operation: NSCompositePlusDarker fraction: imageOptions.alpha];
    //    [image drawInRect: frame withColor: [NSColor whiteColor] innerShadow: nil   dropShadow: nil fraction: 1.0];

}


- (NSRect) drawTitle: (NSAttributedString *) title withFrame: (NSRect) frame inView: (NSView *) controlView {
    //    return [super drawTitle: title withFrame: frame inView: controlView];
    return NSZeroRect;
}

//
//- (BOOL) isOpaque {
//    return NO;
//}


- (NSRect) titleRectForBounds: (NSRect) theRect {
    return NSZeroRect;
}

- (NSRect) imageRectForBounds: (NSRect) theRect {
    return NSZeroRect;
}

- (NSRect) drawingRectForBounds: (NSRect) theRect {
    return NSZeroRect;
}


@end