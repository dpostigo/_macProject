//
//  BasicFill.h
//  Carts
//
//  Created by Daniela Postigo on 10/3/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicDrawing.h"

@class BasicGradient;

@interface BasicFill : BasicDrawing {
    BasicGradient *gradient;
    NSColor *backgroundColor;

}

@property(nonatomic, strong) NSColor *backgroundColor;
@property(nonatomic, strong) BasicGradient *gradient;
- (id) initWithGradient: (BasicGradient *) gradient;
- (BOOL) isGradient;
- (BOOL) isColor;
- (void) drawWithPath: (NSBezierPath *) path;
- (void) drawGradientWithPath: (NSBezierPath *) path;
- (void) drawColorWithPath: (NSBezierPath *) path;
- (void) drawBorderWithPath: (NSBezierPath *) path borderWidth: (CGFloat) aWidth;
- (void) drawWithRect: (NSRect) rect;
- (id) initWithColor: (NSColor *) color;
+ (id) fillWithColor: (NSColor *) color;

+ (id) fillWithGradient: (BasicGradient *) gradient;

@end