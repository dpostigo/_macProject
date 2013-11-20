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
#import "BasicShadow.h"
#import "BasicShadow+Utils.h"

@implementation PathOptions

@synthesize fills;
@synthesize borders;
@synthesize cornerProperties;

@synthesize innerPathOptions;

@dynamic backgroundColor;
@dynamic gradient;
@dynamic cornerRadius;
@dynamic cornerType;
@dynamic borderWidth;
@dynamic borderColor;
@dynamic borderType;

@synthesize shadows;

@synthesize debug;

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

    fills = [[NSMutableArray alloc] initWithObjects: [[BasicFill alloc] init], nil];
    borders = [[NSMutableArray alloc] initWithObjects: [[BorderOption alloc] init], nil];
    shadows = [[NSMutableArray alloc] init];
    cornerProperties = [[CornerProperties alloc] init];

    [surrogates addObject: self.fill];
    [surrogates addObject: self.cornerProperties];
    [surrogates addObject: self.borderOption];
}




#pragma mark Getters / Setters


- (void) setBorderOption: (BorderOption *) borderOption1 {
    [borders replaceObjectAtIndex: 0 withObject: borderOption1];
}

- (BorderOption *) borderOption {
    BorderOption *ret = [borders objectAtIndex: 0];
    return ret;
}


- (void) setFill: (BasicFill *) fill1 {
    [self.fills replaceObjectAtIndex: 0 withObject: fill1];
}

- (BasicFill *) fill {
    return [self.fills objectAtIndex: 0];
}


- (void) setInnerShadow: (NSShadow *) innerShadow1 {

    BasicShadow *basicShadow = [BasicShadow basicShadowFromShadow: innerShadow1];
    basicShadow.shadowType = ShadowTypeInner;

    if (innerShadow != nil) {
        NSUInteger index = [self.shadows indexOfObject: innerShadow];
        [self.shadows removeObject: innerShadow];
        innerShadow = basicShadow;
        [self.shadows insertObject: innerShadow atIndex: index];

    } else {
        innerShadow = basicShadow;
        [self.shadows addObject: innerShadow];
    }
}


- (void) setOuterShadow: (NSShadow *) outerShadow1 {

    BasicShadow *basicShadow = [BasicShadow basicShadowFromShadow: outerShadow1];
    basicShadow.shadowType = ShadowTypeOuter;

    if (outerShadow != nil) {
        NSUInteger index = [self.shadows indexOfObject: outerShadow];
        [self.shadows removeObject: outerShadow];
        outerShadow = basicShadow;
        [self.shadows insertObject: outerShadow atIndex: index];

    } else {
        outerShadow = basicShadow;
        [self.shadows addObject: outerShadow];
    }
}


- (BasicShadow *) innerShadow {
    return self.basicInnerShadow;
}


- (NSShadow *) outerShadow {
    return self.basicOuterShadow;
}

- (void) setShadow: (NSShadow *) shadow1 {
    BasicShadow *basicShadow = [BasicShadow basicShadowFromShadow: shadow1];
    basicShadow.shadowType = ShadowTypeOuter;

    if ([self.shadows count] > 0) [self.shadows removeObject: [self.shadows objectAtIndex: 0]];
    [self.shadows addObject: basicShadow];

}


- (NSShadow *) shadow {
    return self.basicShadow;
}


#pragma mark Getters only


- (BasicShadow *) basicInnerShadow {
    if (innerShadow == nil) {
        innerShadow = [[BasicShadow alloc] init];
        innerShadow.shadowType = ShadowTypeInner;
        [self.shadows addObject: innerShadow];
    }
    return innerShadow;
}


- (BasicShadow *) basicOuterShadow {
    if (outerShadow == nil) {
        outerShadow = [[BasicShadow alloc] init];
        outerShadow.shadowType = ShadowTypeOuter;
        [self.shadows addObject: outerShadow];
    }
    return outerShadow;
}

- (BasicShadow *) basicShadow {
    if ([shadows count] == 0) [shadows addObject: self.basicOuterShadow];

    BasicShadow *ret = [self.shadows objectAtIndex: 0];
    return ret;
}


- (BOOL) hasOuterShadow {
    return outerShadow != nil;
}



#pragma mark Drawing

