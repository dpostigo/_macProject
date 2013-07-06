//
//  PathOptions.m
//  Carts
//
//  Created by Daniela Postigo on 7/3/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "PathOptions.h"


@implementation PathOptions {

}


@synthesize backgroundColor;
@synthesize cornerRadius;
@synthesize cornerOptions;
@synthesize gradient;
@synthesize horizontalGradient;
@synthesize innerShadow;
@synthesize outerShadow;


@synthesize borderOption;

@synthesize borderOptions;

- (id) initWithGradient: (NSGradient *) aGradient {
    return [self initWithGradient: aGradient borderColor: nil borderWidth: 0 cornerRadius: 0 cornerOptions: 0];
}

- (id) initWithGradient: (NSGradient *) aGradient borderColor: (NSColor *) aBorderColor {
    return [self initWithGradient: aGradient borderColor: aBorderColor borderWidth: 0 cornerRadius: 0 cornerOptions: 0];
}

- (id) initWithGradient: (NSGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth {
    return [self initWithGradient: aGradient borderColor: aBorderColor borderWidth: aBorderWidth cornerRadius: 0 cornerOptions: 0];
}

- (id) initWithGradient: (NSGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth cornerRadius: (CGFloat) aCornerRadius {
    return [self initWithGradient: aGradient borderColor: aBorderColor borderWidth: aBorderWidth cornerRadius: aCornerRadius cornerOptions: 0];
}

- (id) initWithGradient: (NSGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth cornerRadius: (CGFloat) aCornerRadius cornerOptions: (NSBezierPathCornerOptions) aCornerOptions {
    self = [super init];
    if (self) {
        //        if (aGradient == nil) aGradient = [[NSGradient alloc] initWithColors: [NSArray arrayWithObject: [NSColor clearColor]]];
        if (aBorderColor == nil) aBorderColor = [NSColor clearColor];
        self.backgroundColor = [NSColor whiteColor];
        self.borderOption = [[BorderOption alloc] initWithBorderColor: aBorderColor borderWidth: aBorderWidth];

        self.gradient = aGradient;
        self.cornerRadius = aCornerRadius;
        self.cornerOptions = aCornerOptions;
    }

    return self;
}


- (id) init {
    self = [super init];
    if (self) {
        self.borderOption = [[BorderOption alloc] init];
    }

    return self;
}

- (void) draw {

}


#pragma mark Getters / Setters

- (NSColor *) borderColor {
    return borderOption.borderColor;
}

- (void) setBorderColor: (NSColor *) borderColor1 {
    borderOption.borderColor = borderColor1;
}

- (CGFloat) borderWidth {
    return borderOption.borderWidth;
}

- (void) setBorderWidth: (CGFloat) aBorderWidth {
    borderOption.borderWidth = aBorderWidth;
}

- (BorderType) borderType {
    return borderOption.borderType;
}

- (void) setBorderType: (BorderType) aType {
    borderOption.borderType = aType;
}


- (NSArray *) borderOptions {
    if (borderOptions == nil) return [NSArray arrayWithObject: borderOption];
    return [[NSArray arrayWithObject: borderOption] arrayByAddingObjectsFromArray: borderOptions];
}



#pragma mark Copy
- (id) copy {
    PathOptions *copy = [[PathOptions alloc] init];
    copy.backgroundColor = self.backgroundColor;
    copy.borderOption = self.borderOption;
    copy.cornerRadius = self.cornerRadius;
    copy.cornerOptions = self.cornerOptions;
    copy.gradient = self.gradient;
    copy.horizontalGradient = self.horizontalGradient;
    copy.innerShadow = self.innerShadow;
    copy.outerShadow = self.outerShadow;
    return copy;
}

@end