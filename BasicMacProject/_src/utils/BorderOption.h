//
//  BorderOption.h
//  Carts
//
//  Created by Daniela Postigo on 7/5/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    BorderTypeAll = 1 << 0,
    BorderTypeTop = 1 << 1,
    BorderTypeBottom = 1 << 2,
    BorderTypeLeft = 1 << 3,
    BorderTypeRight = 1 << 4
} BorderType;

@interface BorderOption : NSObject {
    NSColor *borderColor;
    CGFloat borderWidth;
    BorderType borderType;
}

@property(nonatomic, strong) NSColor *borderColor;
@property(nonatomic) CGFloat borderWidth;
@property(nonatomic) BorderType borderType;
- (id) initWithBorderColor: (NSColor *) aColor borderWidth: (CGFloat) aWidth type: (BorderType) aType;
- (id) initWithBorderColor: (NSColor *) aColor borderWidth: (CGFloat) aWidth;

@end