- (void) drawWithRect: (NSRect) rect {

    if (debug) {
        NSLog(@"Drawing debug.");
        BOOL drawsFills = NO;
        BOOL drawsBorders = NO;
        BOOL drawsShadows = NO;

        if (drawsFills) [self drawFillsWithRect: rect];
        if (drawsBorders) [self drawBordersWithRect: rect];
        if (drawsShadows) [self drawShadowsWithRect: rect];

    } else {

        /*  Draw fills or gradients */
        [self drawFillsWithRect: rect];

        /*  Draw borders */
        [self drawBordersWithRect: rect];

        /*  Draw shadows */
        [self drawShadowsWithRect: rect];
    }

}


- (void) drawFillsWithRect: (NSRect) rect {
    NSBezierPath *path = [NSBezierPath bezierPathWithRect: rect pathOptions: self];
    [self drawFillsWithPath: path];
}


- (void) drawBordersWithRect: (NSRect) rect {

    CGFloat borderInset = 0;

    for (int j = 0; j < [borders count]; j++) {
        BorderOption *border = [borders objectAtIndex: j];
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


- (void) drawShadowsWithRect: (NSRect) rect {

    //    NSBezierPath *path = [NSBezierPath shadowBezierPathWithRect: rect pathOptions: self];
    NSBezierPath *path = [NSBezierPath bezierPathWithRect: rect pathOptions: self];

    //
    //    [self.shadows makeObjectsPerformSelector: @selector(drawWithPath:) withObject: path];

    //
    //    for (BasicShadow *aShadow in self.shadows) {
    //
    //        if (aShadow.shadowType == ShadowTypeOuter) {
    //
    ////            NSShadow *debugShadow = [[NSShadow alloc] init];
    ////            debugShadow.shadowColor = [NSColor blackColor];
    ////            debugShadow.shadowBlurRadius = 5;
    ////            debugShadow.shadowOffset = NSMakeSize(0, 4);
    //
    //            NSColor *fillColor = [NSColor clearColor];
    //            NSColor *strokeColor = [NSColor blackColor];
    //
    //            [NSGraphicsContext saveGraphicsState];
    //
    //            [fillColor set];
    ////            [strokeColor setStroke];
    //            [aShadow set];
    //
    //            [path fill];
    ////            [path stroke];
    //
    //            [NSGraphicsContext restoreGraphicsState];
    //        }
    //    }



    [self.shadows enumerateObjectsUsingBlock: ^(BasicShadow *aShadow, NSUInteger index, BOOL *stop) {
        NSRect shadowRect = aShadow.shadowType & ShadowTypeInner ? NSInsetRect(rect, -0.5, -0.5) : rect;

        NSBezierPath *shadowPath = [NSBezierPath shadowBezierPathWithRect: rect pathOptions: self];
        [aShadow drawWithPath: shadowPath];
    }];
}


- (void) drawFillsWithPath: (NSBezierPath *) path {
    [self.fills makeObjectsPerformSelector: @selector(drawWithPath:) withObject: path];
}



#pragma mark Copy
- (id) copy {
    PathOptions *copy = [[PathOptions alloc] init];
    copy.backgroundColor = [self.backgroundColor copy];
    copy.borderOption = [self.borderOption copy];
    copy.cornerRadius = self.cornerRadius;
    copy.cornerType = self.cornerType;
    copy.gradient = self.gradient;
    copy.shadows = self.shadows;
    return copy;
}
//
//- (id) copyWithZone: (NSZone *) zone {
//    return nil;
//}




- (void) drawShadowWithRect: (NSRect) rect {

    //    if (innerShadow && ![innerShadow.shadowColor isEqualTo: [NSColor clearColor]]) {
    //
    //        rect = NSInsetRect(rect, -0.5, -0.5);
    //        NSBezierPath *shadowPath = [NSBezierPath shadowBezierPathWithRect: rect pathOptions: self];
    //
    //        [NSGraphicsContext saveGraphicsState];
    //
    //        [[NSGraphicsContext currentContext] setCompositingOperation: NSCompositeSourceOver];
    //        //    [shadowPath setClip];
    //        [shadowPath setLineWidth: 0.5];
    //        [shadowPath setLineCapStyle: NSRoundLineCapStyle];
    //        [shadowPath setLineJoinStyle: NSBevelLineJoinStyle];
    //
    //        [[NSColor clearColor] set];
    //        [self.innerShadow set];
    //
    //        [self.innerShadow.shadowColor setStroke];
    //        [shadowPath fill];
    //        [shadowPath stroke];
    //
    //        [NSGraphicsContext restoreGraphicsState];
    //    }
}



#pragma mark Helpers


@end