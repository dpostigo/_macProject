//
//  BasicWindowDisplayView.h
//  Carts
//
//  Created by Daniela Postigo on 9/9/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicDisplayView.h"

@interface BasicWindowDisplayView : BasicDisplayView {
    CGFloat topMargin;
    CGFloat bottomMargin;

    BOOL cacheAsBitmap;

    NSView *windowHeaderView;
    NSView *windowFooterView;

}

@property(nonatomic) CGFloat topMargin;
@property(nonatomic) CGFloat bottomMargin;
@property(nonatomic) BOOL cacheAsBitmap;
@property(nonatomic, strong) NSView *windowHeaderView;
@property(nonatomic, strong) NSView *windowFooterView;
- (NSView *) singleSubview;
- (NSRect) northWestRect;
- (NSRect) northEastCornerRect;
- (NSRect) southWestRect;
- (NSRect) southEastCornerRect;
- (NSRect) cacheImageTopRight;
- (NSRect) cacheImageTopLeft;
- (NSRect) northMiddleRectForCachedImage;
- (NSRect) cacheImageBottomRight;
@end