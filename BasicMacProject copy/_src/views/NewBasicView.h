//
//  NewBasicView.h
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BasicFlippedViewController;


@interface NewBasicView : NSView {

    NSEdgeInsets insets;

    CGFloat hPadding;
    CGFloat vPadding;


    BOOL shouldNotFlip;
    NSString *name;

    __unsafe_unretained BasicFlippedViewController *controller;

}

@property(nonatomic) CGFloat hPadding;
@property(nonatomic) CGFloat vPadding;
@property(nonatomic, assign) BasicFlippedViewController *controller;
@property(nonatomic) BOOL shouldNotFlip;
@property(nonatomic, retain) NSString *name;
@property(nonatomic) NSEdgeInsets insets;
- (void) viewInit;
- (NSRect) boundsWithMargins;
- (void) notifyController: (SEL) selector;
- (void) notifyController: (SEL) selector withObject: (id) object;
@end