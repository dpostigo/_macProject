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


- (void) didAddSubview: (NSView *) subview {
    [super didAddSubview: subview];

    NSLog(@"%s", __PRETTY_FUNCTION__);
    if ([subview isKindOfClass: [NSButton class]]) {
        // This is (presumably) the button holding the
        // outline triangle button.
        // We set our own images here.
        NSLog(@"%s", __PRETTY_FUNCTION__);
        [(NSButton *) subview setImage: [NSImage imageNamed: @"disclosure-closed"]];
        [(NSButton *) subview setAlternateImage: [NSImage imageNamed: @"disclosure-open"]];
    }
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