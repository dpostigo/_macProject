//
//  PathOptions.m
//  Carts
//
//  Created by Daniela Postigo on 7/3/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "PathOptions.h"
#import "NSBezierPath+DPUtils.h"
#import "PathOptions+Utils.h"

@implementation PathOptions

@synthesize fills;
@synthesize borderOptions;
@synthesize cornerProperties;

@synthesize innerPathOptions;
@synthesize innerShadow;
@synthesize outerShadow;

@dynamic backgroundColor;
@dynamic gradient;
@dynamic cornerRadius;
@dynamic cornerType;
@dynamic borderWidth;
@dynamic borderColor;
@dynamic borderType;

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
        self.backgroundColor = [NSColor clearColor];
        self.cornerType = CornerNone;
    }

    return self;
}


- (void) objectInit {
    [super objectInit];
    borderOptions = [[NSMutableArray alloc] initWithObjects: [[BorderOption alloc] init], nil];
    cornerProperties = [[CornerProperties alloc] init];
    fills = [[NSMutableArray alloc] initWithObjects: [[BasicFill alloc] init], nil];

    [surrogates addObject: self.fill];
    [surrogates addObject: self.cornerProperties];
    [surrogates addObject: self.borderOption];
}




#pragma mark Getters / Setters


- (void) setBorderOption: (BorderOption *) borderOption1 {
    [borderOptions replaceObjectAtIndex: 0 withObject: borderOption1];
}

- (BorderOption *) borderOption {
    BorderOption *ret = [borderOptions objectAtIndex: 0];
    return ret;
}


- (void) setFill: (BasicFill *) fill1 {
    [self.fills replaceObjectAtIndex: 0 withObject: fill1];
}

- (BasicFill *) fill {
    return [self.fills objectAtIndex: 0];
}


#pragma mark Getters only

- (NSShadow *) innerShadow {
    if (innerShadow == nil) {
        innerShadow = [[NSShadow alloc] init];
        innerShadow.shadowColor = [NSColor clearColor];
    }
    return innerShadow;
}




#pragma mark Drawing

- (void) drawWithRect: (NSRect) rect {
    //    rect = [self rectForPathOptions: rect];

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
        border.name = self.name;

        NSRect borderRect = NSInsetRect(rect, borderInset, borderInset);

        if ([self.name isEqualToString: @"NewBasicButtonCell"]) {
//            NSLog(@"rect = %@, borderRect = %@", NSStringFromRect(rect), NSStringFromRect(borderRect));
        }
        [border drawWithRect: borderRect];

        rect = borderRect;
        borderInset += border.borderWidth;
    }
}

- (void) drawShadowWithRect: (NSRect) rect {
    rect = NSInsetRect(rect, -0.5, -0.5);
    NSBezierPath *shadowPath = [NSBezierPath shadowBezierPathWithRect: rect pathOptions: self];

    [NSGraphicsContext saveGraphicsState];

    [[NSGraphicsContext currentContext] setCompositingOperation: NSCompositeSourceOver];
//    [shadowPath setClip];
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