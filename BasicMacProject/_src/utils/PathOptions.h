//
//  PathOptions.h
//  Carts
//
//  Created by Daniela Postigo on 7/3/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSBezierPath+DPUtils.h"


@interface PathOptions : NSObject {
    NSGradient *gradient;
    NSColor *borderColor;
    CGFloat borderWidth;
    CGFloat cornerRadius;
    NSBezierPathCornerOptions cornerOptions;
}

@property(nonatomic) NSBezierPathCornerOptions cornerOptions;
@property(nonatomic, strong) NSColor *borderColor;
@property(nonatomic) CGFloat borderWidth;
@property(nonatomic) CGFloat cornerRadius;
@property(nonatomic, strong) NSGradient *gradient;


- (id) initWithGradient: (NSGradient *) gradient;
- (id) initWithGradient: (NSGradient *) aGradient borderColor: (NSColor *) aBorderColor;
- (id) initWithGradient: (NSGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth;
- (id) initWithGradient: (NSGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth cornerRadius: (CGFloat) aCornerRadius;
- (id) initWithGradient: (NSGradient *) aGradient borderColor: (NSColor *) aBorderColor borderWidth: (CGFloat) aBorderWidth cornerRadius: (CGFloat) aCornerRadius cornerOptions: (NSBezierPathCornerOptions) aCornerOptions;
+ (id) optionsWithGradient: (NSGradient *) gradient;

@end