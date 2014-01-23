//
// Created by dpostigo on 2/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSView+PositionUtils.h"

@implementation NSView (PositionUtils)

- (void) embedView: (NSView *) aSubview {
    [aSubview embedInView: self];
}

- (void) embedInView: (NSView *) aSuperview {
    [self embedInView: aSuperview autoResizingMask: NSViewWidthSizable | NSViewHeightSizable];
}

- (void) embedInView: (NSView *) aSuperview autoResizingMask: (NSUInteger) autoMask {
    if (self.translatesAutoresizingMaskIntoConstraints) {
        self.frame = aSuperview.bounds;
        self.autoresizingMask = autoMask;
        [aSuperview addSubview: self];
    }
}


- (void) rasterize {
    //    self.layer.rasterizationScale = [[NSScreen mainScreen] scale];
    self.layer.shouldRasterize = YES;
}

- (void) unrasterize {
    self.layer.shouldRasterize = NO;
}



- (void) removeAllSubviews {
    while (self.subviews.count) {
        NSView *child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

@end


