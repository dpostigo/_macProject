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

@synthesize backgroundColor;
@synthesize gradient;
@synthesize horizontalGradient;
@synthesize innerShadow;
@synthesize outerShadow;

@synthesize borderOptions;
@synthesize innerPathOptions;

@synthesize cornerProperties;

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

#pragma mark Setters



- (void) setGradient: (BasicGradient *) gradient1 {
    gradient = gradient1;
    if (backgroundColor == nil) {
        self.backgroundColor = gradient.bottomColor;
    }
}

- (void) setBorderOption: (BorderOption *) borderOption1 {
    [borderOptions replaceObjectAtIndex: 0 withObject: borderOption1];
}

- (void) setBorderColor: (NSColor *) borderColor1 {
    self.borderOption.borderColor = borderColor1;
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


#pragma mark Getters


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




#pragma mark Copy
- (id) copy {
    PathOptions *copy = [[PathOptions alloc] init];
    copy.backgroundColor = [self.backgroundColor copy];
    copy.borderOption = [self.borderOption copy];
    copy.cornerRadius = self.cornerRadius;
    copy.cornerType = self.cornerType;
    copy.gradient = self.gradient;
    copy.horizontalGradient = self.horizontalGradient;
    copy.innerShadow = [self.innerShadow copy];
    copy.outerShadow = [self.outerShadow copy];
    return copy;
}
//
//- (id) copyWithZone: (NSZone *) zone {
//    return nil;
//}



#pragma mark Drawing

- (void) drawWithRect: (NSRect) rect {

    NSBezierPath *path = [NSBezierPath bezierPathWithRect: rect pathOptions: self];

    if (self.gradient == nil) [path drawWithFill: self.backgroundColor];
    else [self.gradient drawInBezierPath: path angle: 90];

    if (self.horizontalGradient != nil) [self.horizontalGradient drawInBezierPath: path angle: 0];
    if (self.innerShadow != nil) [path drawShadow: self.innerShadow];

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


#pragma mark Helpers


@end