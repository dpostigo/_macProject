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
@property(nonatomic) CGFloat borderWidth;
@property(nonatomic, strong) NSShadow *innerShadow;
@property(nonatomic, strong) NSShadow *outerShadow;
@property(nonatomic, strong) NSGradient *gradient;
@property(nonatomic, strong) NSGradient *horizontalGradient;
@property(nonatomic, strong) NSColor *borderColor;
@property(nonatomic, strong) NSColor *innerBorderColor;
@property(nonatomic) NSBezierPathCornerOptions cornerOptions;
@property(nonatomic, strong) PathOptions *pathOptions;
@property(nonatomic, strong) NSArray *borderOptions;
- (void) setup;
@end