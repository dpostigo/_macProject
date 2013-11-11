//
//  BorderOption.h
//  Carts
//
//  Created by Daniela Postigo on 7/5/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CornerProperties.h"
#import "BasicFill.h"
#import "SurrogateObject.h"

typedef enum {
    BorderTypeAll = 1 << 0,
    BorderTypeTop = 1 << 1,
    BorderTypeBottom = 1 << 2,
    BorderTypeLeft = 1 << 3,
    BorderTypeRight = 1 << 4
} BorderType;


@interface BorderOption : SurrogateObject {
    BasicFill *fill;
    CGFloat borderWidth;
    BorderType borderType;
    __unsafe_unretained CornerProperties *corners;
}

@property(nonatomic, strong) BasicFill *fill;
@property(nonatomic, strong) NSColor *borderColor;
@property(nonatomic) CGFloat borderWidth;
@property(nonatomic) BorderType borderType;
@property(nonatomic) CGFloat cornerRadius;
@property(nonatomic) CornerType cornerType;
@property(nonatomic, assign) CornerProperties *corners;


+ (BorderOption *) topBorderWithGradient: (BasicGradient *) aGradient borderWidth: (CGFloat) aWidth;
- (id) initWithGradient: (BasicGradient *) aGradient borderWidth: (CGFloat) aWidth type: (BorderType) aType;
- (id) initWithBorderWidth: (CGFloat) aWidth;
- (id) initWithBorderColor: (NSColor *) aColor borderWidth: (CGFloat) aWidth type: (BorderType) aType;
- (id) initWithBorderColor: (NSColor *) aColor borderWidth: (CGFloat) aWidth;
- (BasicGradient *) gradient;
- (void) setGradient: (BasicGradient *) aGradient;
- (void) drawWithRect: (NSRect) rect;
- (void) drawBorderWithPath: (NSBezierPath *) path;
//- (void) drawWithPathOptions: (PathOptions *) pathOptions;

- (NSString *) borderTypeString;
- (NSString *) stringFromBorderType: (BorderType) aType;
@end