//
// Created by Dani Postigo on 1/20/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "BlueView.h"

@implementation BlueView

- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {

        [self setup];
    }

    return self;
}


- (void) setup {

    self.wantsLayer = YES;
    self.layer.backgroundColor = [NSColor blueColor].CGColor;
}
@end