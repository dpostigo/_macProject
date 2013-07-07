//
//  ImageOptions.h
//  Carts
//
//  Created by Daniela Postigo on 7/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ImageOptions : NSObject {
    CGFloat alpha;
    NSColor *imageColor;
}

@property(nonatomic) CGFloat alpha;
@property(nonatomic, strong) NSColor *imageColor;
@end