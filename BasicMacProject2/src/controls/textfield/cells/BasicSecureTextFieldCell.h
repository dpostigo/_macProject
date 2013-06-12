//
//  BasicSecureTextFieldCell.h
//  TaskManager
//
//  Created by Daniela Postigo on 6/10/13.
//  Copyright 2013 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BasicSecureTextFieldCell : NSSecureTextFieldCell {
    CGFloat paddingTop;
    CGFloat paddingBottom;
    CGFloat paddingLeft;
    CGFloat paddingRight;
    CGFloat cellPadding;

    NSColor *borderColor;
    NSColor *backgroundColor;

    CGFloat borderWidth;
}


@property(nonatomic) CGFloat paddingTop;
@property(nonatomic) CGFloat paddingBottom;
@property(nonatomic) CGFloat paddingLeft;
@property(nonatomic) CGFloat paddingRight;
@property(nonatomic) CGFloat cellPadding;
@property(nonatomic, strong) NSColor *borderColor;
@property(nonatomic, strong) NSColor *backgroundColor;
@property(nonatomic) CGFloat borderWidth;
@end