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


@synthesize gradient;
@synthesize horizontalGradient;
@synthesize backgroundColor;

@synthesize cornerRadius;
@synthesize cornerOptions;
@synthesize borderColor;
@synthesize borderWidth;

@synthesize innerShadow;


@synthesize outerShadow;

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

- (id) initWithGradient: (NSGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth
           cornerRadius: (CGFloat) aCornerRadius cornerOptions: (NSBezierPathCornerOptions) aCornerOptions {
    self = [super init];
    if (self) {
        //        if (aGradient == nil) aGradient = [[NSGradient alloc] initWithColors: [NSArray arrayWithObject: [NSColor clearColor]]];
        if (aBorderColor == nil) aBorderColor = [NSColor clearColor];
        self.backgroundColor = [NSColor whiteColor];
        self.gradient        = aGradient;
        self.borderColor     = aBorderColor;
        self.borderWidth     = aBorderWidth;
        self.cornerRadius    = aCornerRadius;
        self.cornerOptions   = aCornerOptions;
    }

    return self;
}

+ (id) optionsWithGradient: (NSGradient *) gradient {
    return [[self alloc] initWithGradient: gradient];
}


- (void) draw {

}

- (id) copy {

    PathOptions *copy = [[PathOptions alloc] init];
    copy.backgroundColor = self.backgroundColor;
    return [super copy];
}

@end