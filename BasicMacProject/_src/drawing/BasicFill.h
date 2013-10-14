//
//  BasicFill.h
//  Carts
//
//  Created by Daniela Postigo on 10/3/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicGradient.h"

@interface BasicFill : NSObject {
    BasicGradient *gradient;
    NSColor *color;

}

@property(nonatomic, strong) NSColor *color;
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