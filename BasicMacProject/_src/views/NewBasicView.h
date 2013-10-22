//
//  NewBasicView.h
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewBasicView : NSView {

    CGFloat hPadding;
    CGFloat vPadding;
    CGFloat topMargin;
    CGFloat bottomMargin;
    CGFloat leftMargin;
    CGFloat rightMargin;

}

@property(nonatomic) CGFloat topMargin;
@property(nonatomic) CGFloat bottomMargin;
@property(nonatomic) CGFloat leftMargin;
@property(nonatomic) CGFloat rightMargin;
@property(nonatomic) CGFloat hPadding;
@property(nonatomic) CGFloat vPadding;
- (void) viewInit;
- (NSRect) boundsWithMargins;
@end