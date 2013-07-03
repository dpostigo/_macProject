//
//  BasicCustomWindowFrame.h
//  Carts
//
//  Created by Daniela Postigo on 6/24/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSBezierPath+DPUtils.h"
#import "PathOptions.h"


@interface BasicCustomWindowFrame : NSView {

    PathOptions *pathOptions;
    PathOptions *innerPathOptions;


    NSColor *innerBorderColor;


    NSRect bottomRightRect;
    NSSize resizeRectSize;
    CGFloat windowFramePadding;

}

@property(nonatomic) CGFloat windowFramePadding;
@property(nonatomic) NSRect bottomRightRect;
@property(nonatomic) NSSize resizeRectSize;


@property(nonatomic) NSBezierPathCornerOptions cornerOptions;
@property(nonatomic) CGFloat cornerRadius;
@property(nonatomic) CGFloat borderWidth;
@property(nonatomic, strong) NSGradient *gradient;
@property(nonatomic, strong) NSColor *borderColor;
@property(nonatomic, strong) NSColor *innerBorderColor;
@property(nonatomic, strong) PathOptions *pathOptions;
@property(nonatomic, strong) PathOptions *innerPathOptions;
@end