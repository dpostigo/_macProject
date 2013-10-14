//
//  BasicDisplayView.m
//  Carts
//
//  Created by Daniela Postigo on 7/4/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicDisplayView.h"
#import "NSBezierPath+Additions.h"

@implementation BasicDisplayView

@synthesize pathOptions;

- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {[self setup];}
    return self;
}

- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {[self setup];}
    return self;
}


#pragma mark Methods

- (void) addGradient: (BasicGradient *) aGradient {
    [self addFill: [[BasicFill alloc] initWithGradient: aGradient]];
}

- (void) removeGradient: (BasicGradient *) aGradient {
    [self removeFill: [self fillForGradient: aGradient]];
}

- (void) addFill: (BasicFill *) aFill {
    [self.fills addObject: aFill];
}

- (void) removeFill: (BasicFill *) aFill {
    if (aFill) [self.fills removeObject: aFill];
}

- (void) addBorder: (BorderOption *) aBorder {
    [self.borderOptions addObject: aBorder];
}

- (void) setBorderWidth: (CGFloat) aBorderWidth borderColor: (NSColor *) aBorderColor {
    self.borderWidth = aBorderWidth;
    self.borderColor = aBorderColor;
}

#pragma mark NSView overrides

- (BOOL) preservesContentDuringLiveResize {
    return YES;
}

- (BOOL) isOpaque {
    return YES;
}


#pragma mark Getters

- (NSMutableArray *) fills {
    return pathOptions.fills;
}

- (NSColor *) backgroundColor {
    return pathOptions.backgroundColor;
}

- (NSColor *) borderColor {
    return pathOptions.borderColor;
}


- (BorderType) borderType {
    return pathOptions.borderType;
}


- (CGFloat) borderWidth {
    return pathOptions.borderWidth;
}

- (NSMutableArray *) borderOptions {
    return pathOptions.borderOptions;
}

- (CornerType) cornerOptions {
    return pathOptions.cornerType;
}

- (CGFloat) cornerRadius {
    return pathOptions.cornerRadius;
}

- (BasicGradient *) gradient {
    return pathOptions.gradient;
}

- (NSShadow *) innerShadow {
    return pathOptions.innerShadow;
}

- (NSShadow *) outerShadow {
    return pathOptions.outerShadow;
}



#pragma mark Getters / Setters

- (void) setCornerOptions: (CornerType) cornerOptions1 {
    pathOptions.cornerType = cornerOptions1;
}


- (void) setCornerRadius: (CGFloat) cornerRadius1 {
    pathOptions.cornerRadius = cornerRadius1;
}


- (void) setBorderColor: (NSColor *) borderColor1 {
    pathOptions.borderColor = borderColor1;
}

- (void) setBorderWidth: (CGFloat) borderWidth1 {
    pathOptions.borderWidth = borderWidth1;
}

- (void) setBorderType: (BorderType) borderType {
    pathOptions.borderType = borderType;

}


- (void) setBorderOptions: (NSMutableArray *) borderOptions {
    pathOptions.borderOptions = borderOptions;
}

- (void) setGradient: (BasicGradient *) gradient1 {
    pathOptions.gradient = gradient1;
}

- (void) setBackgroundColor: (NSColor *) backgroundColor {
    pathOptions.backgroundColor = backgroundColor;
}


- (void) setInnerShadow: (NSShadow *) innerShadow {
    pathOptions.innerShadow = innerShadow;
}


- (void) setOuterShadow: (NSShadow *) outerShadow {
    pathOptions.outerShadow = outerShadow;
}





#pragma mark BasicDisplayView

- (void) setup {
    pathOptions = [[PathOptions alloc] init];
    pathOptions.cornerRadius = 0.0;
    pathOptions.borderWidth = 0.0;
    pathOptions.borderColor = [NSColor lightGrayColor];
    pathOptions.cornerType = CornerNone;
    pathOptions.backgroundColor = [NSColor colorWithDeviceWhite: 0.9 alpha: 1.0];

}

- (void) drawRect: (NSRect) dirtyRect {
    [[NSColor clearColor] set];
    NSRectFill(self.bounds);

    [pathOptions drawWithRect: self.bounds];
}



#pragma mark View overrides

- (void) viewDidMoveToWindow {
    [super viewDidMoveToWindow];

    if (customWindow) {
        self.cornerRadius = customWindow.windowFrame.cornerRadius - 1;
    }
}


#pragma mark Helpers

- (BasicFill *) fillForGradient: (BasicGradient *) aGradient {
    BasicFill *ret = nil;
    for (int j = 0; j < [self.fills count]; j++) {
        BasicFill *aFill = [self.fills objectAtIndex: j];
        if (aFill.gradient == aGradient) {
            ret = aFill;
            break;
        }
    }
    return ret;
}

@end