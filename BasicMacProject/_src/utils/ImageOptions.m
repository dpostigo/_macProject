//
//  ImageOptions.m
//  Carts
//
//  Created by Daniela Postigo on 7/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "ImageOptions.h"

@implementation ImageOptions {

}

@synthesize imageAlpha;
@synthesize imageColor;

@synthesize imageShadowColor;

- (id) init {
    self = [super init];
    if (self) {
        self.imageAlpha = 1;
        //        self.imageColor = [NSColor clearColor];

    }

    return self;
}


@end