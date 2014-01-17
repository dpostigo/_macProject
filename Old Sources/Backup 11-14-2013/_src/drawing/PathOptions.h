//
//  PathOptions.h
//  Carts
//
//  Created by Daniela Postigo on 7/3/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BorderOption.h"
#import "BasicGradient.h"
#import "CornerProperties.h"
#import "SurrogateObject.h"
#import "BasicShadow.h"

@class BasicShadow;

@interface PathOptions : SurrogateObject <NSCopying> {

    BOOL debug;
    NSMutableArray *fills;
    NSMutableArray *borders;
    NSMutableArray *shadows;
    CornerProperties *cornerProperties;

    PathOptions *innerPathOptions;

    BasicShadow *innerShadow;
    BasicShadow *outerShadow;
}


#pragma mark dynamic

@property(nonatomic) BorderType borderType;
@property(nonatomic) CornerType cornerType;
@property(nonatomic) CGFloat cornerRadius;
@property(nonatomic) CGFloat borderWidth;
@property(nonatomic, strong) NSColor *borderColor;
@property(nonatomic, strong) BasicGradient *gradient;
@property(nonatomic, strong) NSColor *backgroundColor;

#pragma mark Pointers



#pragma mark Synthesized

@property(nonatomic, strong) BasicFill *fill;
@property(nonatomic, strong) NSMutableArray *fills;

@property(nonatomic, strong) BorderOption *borderOption;
@property(nonatomic, strong) NSMutableArray *borders;

@property(nonatomic, strong) NSMutableArray *shadows;

@property(nonatomic, strong) CornerProperties *cornerProperties;


@property(nonatomic, strong) PathOptions *innerPathOptions;

@property(nonatomic, strong) NSShadow *innerShadow;
@property(nonatomic, strong) NSShadow *outerShadow;
@property(nonatomic, strong) NSShadow *shadow;


@property(nonatomic) BOOL debug;
- (id) initWithGradient: (BasicGradient *) gradient;
- (id) initWithGradient: (BasicGradient *) aGradient borderColor: (NSColor *) aBorderColor;
- (id) initWithGradient: (BasicGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth;
- (id) initWithGradient: (BasicGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth cornerRadius: (CGFloat) aCornerRadius;
- (id) initWithGradient: (BasicGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth cornerRadius: (CGFloat) aCornerRadius cornerOptions: (CornerType) aCornerOptions;
- (BasicShadow *) basicInnerShadow;
- (BasicShadow *) basicOuterShadow;
- (BasicShadow *) basicShadow;
- (BOOL) hasOuterShadow;
- (void) drawWithRect: (NSRect) rect;
- (void) drawFillsWithRect: (NSRect) rect;
@end