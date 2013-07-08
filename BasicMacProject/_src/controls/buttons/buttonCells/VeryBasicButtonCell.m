//
// Created by Daniela Postigo on 5/22/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "VeryBasicButtonCell.h"
#import "NSGraphicsContext+DPUtils.h"


@implementation VeryBasicButtonCell {
}


@synthesize disabledInnerStrokeColor;


@synthesize autoAdjustsCornerRadius;

@synthesize pathOptions;
@synthesize disabledPathOptions;
@synthesize highlightedPathOptions;
@synthesize imageOptions;


@synthesize innerStrokeOptions;

- (void) setup {
    [self setButtonType: NSMomentaryPushInButton];
    [self setBezelStyle: NSSmallSquareBezelStyle];

    pathOptions = [[PathOptions alloc] init];
    pathOptions.cornerRadius = 3.0;
    pathOptions.borderColor = [NSColor colorWithWhite: 0.12];
    pathOptions.borderWidth = 1.0;
    pathOptions.gradient = [[NSGradient alloc] initWithColorsAndLocations:
            [NSColor colorWithWhite: 0.35], 0.0,
            [NSColor colorWithWhite: 0.1], 1.0,
            nil];


    PathOptions *innerPathOptions = [pathOptions copy];
    innerPathOptions.borderColor = [NSColor colorWithDeviceWhite: 1.0 alpha: 0.3];
    innerPathOptions.borderType = BorderTypeBottom;
    innerPathOptions.borderWidth = 1.0;
    pathOptions.innerPathOptions = innerPathOptions;


    disabledPathOptions = [pathOptions copy];
    disabledPathOptions.borderColor = [NSColor redColor];
    disabledPathOptions.gradient = [[NSGradient alloc] initWithColorsAndLocations:
            [NSColor lightGrayColor], 0.0,
            [NSColor darkGrayColor], 1.0,
            nil];

    PathOptions *disabledInnerPathOptions = [disabledPathOptions copy];
    disabledInnerPathOptions.borderColor = [NSColor lightGrayColor];
    disabledInnerPathOptions.borderType = BorderTypeBottom;
    disabledInnerPathOptions.borderWidth = 1.0;
    disabledPathOptions.innerPathOptions = disabledInnerPathOptions;


    imageOptions = [[ImageOptions alloc] init];
    imageOptions.imageColor = [NSColor colorWithDeviceWhite: 0.9 alpha: 1.0];
    //    imageOptions.imageColor = [NSColor redColor];
    imageOptions.imageShadowColor = [NSColor clearColor];
    imageOptions.imageShadowColor = [NSColor blackColor];


    highlightedPathOptions = [pathOptions copy];
    highlightedPathOptions.gradient = [[NSGradient alloc] initWithColorsAndLocations:
            [NSColor colorWithDeviceWhite: 0.35 alpha: 1.0f], 0.0,
            [NSColor colorWithDeviceWhite: 0.1f alpha: 1.0f], 1.0,
            nil];


    self.autoAdjustsCornerRadius = NO;

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

- (void) drawImage: (NSImage *) image withFrame: (NSRect) frame inView: (NSView *) controlView {


    NSGraphicsContext *ctx = [NSGraphicsContext currentContext];
    CGContextRef contextRef = [ctx graphicsPort];
    CGContextTranslateCTM(contextRef, 0, controlView.frame.size.height);
    CGContextScaleCTM(contextRef, 1.0, -1.0);

    NSData *data = [image TIFFRepresentation];
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef) data, NULL);
    if (source) {
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(source, 0, NULL);
        CFRelease(source);

        CGContextSaveGState(contextRef);
        {
            //            NSRect rect = NSOffsetRect(frame, 0.0f, 1.0f);
            NSRect rect = NSInsetRect(frame, -1.0, -1.0);
            CGContextClipToMask(contextRef, rect, imageRef);
            [imageOptions.imageShadowColor setFill];
            NSRectFill(rect);
        }
        CGContextRestoreGState(contextRef);

        CGContextSaveGState(contextRef);
        {
            NSRect rect = frame;
            //            CGContextTranslateCTM(contextRef, 0, rect.size.height);
            //            CGContextScaleCTM(contextRef, 1.0, -1.0);
            CGContextClipToMask(contextRef, rect, imageRef);
            [imageOptions.imageColor setFill];
            NSRectFill(rect);
        }
        CGContextRestoreGState(contextRef);
        CFRelease(imageRef);
    }
}

