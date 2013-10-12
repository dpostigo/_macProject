//
//  PathOptions.h
//  Carts
//
//  Created by Daniela Postigo on 7/3/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "NSBezierPath+DPUtils.h"
#import "BorderOption.h"
#import "BasicGradient.h"
#import "CornerProperties.h"

@interface PathOptions : NSObject <NSCopying> {
    NSColor *backgroundColor;
    BasicGradient *gradient;
    BasicGradient *horizontalGradient;


    NSMutableArray *borderOptions;
    CornerProperties *cornerProperties;


    NSShadow *innerShadow;
    NSShadow *outerShadow;
    PathOptions *innerPathOptions;

}


#pragma mark Pointers
@property(nonatomic) CGFloat cornerRadius;
@property(nonatomic) CornerType cornerType;


@property(nonatomic) CGFloat borderWidth;
@property(nonatomic) BorderType borderType;
@property(nonatomic, strong) NSColor *borderColor;

#pragma mark Synthesized

@property(nonatomic, strong) BasicGradient *gradient;
@property(nonatomic, strong) BasicGradient *horizontalGradient;


@property(nonatomic, strong) BorderOption *borderOption;
@property(nonatomic, strong) CornerProperties *cornerProperties;
@property(nonatomic, strong) NSMutableArray *borderOptions;

@property(nonatomic, strong) NSColor *backgroundColor;
@property(nonatomic, strong) NSShadow *outerShadow;
@property(nonatomic, strong) NSShadow *innerShadow;
@property(nonatomic, strong) PathOptions *innerPathOptions;


- (id) initWithGradient: (BasicGradient *) gradient;
- (id) initWithGradient: (BasicGradient *) aGradient borderColor: (NSColor *) aBorderColor;
- (id) initWithGradient: (BasicGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth;
- (id) initWithGradient: (BasicGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth cornerRadius: (CGFloat) aCornerRadius;
- (id) initWithGradient: (BasicGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth cornerRadius: (CGFloat) aCornerRadius cornerOptions: (CornerType) aCornerOptions;
- (void) drawWithRect: (NSRect) rect;

@end