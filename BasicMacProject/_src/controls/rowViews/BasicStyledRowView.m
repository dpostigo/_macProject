//
//  BasicStyledRowView.m
//  Carts
//
//  Created by Daniela Postigo on 6/23/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicStyledRowView.h"
#import "NSBezierPath+DPUtils.h"


@implementation BasicStyledRowView {

}


- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {
        self.borderColor = [NSColor colorWithString: @"E8E8E8"];
        self.borderColor = [NSColor lightGrayColor];
        self.gradient = [[NSGradient alloc] initWithStartingColor: [NSColor colorWithString: @"F2F2F2"]
                                                      endingColor: [NSColor colorWithString: @"F2F2F2"]];

    }

    return self;
}


- (void) drawBackgroundInRect: (NSRect) dirtyRect selected: (BOOL) selected {

    if (selected) {
        [super drawBackgroundInRect: dirtyRect selected: selected];
    }

    else {

        NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect: dirtyRect corners: cornerOptions radius: cornerRadius];
        [path drawGradient: gradient angle: -90];
        [path drawStroke: borderColor width: borderWidth];

        NSBezierPath *topPath = [NSBezierPath bezierPathWithRect: NSMakeRect(0, 0, dirtyRect.size.width, 1)];
        [topPath drawWithFill: [NSColor whiteColor]];

    }
}


@end