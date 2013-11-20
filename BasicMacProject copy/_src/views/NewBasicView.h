//
//  NewBasicView.h
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BasicViewController;


@interface NewBasicView : NSView {

    NSEdgeInsets insets;

    CGFloat hPadding;
    CGFloat vPadding;


    BOOL shouldNotFlip;
    NSString *name;

    __unsafe_unretained BasicViewController *controller;

}

@property(nonatomic) CGFloat hPadding;
@property(nonatomic) CGFloat vPadding;
@property(nonatomic, assign) BasicViewController *controller;
@property(nonatomic) BOOL shouldNotFlip;
@property(nonatomic, retain) NSString *name;
@property(nonatomic) NSEdgeInsets insets;
- (void) viewInit;
- (NSRect) boundsWithMargins;
- (void) notifyController: (SEL) selector;
- (void) notifyController: (SEL) selector withObject: (id) object;
@end