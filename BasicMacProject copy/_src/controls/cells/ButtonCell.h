//
// Created by Dani Postigo on 12/30/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface ButtonCell : NSButtonCell {

    NSColor *imageColor;
    NSColor *buttonColor;

    CALayer *shadowLayer;
    CALayer *contentLayer;
    CALayer *highlightLayer;
    CAGradientLayer *fillLayer;
    CALayer *renderedLayer;
    CALayer *imageLayer;
    CALayer *imageMaskLayer;
    CALayer *depressedLayer;
}

@property(nonatomic, strong) NSColor *imageColor;
@property(nonatomic, strong) CALayer *shadowLayer;
@property(nonatomic, strong) CALayer *contentLayer;
@property(nonatomic, strong) CALayer *highlightLayer;
@property(nonatomic, strong) CAGradientLayer *fillLayer;
@property(nonatomic, strong) CALayer *renderedLayer;
@property(nonatomic, strong) NSColor *buttonColor;
@property(nonatomic, strong) CALayer *imageLayer;
@property(nonatomic, strong) CALayer *imageMaskLayer;
@property(nonatomic, strong) CALayer *depressedLayer;
@end