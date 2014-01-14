//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "DPTableRowView.h"

@implementation DPTableRowView

- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {
        self.wantsLayer = YES;

        CALayer *layer = self.layer;
        layer.backgroundColor = [NSColor whiteColor].CGColor;

    }

    return self;
}

- (void) setFrame: (NSRect) frameRect {
    [super setFrame: frameRect];
    self.layer.bounds = self.bounds;
}



//
//- (void) drawBackgroundInRect: (NSRect) dirtyRect {
//    [super drawBackgroundInRect: dirtyRect];
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//
//    [[NSColor yellowColor] set];
//    NSRectFill(self.bounds);
//}
//

@end