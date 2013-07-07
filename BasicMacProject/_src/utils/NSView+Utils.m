//
// Created by dpostigo on 2/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSView+Utils.h"


@implementation NSView (Utils)


- (void) embedView: (NSView *) aSubview {
    [aSubview embedInView: self];
}

- (void) embedInView: (NSView *) aSuperview {
    [self embedInView: aSuperview autoResizingMask: NSViewWidthSizable | NSViewHeightSizable];
}

- (void) embedInView: (NSView *) aSuperview autoResizingMask: (NSUInteger) autoMask {
    self.frame = aSuperview.bounds;
    self.autoresizingMask = autoMask;
    [aSuperview addSubview: self];
}


- (void) rasterize {
    //    self.layer.rasterizationScale = [[NSScreen mainScreen] scale];
    self.layer.shouldRasterize = YES;
}

- (void) unrasterize {
    self.layer.shouldRasterize = NO;
}

- (CGFloat) left {
    return self.frame.origin.x;
}

- (void) setLeft: (CGFloat) x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat) top {
    return self.frame.origin.y;
}

- (void) setTop: (CGFloat) y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}


- (CGFloat) right {
    return self.frame.origin.x + self.frame.size.width;
}


- (void) setRight: (CGFloat) right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}


- (CGFloat) bottom {
    return self.frame.origin.y + self.frame.size.height;
}


- (void) setBottom: (CGFloat) bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}


- (CGFloat) width {
    return self.frame.size.width;
}


- (void) setWidth: (CGFloat) width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (CGFloat) height {
    return self.frame.size.height;
}


- (void) setHeight: (CGFloat) height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


- (CGPoint) origin {
    return self.frame.origin;
}


- (void) setOrigin: (CGPoint) origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}


- (CGSize) size {
    return self.frame.size;
}


- (void) setSize: (CGSize) size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}


- (void) removeAllSubviews {
    while (self.subviews.count) {
        NSView *child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

@end


