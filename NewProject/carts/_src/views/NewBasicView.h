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

    CGFloat hPadding;
    CGFloat vPadding;
    CGFloat topMargin;
    CGFloat bottomMargin;
    CGFloat leftMargin;
    CGFloat rightMargin;


    BOOL shouldNotFlip;
    NSString *name;

    __unsafe_unretained BasicViewController *controller;

}

@property(nonatomic) CGFloat topMargin;
@property(nonatomic) CGFloat bottomMargin;
@property(nonatomic) CGFloat leftMargin;
@property(nonatomic) CGFloat rightMargin;
@property(nonatomic) CGFloat hPadding;
@property(nonatomic) CGFloat vPadding;
@property(nonatomic, assign) BasicViewController *controller;
@property(nonatomic) BOOL shouldNotFlip;
@property(nonatomic, retain) NSString *name;
- (void) viewInit;
- (NSRect) boundsWithMargins;
- (void) notifyController: (SEL) selector;
- (void) notifyController: (SEL) selector withObject: (id) object;
@end