//
//  NSCell+PaddingUtils.h
//  TaskManager
//
//  Created by Daniela Postigo on 6/10/13.
//  Copyright 2013 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCell (PaddingUtils)

@property(nonatomic, assign) CGFloat cellPadding;
@property(nonatomic, assign) CGFloat paddingTop;
@property(nonatomic, assign) CGFloat paddingBottom;
@property(nonatomic, assign) CGFloat paddingLeft;
@property(nonatomic, assign) CGFloat paddingRight;

//- (void) setPaddingTop: (CGFloat) aFloat;
//- (void) setPaddingBottom: (CGFloat) aFloat;
//- (void) setPaddingLeft: (CGFloat) aFloat;
//- (void) setPaddingRight: (CGFloat) aFloat;
//- (CGFloat) paddingTop;
//- (CGFloat) paddingBottom;
//- (CGFloat) paddingLeft;
//- (CGFloat) paddingRight;
@end