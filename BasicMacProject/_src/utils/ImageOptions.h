//
//  ImageOptions.h
//  Carts
//
//  Created by Daniela Postigo on 7/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageOptions : NSObject {
    CGFloat imageAlpha;
    NSColor *imageColor;
    NSColor *imageShadowColor;
}

@property(nonatomic) CGFloat imageAlpha;
@property(nonatomic, strong) NSColor *imageColor;
@property(nonatomic, strong) NSColor *imageShadowColor;
@end