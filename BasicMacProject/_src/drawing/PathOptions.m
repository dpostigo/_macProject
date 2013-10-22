//
//  PathOptions.m
//  Carts
//
//  Created by Daniela Postigo on 7/3/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "PathOptions.h"
#import "BasicGradient.h"
#import "NSBezierPath+DPUtils.h"

@implementation PathOptions {

}

@synthesize innerShadow;
@synthesize outerShadow;

@synthesize borderOptions;
@synthesize innerPathOptions;

@synthesize cornerProperties;

@synthesize fills;

- (id) initWithGradient: (BasicGradient *) aGradient {
    return [self initWithGradient: aGradient borderColor: nil borderWidth: 0 cornerRadius: 0 cornerOptions: 0];
}

- (id) initWithGradient: (BasicGradient *) aGradient borderColor: (NSColor *) aBorderColor {
    return [self initWithGradient: aGradient borderColor: aBorderColor borderWidth: 0 cornerRadius: 0 cornerOptions: 0];
}

- (id) initWithGradient: (BasicGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth {
    return [self initWithGradient: aGradient borderColor: aBorderColor borderWidth: aBorderWidth cornerRadius: 0 cornerOptions: 0];
}

- (id) initWithGradient: (BasicGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth cornerRadius: (CGFloat) aCornerRadius {
    return [self initWithGradient: aGradient borderColor: aBorderColor borderWidth: aBorderWidth cornerRadius: aCornerRadius cornerOptions: 0];
}

- (id) initWithGradient: (BasicGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth cornerRadius: (CGFloat) aCornerRadius cornerOptions: (CornerType) aCornerOptions {
    self = [super init];
    if (self) {

        self.cornerProperties = [[CornerProperties alloc] init];
        //        if (aGradient == nil) aGradient = [[NSGradient alloc] initWithColors: [NSArray arrayWithObject: [NSColor clearColor]]];
        self.borderOption = [[BorderOption alloc] initWithBorderColor: (aBorderColor == nil ? [NSColor clearColor] : aBorderColor) borderWidth: aBorderWidth];
        self.borderOption.corners = self.cornerProperties;
        self.gradient = aGradient;
        self.cornerRadius = aCornerRadius;
        self.cornerType = aCornerOptions;
    }

    return self;
}


- (id) init {
    self = [super init];
    if (self) {
        self.cornerProperties = [[CornerProperties alloc] init];
        self.borderOptions = [[NSMutableArray alloc] initWithObjects: [[BorderOption alloc] init], nil];
        self.backgroundColor = [NSColor clearColor];
        self.cornerType = CornerNone;
    }

    return self;
}



#pragma mark Drawing

- (void) drawWithRect: (NSRect) rect {

    NSBezierPath *path = [NSBezierPath bezierPathWithRect: rect pathOptions: self];
    [self drawFillsWithPath: path];
    [self drawBordersWithRect: rect];

    if (innerShadow && ![innerShadow.shadowColor isEqualTo: [NSColor clearColor]]) {
        [self drawShadowWithRect: rect];
    }

}

- (void) drawFillsWithPath: (NSBezierPath *) path {
    for (int j = 0; j < [self.fills count]; j++) {
        BasicFill *fillOption = [self.fills objectAtIndex: j];
        [fillOption drawWithPath: path];
    }
}

- (void) drawBordersWithRect: (NSRect) rect {
    CGFloat borderInset = 0;
    for (int j = 0; j < [borderOptions count]; j++) {
        BorderOption *border = [borderOptions objectAtIndex: j];
        border.corners = self.cornerProperties;

        borderInset += (border.borderWidth);
        NSRect borderRect = NSInsetRect(rect, borderInset, borderInset);
        [border drawWithRect: borderRect];
        rect = borderRect;
    }
}

- (void) drawShadowWithRect: (NSRect) rect {
    NSBezierPath *shadowPath = [NSBezierPath shadowBezierPathWithRect: rect pathOptions: self];

    [NSGraphicsContext saveGraphicsState];

    [[NSGraphicsContext currentContext] setCompositingOperation: NSCompositeSourceOver];
    [shadowPath setClip];
    [shadowPath setLineWidth: 0.5];
    [shadowPath setLineCapStyle: NSRoundLineCapStyle];
    [shadowPath setLineJoinStyle: NSBevelLineJoinStyle];

    [[NSColor clearColor] set];
    [self.innerShadow set];

    [self.innerShadow.shadowColor setStroke];
    [shadowPath fill];
    [shadowPath stroke];

    [NSGraphicsContext restoreGraphicsState];

}

#pragma mark Setters

- (void) setBackgroundColor: (NSColor *) backgroundColor1 {
    self.fill.color = backgroundColor1;
}

- (void) setGradient: (BasicGradient *) gradient1 {
    self.fill.gradient = gradient1;
    if (self.backgroundColor == nil) {
        self.backgroundColor = self.gradient.bottomColor;
    }
}

- (void) setBorderOption: (BorderOption *) borderOption1 {
    [borderOptions replaceObjectAtIndex: 0 withObject: borderOption1];
}

- (void) setBorderColor: (NSColor *) borderColor1 {
    self.borderOption.borderColor = borderColor1;
    if (![self.borderOption.borderColor isEqualTo: [NSColor clearColor]]) {
        self.borderOption.borderWidth = 0.5;
    }
}

- (void) setBorderWidth: (CGFloat) aBorderWidth {
    self.borderOption.borderWidth = aBorderWidth;
}

- (void) setBorderType: (BorderType) aType {
    self.borderOption.borderType = aType;
}

- (void) setCornerRadius: (CGFloat) cornerRadius1 {
    self.cornerProperties.cornerRadius = cornerRadius1;
}

- (void) setCornerType: (CornerType) cornerOptions1 {
    self.cornerProperties.type = cornerOptions1;
}

- (void) setFill: (BasicFill *) fill1 {
    [self.fills replaceObjectAtIndex: 0 withObject: fill1];
}



#pragma mark Getters


- (BasicFill *) fill {
    return [self.fills objectAtIndex: 0];
}

- (NSMutableArray *) fills {
    if (fills == nil) {
        fills = [[NSMutableArray alloc] initWithObjects: [[BasicFill alloc] init], nil];
    }
    return fills;
}


- (BasicGradient *) gradient {
    return self.fill.gradient;
}

- (NSColor *) backgroundColor {
    return self.fill.color;
}


- (BorderOption *) borderOption {
    return [borderOptions objectAtIndex: 0];
}

- (NSColor *) borderColor {
    return self.borderOption.borderColor;
}

- (CGFloat) borderWidth {
    return self.borderOption.borderWidth;
}

- (BorderType) borderType {
    return self.borderOption.borderType;
}

- (CGFloat) cornerRadius {
    return self.cornerProperties.cornerRadius;
}

- (CornerType) cornerType {
    return self.cornerProperties.type;
}

- (NSShadow *) innerShadow {
    if (innerShadow == nil) {
        innerShadow = [[NSShadow alloc] init];
        innerShadow.shadowColor = [NSColor clearColor];
    }
    return innerShadow;
}



#pragma mark Copy
- (id) copy {
    PathOptions *copy = [[PathOptions alloc] init];
    copy.backgroundColor = [self.backgroundColor copy];
    copy.borderOption = [self.borderOption copy];
    copy.cornerRadius = self.cornerRadius;
    copy.cornerType = self.cornerType;
    copy.gradient = self.gradient;
    copy.innerShadow = [self.innerShadow copy];
    copy.outerShadow = [self.outerShadow copy];
    return copy;
}
//
//- (id) copyWithZone: (NSZone *) zone {
//    return nil;
//}




#pragma mark Helpers


@end