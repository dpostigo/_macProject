//
//  BorderOption.m
//  Carts
//
//  Created by Daniela Postigo on 7/5/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BorderOption.h"
#import "NSBezierPath+DPUtils.h"

@implementation BorderOption {

}

@synthesize fill;
@synthesize borderWidth;
@synthesize borderType;
@synthesize corners;

+ (BorderOption *) topBorderWithGradient: (BasicGradient *) aGradient borderWidth: (CGFloat) aWidth {
    return [[self alloc] initWithGradient: aGradient borderWidth: aWidth type: BorderTypeTop];
}

- (id) initWithGradient: (BasicGradient *) aGradient borderWidth: (CGFloat) aWidth type: (BorderType) aType {
    return [self initWithGradient: aGradient borderColor: nil borderWidth: aWidth type: aType];
}

- (id) initWithBorderWidth: (CGFloat) aWidth {
    return [self initWithBorderColor: [NSColor clearColor] borderWidth: aWidth type: BorderTypeAll];
}

- (id) initWithBorderColor: (NSColor *) aColor borderWidth: (CGFloat) aWidth {
    return [self initWithBorderColor: aColor borderWidth: aWidth type: (BorderType) 0];
}

- (id) initWithBorderColor: (NSColor *) aColor borderWidth: (CGFloat) aWidth type: (BorderType) aType {
    return [self initWithGradient: nil borderColor: aColor borderWidth: aWidth type: aType];
}


- (id) initWithGradient: (BasicGradient *) aGradient borderColor: (NSColor *) aColor borderWidth: (CGFloat) aWidth type: (BorderType) aType {
    self = [super init];
    if (self) {
        self.fill.gradient = aGradient;
        self.borderColor = aColor;
        self.borderWidth = aWidth;
        self.borderType = aType;
    }
    return self;
}


- (id) init {
    self = [super init];
    if (self) {
        self.borderType = BorderTypeAll;
        self.fill = [[BasicFill alloc] init];
    }
    return self;
}


- (id) copy {
    BorderOption *borderOption = [[BorderOption alloc] init];
    borderOption.borderColor = [self.borderColor copy];
    borderOption.borderWidth = self.borderWidth;
    borderOption.borderType = self.borderType;
    return borderOption;
}


#pragma mark Getters

- (BOOL) isVertical {
    return (self.borderType & BorderTypeLeft) || (self.borderType & BorderTypeRight);
}

- (CGFloat) cornerRadius {
    return self.corners.cornerRadius;
}

- (CornerType) cornerType {
    return self.corners.type;
}

- (NSColor *) borderColor {
    return self.fill.color;
}

- (BasicFill *) fill {
    if (fill == nil) fill = [[BasicFill alloc] init];
    return fill;
}



#pragma mark Setters

- (void) setBorderColor: (NSColor *) borderColor {
    self.fill.color = borderColor;
}


- (void) setCornerRadius: (CGFloat) cornerRadius {
    self.corners.cornerRadius = cornerRadius;
}

- (void) setCornerType: (CornerType) cornerType {
    self.corners.type = cornerType;
}


#pragma mark Drawing

- (void) drawWithRect: (NSRect) rect {
    if (self.borderWidth > 0) {
        if (self.fill.isGradient) {
            [self drawGradientWithRect: rect];
        } else if (![self.fill.color isEqualTo: [NSColor clearColor]]) {
            [self drawColorWithRect: rect];
        }
    }

}

- (void) drawGradientWithRect: (NSRect) rect {
    NSBezierPath *path = [self rectBezierPathWithRect: NSInsetRect(rect, self.borderWidth, self.borderWidth)];
    [self.fill.gradient drawInBezierPath: path angle: self.fill.gradient.angle];
}

- (void) drawColorWithRect: (NSRect) rect {
    NSBezierPath *path = [self lineBezierPathWithRect: rect];
    [self drawWithPath: path];
}


- (void) drawWithPath: (NSBezierPath *) path {
    [NSGraphicsContext saveGraphicsState];
    [self.borderColor setStroke];
    [path setLineWidth: borderWidth];
    [path setLineCapStyle: NSRoundLineCapStyle];
    [path setLineJoinStyle: NSBevelLineJoinStyle];
    [path stroke];
    [NSGraphicsContext restoreGraphicsState];
}


