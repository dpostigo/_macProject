//
//  TestLayerView.h
//  Carts
//
//  Created by Daniela Postigo on 11/17/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPInnerShadowLayer.h"

@interface TestLayerView : NSView {

    CALayer *fillLayer;
    CALayer *borderLayer;
    CALayer *shadowLayer;
    DPInnerShadowLayer *innerShadowLayer;

    BOOL awokeFromNib;
    CALayer *viewLayer;

    BOOL noLayers;
}

@property(nonatomic, strong) CALayer *shadowLayer;
@property(nonatomic, strong) CALayer *fillLayer;
@property(nonatomic, strong) CALayer *borderLayer;
@property(nonatomic, strong) DPInnerShadowLayer *innerShadowLayer;


@property(nonatomic) CGFloat borderWidth;
@property(nonatomic) CGFloat cornerRadius;

@property(nonatomic, strong) NSColor *shadowColor;
@property(nonatomic) CGFloat shadowRadius;
@property(nonatomic) float shadowOpacity;
@property(nonatomic) NSSize shadowOffset;


@property(nonatomic, strong) NSColor *backgroundColor;
@property(nonatomic, strong) NSColor *borderColor;
@property(nonatomic) BOOL awokeFromNib;
@property(nonatomic, strong) CALayer *viewLayer;
@property(nonatomic) BOOL noLayers;
@property(nonatomic) BOOL usesLayers;
@end