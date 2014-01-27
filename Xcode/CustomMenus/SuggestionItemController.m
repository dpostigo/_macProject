//
// Created by Dani Postigo on 1/26/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "SuggestionItemController.h"

@implementation SuggestionItemController

- (void) awakeFromNib {
    [super awakeFromNib];

    imageView.wantsLayer = YES;

    CALayer *layer = imageView.layer;
    layer.cornerRadius = 2.0;
    layer.borderWidth = 0.5;
    layer.borderColor = [NSColor colorWithWhite: 0.0 alpha: 0.8].CGColor;
}

@end