- (void) drawBezelWithFrame: (NSRect) frame inView: (NSView *) controlView {
    if (autoAdjustsCornerRadius && self.cornerRadius > 0) {
        self.cornerRadius = frame.size.height * 0.4;
    }

    NSGraphicsContext *context = [NSGraphicsContext currentContext];


//    frame = NSInsetRect(frame, 0.5, 0.5);


    if (!self.isEnabled) {
        [NSBezierPath drawBezierPathWithRect: frame options: disabledPathOptions];
    } else if (self.isHighlighted) {
        [NSBezierPath drawBezierPathWithRect: frame options: highlightedPathOptions];
    } else {
        [NSBezierPath drawBezierPathWithRect: frame options: pathOptions];
    }


    //
    //
    //    BOOL outer = NO;
    //    BOOL stroke = YES;
    //    BOOL background = YES;
    //    BOOL innerStroke = YES;
    //    if (background) [self drawBackgroundFill: context frame: frame];
    //    if (stroke) [self drawStroke: context frame: frame];
    //    if (innerStroke) [self drawInnerStroke: context frame: frame];
    //    if (self.isHighlighted) [self drawHighlight: context frame: frame];
}

- (BOOL) isOpaque {
    return NO;
}


#pragma mark Drawing



- (void) drawStroke: (NSGraphicsContext *) context frame: (NSRect) frame {
    //    [context saveGraphicsState];
    //    NSColor *color = self.isEnabled ? pathOptions.borderColor : disabledPathOptions.borderColor;
    //    [color setStroke];
    //    [[NSBezierPath bezierPathWithRoundedRect: NSInsetRect(frame, 1.5f, 1.5f) xRadius: pathOptions.cornerOptions - 1 yRadius: pathOptions.cornerOptions - 1] stroke];
    //    [context restoreGraphicsState];


    NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect: NSInsetRect(frame, 1.5f, 1.5f) xRadius: pathOptions.cornerOptions - 1 yRadius: pathOptions.cornerOptions - 1];
    //    [path drawWithBorderOption: pathOptions.borderOption];

}

- (void) drawInnerStroke: (NSGraphicsContext *) context frame: (NSRect) frame {


    frame = NSInsetRect(frame, pathOptions.borderWidth, pathOptions.borderWidth);
    //    [NSBezierPath drawBezierPathWithRect: frame options: innerStrokeOptions];

    //
    //    [context saveGraphicsState];
    //    NSColor *color = self.isEnabled ? self.innerStrokeColor : disabledInnerStrokeColor;
    //    [color setStroke];
    //    [[NSBezierPath bezierPathWithRoundedRect: NSInsetRect(frame, 2.5f, 2.5f) xRadius: pathOptions.cornerRadius yRadius: pathOptions.cornerRadius] stroke];
    //    [context restoreGraphicsState];

}

- (void) drawBackgroundFill: (NSGraphicsContext *) context frame: (NSRect) frame {
    //    NSGradient *theGradient = self.isEnabled ? pathOptions.gradient : disabledPathOptions.gradient;
    //    NSBezierPath *backgroundPath = [NSBezierPath bezierPathWithRoundedRect: NSInsetRect(frame, 2.0f, 2.0f) xRadius: pathOptions.cornerOptions yRadius: pathOptions.cornerOptions];
    //    [context drawBackgroundGradient: theGradient inPath: backgroundPath angle: 270.0f];
    //
    frame = NSInsetRect(frame, 0.5, 0.5);

    NSLog(@"self.isEnabled = %d", self.isEnabled);

    if (!self.isEnabled) {
        NSLog(@"drawing disabled");
        [NSBezierPath drawBezierPathWithRect: frame options: disabledPathOptions];
    } else if (self.isHighlighted) {
        //        [NSBezierPath drawBezierPathWithRect: frame options: highlightedPathOptions];
    } else {
        //        [NSBezierPath drawBezierPathWithRect: frame options: pathOptions];

    }
}

- (void) drawHighlight: (NSGraphicsContext *) context frame: (NSRect) frame {
    [context saveGraphicsState];
    [[NSBezierPath bezierPathWithRoundedRect: NSInsetRect(frame, 2.0f, 2.0f) xRadius: pathOptions.cornerRadius yRadius: pathOptions.cornerRadius] setClip];
    [self.highlightedColor setFill];
    NSRectFillUsingOperation(frame, NSCompositeSourceOver);
    [context restoreGraphicsState];
}



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

- (void) setHighlightedColor: (NSColor *) highlightedColor {
    highlightedPathOptions.backgroundColor = highlightedColor;
}

- (NSColor *) highlightedColor {
    return highlightedPathOptions.backgroundColor;
}

- (NSColor *) innerStrokeColor {
    return innerStrokeOptions.borderColor;
}

- (void) setInnerStrokeColor: (NSColor *) innerStrokeColor {
    innerStrokeOptions.borderColor = innerStrokeColor;
}


@end