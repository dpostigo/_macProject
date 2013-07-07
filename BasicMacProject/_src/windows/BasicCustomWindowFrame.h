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


typedef enum {
    WindowFrameResizeTypeNone = 0,
    WindowFrameResizeTypeLeft = 1,
    WindowFrameResizeTypeRight = 2,
    WindowFrameResizeTypeTop = 3,
    WindowFrameResizeTypeBottom = 4,
    WindowFrameResizeTypeTopLeft = 5,
    WindowFrameResizeTypeTopRight = 6,
    WindowFrameResizeTypeBottomLeft = 7,
    WindowFrameResizeTypeBottomRight = 8
} WindowFrameResizeType;

@interface BasicCustomWindowFrame : NSView {

    PathOptions *pathOptions;
    PathOptions *innerPathOptions;

    CGFloat cornerRadiusInset;

    NSRect rightResizeRect;
    NSSize resizeRectSize;
    CGFloat windowFramePadding;


    NSArray *cursors;

}

@property(nonatomic) CGFloat windowFramePadding;
@property(nonatomic) NSSize resizeRectSize;


@property(nonatomic) CGFloat cornerRadius;
@property(nonatomic) CGFloat borderWidth;
@property(nonatomic, strong) NSGradient *gradient;
@property(nonatomic, strong) NSColor *borderColor;
@property(nonatomic, strong) NSColor *innerBorderColor;
@property(nonatomic) NSBezierPathCornerOptions cornerOptions;
@property(nonatomic, strong) PathOptions *pathOptions;
@property(nonatomic, strong) PathOptions *innerPathOptions;
@property(nonatomic) NSRect rightResizeRect;
@property(nonatomic, strong) NSArray *cursors;
@property(nonatomic) CGFloat cornerRadiusInset;
@end