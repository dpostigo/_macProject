//
//  BasicBackgroundView.m
//  Carts
//
//  Created by Daniela Postigo on 7/4/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicBackgroundView.h"


@implementation BasicBackgroundView {

}


@synthesize pathOptions;

- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {
        [self setup];
    }

    return self;
}

- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {
        [self setup];
    }

    return self;
}


- (void) setup {
    pathOptions = [[PathOptions alloc] init];
    pathOptions.cornerRadius = 0.0;
    pathOptions.borderWidth = 0.5;
    pathOptions.borderColor = [NSColor lightGrayColor];
    pathOptions.cornerOptions = NSBezierPathLowerLeft | NSBezierPathLowerRight | NSBezierPathUpperRight | NSBezierPathUpperLeft;
    pathOptions.backgroundColor = [NSColor colorWithDeviceWhite: 0.9 alpha: 1.0];

    pathOptions.innerShadow = [[NSShadow alloc] init];
    pathOptions.innerShadow.shadowColor = [NSColor darkGrayColor];
    pathOptions.innerShadow.shadowBlurRadius = 3;

}


- (void) drawRect: (NSRect) rect {
    //    [[NSColor clearColor] set];
    //    NSRectFill(rect);

    [NSBezierPath drawBezierPathWithRect: rect options: pathOptions];
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

- (NSShadow *) outerShadow {
    return pathOptions.outerShadow;
}

- (void) setOuterShadow: (NSShadow *) outerShadow {
    pathOptions.outerShadow = outerShadow;
}


//- (NSColor *) innerBorderColor {
//    return innerPathOptions.borderColor;
//}
//
//- (void) setInnerBorderColor: (NSColor *) innerBorderColor1 {
//    innerPathOptions.borderColor = innerBorderColor1;
//}


@end