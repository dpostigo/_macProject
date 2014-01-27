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
    layer.cornerRadius = 2.0;
    layer.backgroundColor = [NSColor clearColor].CGColor;

    layer.borderColor = [NSColor colorWithWhite: 0.1].CGColor;
    layer.borderWidth = 0.5;
    layer.masksToBounds = YES;

    NSShadow *shadow = [[NSShadow alloc] init];

    NSImageView *placeholder = [[NSImageView alloc] initWithFrame: self.bounds];
    [placeholder setImage: [NSImage imageNamed: @"default-user"]];
    [self addSubview: placeholder];

}


@end