#pragma mark NSBezierPath


- (NSBezierPath *) rectBezierPathWithRect: (NSRect) rect {
    NSBezierPath *path = [NSBezierPath bezierPath];

    CGFloat xOffset = rect.origin.x;
    CGFloat yOffset = rect.origin.y;

    if ((self.borderType & BorderTypeAll) || (self.borderType & BorderTypeTop)) {
        [path appendBezierPathWithRect: NSMakeRect(rect.origin.x + self.cornerRadius, rect.size.height + yOffset, rect.size.width + xOffset - (self.cornerRadius * 2), self.borderWidth)];
    }
    if ((self.borderType & BorderTypeAll) || (self.borderType & BorderTypeBottom)) {
        [path appendBezierPathWithRect: NSMakeRect(0 + xOffset + self.cornerRadius, 0 + yOffset, rect.size.width + xOffset - self.cornerRadius, 0 + yOffset)];
    }
    if ((self.borderType & BorderTypeAll) || (self.borderType & BorderTypeLeft)) {
        [path appendBezierPathWithRect: NSMakeRect(0 + xOffset, 0 + yOffset, 0 + xOffset, rect.size.height + yOffset)];
    }
    if ((self.borderType & BorderTypeAll) || self.borderType & BorderTypeRight) {
        [path appendBezierPathWithRect: NSMakeRect(rect.size.width + xOffset, 0 + yOffset, rect.size.width + xOffset, rect.size.height + yOffset)];
    }
    [path closePath];

    return path;

}


- (NSBezierPath *) lineBezierPathWithRect: (NSRect) rect {
    NSBezierPath *path = [NSBezierPath bezierPath];

    CGFloat xOffset = rect.origin.x;
    CGFloat yOffset = rect.origin.y;

    if (self.borderType & BorderTypeAll) {
        path = [NSBezierPath bezierPathWithRect: rect cornerRadius: self.cornerRadius cornerType: self.cornerType];
    } else {

        if (self.borderType & BorderTypeTop) {
            [path moveToPoint: NSMakePoint(rect.origin.x + self.cornerRadius, rect.size.height + yOffset)];
            [path lineToPoint: NSMakePoint(rect.size.width + xOffset - self.cornerRadius, rect.size.height + yOffset)];
        }
        if (self.borderType & BorderTypeBottom) {
            [path moveToPoint: NSMakePoint(0 + xOffset + self.cornerRadius, 0 + yOffset)];
            [path lineToPoint: NSMakePoint(rect.size.width + xOffset - self.cornerRadius, 0 + yOffset)];
        }
        if (self.borderType & BorderTypeLeft) {
            NSLog(@"Left.");
            [path moveToPoint: NSMakePoint(0 + xOffset, 0 + yOffset)];
            [path lineToPoint: NSMakePoint(0 + xOffset, rect.size.height + yOffset)];
        }
        if (self.borderType & BorderTypeRight) {
            [path moveToPoint: NSMakePoint(rect.size.width + xOffset, 0 + yOffset)];
            [path lineToPoint: NSMakePoint(rect.size.width + xOffset, rect.size.height + yOffset)];
        }
        [path closePath];

    }

    return path;
}


#pragma mark Helpers


- (NSString *) borderTypeString {
    return [self stringFromBorderType: self.borderType];
}

- (NSString *) stringFromBorderType: (BorderType) aType {

    NSMutableArray *types = [[NSMutableArray alloc] init];
    if (aType & BorderTypeTop) {
        [types addObject: @"BorderTypeTop"];
    }
    if (aType & BorderTypeBottom) {
        [types addObject: @"BorderTypeBottom"];
    }

    if (aType & BorderTypeLeft) {
        [types addObject: @"BorderTypeLeft"];
    }

    if (aType & BorderTypeRight) {
        [types addObject: @"BorderTypeRight"];
    }

    if ([types count] == 0) [types addObject: @"BorderTypeAll"];

    NSString *ret = [types componentsJoinedByString: @", "];
    return ret;

}


@end