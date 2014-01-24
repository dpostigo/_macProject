//
//  BasicGradient.h
//  Carts
//
//  Created by Daniela Postigo on 9/27/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasicGradient : NSGradient {

    BOOL isVertical;
    CGFloat angle;
    NSColor *bottomColor;
    NSColor *topColor;
    NSArray *colors;
}

@property(nonatomic, strong) NSColor *bottomColor;
@property(nonatomic, strong) NSColor *topColor;
@property(nonatomic, strong) NSArray *colors;


@property(nonatomic) CGFloat angle;
@property(nonatomic) BOOL isVertical;

+ (BasicGradient *) whiteShineGradient;
+ (BasicGradient *) whiteShineGradientWithBaseColor: (NSColor *) baseColor;
+ (BasicGradient *) clearGradientWithBaseColor: (NSColor *) baseColor;
+ (BasicGradient *) gradientWithBaseColor: (NSColor *) baseColor centerColor: (NSColor *) centerColor;
- (id) initWithTopColor: (NSColor *) aTopColor bottomColor: (NSColor *) aBottomColor percent: (CGFloat) percentage;
- (id) initWithTopColor: (NSColor *) aTopColor bottomColor: (NSColor *) aBottomColor;
- (id) initWithBaseColor: (NSColor *) baseColor centerColor: (NSColor *) centerColor;
- (instancetype) initWithTopColor: (NSColor *) topColor bottomColor: (NSColor *) bottomColor;
+ (instancetype) gradientWithTopColor: (NSColor *) topColor bottomColor: (NSColor *) bottomColor;

+ (BasicGradient *) gradientWithTopColor: (NSColor *) topColor1 bottomColor: (NSColor *) bottomColor1 percent: (CGFloat) percentage;
@end