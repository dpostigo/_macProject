//
// Created by Dani Postigo on 1/24/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "BOImageView.h"
#import "NSColor+NewUtils.h"

@implementation BOImageView

- (void) awakeFromNib {
    [super awakeFromNib];

    self.wantsLayer = YES;

    CALayer *layer = self.layer;
    layer.cornerRadius = 3.0;
    layer.backgroundColor = [NSColor clearColor].CGColor;

    layer.borderColor = [NSColor colorWithWhite: 0.2].CGColor;
    layer.borderWidth = 0.5;
    layer.masksToBounds = YES;

    NSShadow *shadow = [[NSShadow alloc] init];

}

@end