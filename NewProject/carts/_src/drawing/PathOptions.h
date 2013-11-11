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

@interface PathOptions : SurrogateObject <NSCopying> {

    NSMutableArray *fills;
    NSMutableArray *borderOptions;
    CornerProperties *cornerProperties;


    NSShadow *innerShadow;
    NSShadow *outerShadow;
    PathOptions *innerPathOptions;

}


#pragma mark dynamic

@property(nonatomic, strong) BasicGradient *gradient;
@property(nonatomic, strong) NSColor *backgroundColor;
@property(nonatomic) CGFloat cornerRadius;
@property(nonatomic) CornerType cornerType;
@property(nonatomic) CGFloat borderWidth;
@property(nonatomic, strong) NSColor *borderColor;
@property(nonatomic) BorderType borderType;

#pragma mark Pointers


@property(nonatomic, strong) BorderOption *borderOption;
@property(nonatomic, strong) BasicFill *fill;

#pragma mark Synthesized

@property(nonatomic, strong) NSMutableArray *fills;
@property(nonatomic, strong) NSMutableArray *borderOptions;
@property(nonatomic, strong) CornerProperties *cornerProperties;

@property(nonatomic, strong) NSShadow *innerShadow;
@property(nonatomic, strong) NSShadow *outerShadow;
@property(nonatomic, strong) PathOptions *innerPathOptions;

- (id) initWithGradient: (BasicGradient *) gradient;
- (id) initWithGradient: (BasicGradient *) aGradient borderColor: (NSColor *) aBorderColor;
- (id) initWithGradient: (BasicGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth;
- (id) initWithGradient: (BasicGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth cornerRadius: (CGFloat) aCornerRadius;
- (id) initWithGradient: (BasicGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth cornerRadius: (CGFloat) aCornerRadius cornerOptions: (CornerType) aCornerOptions;
- (void) drawWithRect: (NSRect) rect;

@end