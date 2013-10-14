//
//  BasicDisplayView.h
//  Carts
//
//  Created by Daniela Postigo on 7/4/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicView.h"
#import "PathOptions.h"

@interface BasicDisplayView : BasicView {
    PathOptions *pathOptions;
    NSImage *cacheImage;
}

@property(nonatomic) CGFloat cornerRadius;
@property(nonatomic, strong) NSShadow *innerShadow;
@property(nonatomic, strong) BasicGradient *gradient;
@property(nonatomic, strong) NSColor *backgroundColor;


@property(nonatomic) BorderType borderType;
@property(nonatomic) CGFloat borderWidth;
@property(nonatomic, strong) NSColor *borderColor;
@property(nonatomic, strong) PathOptions *pathOptions;
@property(nonatomic, strong) NSMutableArray *borderOptions;
@property(nonatomic) CornerType cornerOptions;


- (void) addGradient: (BasicGradient *) aGradient;
- (void) removeGradient: (BasicGradient *) aGradient;
- (void) addFill: (BasicFill *) aFill;
- (void) removeFill: (BasicFill *) aFill;
- (void) addBorder: (BorderOption *) aBorder;
- (void) setBorderWidth: (CGFloat) aBorderWidth borderColor: (NSColor *) aBorderColor;
- (void) setup;

- (BasicFill *) fillForGradient: (BasicGradient *) aGradient;
@end