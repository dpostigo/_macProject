//
//  PathOptions.h
//  Carts
//
//  Created by Daniela Postigo on 7/3/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSBezierPath+DPUtils.h"
#import "BorderOption.h"


@interface PathOptions : NSObject <NSCopying> {
    NSColor *backgroundColor;
    BorderOption *borderOption;
    NSArray *borderOptions;

    CGFloat cornerRadius;
    NSBezierPathCornerOptions cornerOptions;
    NSGradient *gradient;
    NSGradient *horizontalGradient;
    NSShadow *innerShadow;
    NSShadow *outerShadow;
}

@property(nonatomic, strong) NSColor *backgroundColor;
@property(nonatomic, strong) NSShadow *outerShadow;
@property(nonatomic, strong) NSShadow *innerShadow;
@property(nonatomic, strong) NSGradient *gradient;
@property(nonatomic, strong) NSGradient *horizontalGradient;
@property(nonatomic, strong) NSColor *borderColor;
@property(nonatomic) NSBezierPathCornerOptions cornerOptions;

@property(nonatomic, strong) BorderOption *borderOption;
@property(nonatomic) CGFloat borderWidth;
@property(nonatomic) CGFloat cornerRadius;
@property(nonatomic) BorderType borderType;


@property(nonatomic, strong) NSArray *borderOptions;
- (id) initWithGradient: (NSGradient *) gradient;
- (id) initWithGradient: (NSGradient *) aGradient borderColor: (NSColor *) aBorderColor;
- (id) initWithGradient: (NSGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth;
- (id) initWithGradient: (NSGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth cornerRadius: (CGFloat) aCornerRadius;
- (id) initWithGradient: (NSGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth cornerRadius: (CGFloat) aCornerRadius cornerOptions: (NSBezierPathCornerOptions) aCornerOptions;

@end