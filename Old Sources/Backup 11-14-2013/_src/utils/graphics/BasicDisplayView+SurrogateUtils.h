//
//  BasicDisplayView+SurrogateUtils.h
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicDisplayView.h"
#import "BorderOption.h"

@interface BasicDisplayView (SurrogateUtils)

@property(nonatomic, strong) NSColor *backgroundColor;
@property(nonatomic, strong) NSColor *borderColor;
@property(nonatomic) BorderType borderType;
@property(nonatomic) CGFloat borderWidth;
@property(nonatomic, strong) NSMutableArray *borders;
@property(nonatomic) CornerType cornerType;
@property(nonatomic) CGFloat cornerRadius;
@property(nonatomic, strong) NSMutableArray *fills;
@property(nonatomic, strong) BasicGradient *gradient;
@property(nonatomic, strong) BasicShadow *shadow;
@property(nonatomic, strong) NSShadow *innerShadow;
@property(nonatomic, strong) NSShadow *outerShadow;
@property(nonatomic, strong) BasicShadow *basicOuterShadow;
@property(nonatomic, strong) BasicShadow *basicInnerShadow;


@end