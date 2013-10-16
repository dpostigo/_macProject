//
//  BasicDisplayView.m
//  Carts
//
//  Created by Daniela Postigo on 7/4/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicWindowDisplayView.h"
#import "NSBezierPath+Additions.h"

@implementation BasicWindowDisplayView

@synthesize cacheAsBitmap;
@synthesize topMargin;
@synthesize bottomMargin;
@synthesize windowHeaderView;
@synthesize windowFooterView;

- (void) setup {
    [super setup];
    self.topMargin = 10;
    self.bottomMargin = 10;
    cacheAsBitmap = YES;
}

- (void) updateLayout {
    if (windowHeaderView) windowHeaderView.frame = self.windowHeaderFrame;
    if (windowFooterView) windowFooterView.frame = self.windowFooterFrame;

    if (self.singleSubview) self.singleSubview.frame = self.subviewFrame;

    //    NSLog(@"self.frame = %@", NSStringFromRect(self.frame));
    //    NSLog(@"self.windowHeaderFrame = %@", NSStringFromRect(self.windowHeaderFrame));
    //    NSLog(@"self.windowFooterFrame = %@", NSStringFromRect(self.windowFooterFrame));
    //    NSLog(@"self.subviewFrame = %@", NSStringFromRect(self.subviewFrame));

}



#pragma mark DisplayView overrides

- (void) setBorderWidth: (CGFloat) borderWidth {
    [super setBorderWidth: borderWidth];
    [self updateLayout];
}

- (void) setTopMargin: (CGFloat) topMargin1 {
    topMargin = topMargin1;
    [self updateLayout];
}

- (void) setWindowHeaderView: (NSView *) windowHeaderView1 {
    windowHeaderView = windowHeaderView1;
    windowHeaderView.autoresizingMask = NSViewWidthSizable | NSViewMaxYMargin;
    [self addSubview: windowHeaderView];
    [self updateLayout];
}


- (void) setWindowFooterView: (NSView *) windowHeaderView1 {
    windowFooterView = windowHeaderView1;
    windowFooterView.autoresizingMask = NSViewWidthSizable | NSViewMinYMargin;
    [self addSubview: windowFooterView];
    [self updateLayout];
}

//- (void) embedView: (NSView *) aSubview {
//    [super embedView: aSubview];
//
//    if (aSubview != windowHeaderView && aSubview != windowFooterView) {
//        //        aSubview.frame = NSInsetRect(aSubview.frame, self.borderWidth, self.borderWidth);
//    }
//}
//


#pragma mark NSView overrides



- (void) addSubview: (NSView *) aView {
    [super addSubview: aView];
    [self updateLayout];
}

- (BOOL) isOpaque {
    return YES;
}


- (BOOL) isFlipped {
    return YES;
}

- (BOOL) mouseDownCanMoveWindow {
    return YES;
}

- (BOOL) preservesContentDuringLiveResize {
    return YES;
}

- (void) viewDidEndLiveResize {
    [super viewDidEndLiveResize];
    [self setNeedsDisplay: YES];
}

- (void) drawRect: (NSRect) dirtyRect {

    if (windowHeaderView != nil && windowFooterView != nil) {
        //        NSLog(@"Has header & footer view.");
        [super drawRect: dirtyRect];

    } else {

        NSBezierPath *path = [NSBezierPath bezierPathWithRect: self.bounds pathOptions: pathOptions];
        if (cacheAsBitmap) {

            [self drawImage];

            if (self.inLiveResize) {

                [self.backgroundColor set];
                NSRectFill(self.bounds);
                //                [self.backgroundColor set];
                //                [path fill];

            } else {

                if (windowHeaderView == nil) {
                    [cacheImage drawInRect: self.northWestRect fromRect: self.cacheImageTopLeft operation: NSCompositeSourceOver fraction: 1.0];
                    [cacheImage drawInRect: self.northEastCornerRect fromRect: self.cacheImageTopRight operation: NSCompositeSourceOver fraction: 1.0];
                    [cacheImage drawInRect: self.northMiddleRect fromRect: self.northMiddleRectForCachedImage operation: NSCompositeSourceOver fraction: 1.0];
                }

                [cacheImage drawInRect: self.southMiddleRect fromRect: self.cacheImageBottomMiddle operation: NSCompositeSourceOver fraction: 1.0];
                [cacheImage drawInRect: self.southWestRect fromRect: self.southWestRect operation: NSCompositeSourceOver fraction: 1.0];
                [cacheImage drawInRect: self.southEastCornerRect fromRect: self.cacheImageBottomRight operation: NSCompositeSourceOver fraction: 1.0];

                [cacheImage drawInRect: self.westMiddleRect fromRect: self.cacheImageLeftMiddle operation: NSCompositeSourceOver fraction: 1.0];
                [cacheImage drawInRect: self.eastMiddleRect fromRect: self.cacheImageRightMiddle operation: NSCompositeSourceOver fraction: 1.0];
            }

        } else {
            //        [path drawWithPathOptions: pathOptions];
            NSLog(@"Not caching as bitmap.");
            [pathOptions drawWithRect: self.bounds];
        }
    }
}

- (void) drawImage {
    if (cacheImage == nil) {
        cacheImage = [[NSImage alloc] initWithSize: self.bounds.size];
        [cacheImage lockFocus];

        [pathOptions drawWithRect: self.bounds];
        //                [path drawWithPathOptions: pathOptions];
        [cacheImage unlockFocus];
    }
}






#pragma mark Getters





#pragma mark Helpers

- (NSView *) singleSubview {
    NSView *ret = nil;
    NSArray *subviews = self.subviews;
    if ([self.subviews count] > 0) {
        for (NSView *subview in subviews) {
            if (subview != windowHeaderView && subview != windowFooterView) {
                ret = subview;
                break;
            }
        }
    }
    return ret;
}

- (NSRect) southMiddleForSize: (NSSize) size {

    NSRect ret = NSMakeRect(0, 0, size.width, self.bottomMargin);

    // Subtract corner rects
    ret = NSInsetRect(ret, self.cornerRadius, 0);
    return ret;

    //    return NSMakeRect(self.cornerRadius, 0, size.width - (self.cornerRadius * 2), self.cornerRadius);
}

- (NSRect) westMiddleForSize: (NSSize) size {
    return NSMakeRect(0, self.cornerRadius, self.borderWidth, size.height - (self.cornerRadius * 2));
}

- (NSRect) eastMiddleForSize: (NSSize) size {
    return NSMakeRect(size.width - self.borderWidth, self.cornerRadius, self.borderWidth, size.height - (self.cornerRadius * 2));
}

- (NSRect) cornerRectForTopCornerRect: (NSRect) cornerRect {
    NSRect ret = cornerRect;

    NSView *subview = self.singleSubview;
    NSRect topRect = NSMakeRect(0, subview.top + subview.height, self.bounds.size.width, self.bounds.size.height - (subview.top + subview.height));
    topRect = NSInsetRect(topRect, self.cornerRadius, 0);
    //
    CGFloat offset = topRect.size.height - self.cornerRadius;
    ret.origin.y -= offset;
    ret.size.height += offset;
    //    ret.size.height = self.topMargin;
    //    ret.origin.y += self.topMargin;
    return ret;
}

- (NSRect) cornerRectForBottomCornerRect: (NSRect) cornerRect {
    NSRect ret = cornerRect;
    NSView *subview = self.singleSubview;

    //    NSRect bottomRect = NSInsetRect(NSMakeRect(0, 0, self.bounds.size.width, subview.top), self.cornerRadius, 0);
    //    CGFloat offset = bottomRect.size.height - self.cornerRadius;
    //    ret.size.height += offset;
    ret.size.height = self.bottomMargin;

    return ret;
}

#pragma mark North


- (NSRect) windowHeaderFrame {
    return self.northRectFull;
}

- (NSRect) windowFooterFrame {
    return self.southRectFull;
}

- (CGFloat) subviewHeight {
    return self.bounds.size.height - self.topMargin - self.bottomMargin;
}

- (NSRect) subviewFrame {
    NSRect ret = NSMakeRect(0, self.topMargin, self.width, self.subviewHeight);
    ret.origin.y += self.borderWidth;
    ret.size.height -= self.borderWidth;
    ret = NSInsetRect(ret, self.borderWidth, 0);
    return ret;
}


- (NSRect) northRectFull {
    return NSMakeRect(0, 0, self.bounds.size.width, self.topMargin);
}


- (NSRect) southRectFull {
    return NSMakeRect(0, self.bounds.size.height - self.bottomMargin, self.bounds.size.width, self.bottomMargin);
}


- (NSRect) northRectForSize: (NSSize) size {
    NSRect ret = NSMakeRect(0, size.height - self.topMargin, size.width, self.topMargin);
    ret = NSInsetRect(ret, self.cornerRadius, 0);  // Subtract corner rects
    return ret;
}

- (NSRect) northMiddleRect {
    return [self northRectForSize: self.bounds.size];
}

- (NSRect) northWestRect {
    return [self northWestRectForSize: self.bounds.size];
}

- (NSRect) northWestRectForSize: (NSSize) size {
    NSRect ret = NSMakeRect(0, size.height - self.cornerRadius, self.cornerRadius, self.cornerRadius);
    NSView *subview = self.singleSubview;
    if (subview) {
        ret = NSMakeRect(0, size.height - self.topMargin, self.cornerRadius, self.topMargin);
    }
    return ret;
}

- (NSRect) northEastCornerRect {
    return [self northEastRectForSize: self.bounds.size];
}

- (NSRect) northEastRectForSize: (NSSize) size {
    NSRect ret = NSMakeRect(size.width - self.cornerRadius, size.height - self.cornerRadius, self.cornerRadius, self.cornerRadius);
    NSView *subview = self.singleSubview;
    if (subview) {
        //        ret = [self cornerRectForTopCornerRect: ret];

        ret = NSMakeRect(size.width - self.cornerRadius, size.height - self.topMargin, self.cornerRadius, self.topMargin);
    }
    return ret;
}

- (NSRect) southWestRect {
    return [self southWestRectForSize: self.bounds.size];
}

- (NSRect) southWestRectForSize: (NSSize) size {
    NSRect ret = NSMakeRect(0, 0, self.cornerRadius, self.cornerRadius);
    NSView *subview = self.singleSubview;
    if (subview) {
        ret = [self cornerRectForBottomCornerRect: ret];
    }
    return ret;
}

- (NSRect) southEastCornerRect {
    return [self southEastRectForSize: self.bounds.size];
}

- (NSRect) southEastRectForSize: (NSSize) size {
    NSRect ret = NSMakeRect(size.width - self.cornerRadius, 0, self.cornerRadius, self.cornerRadius);
    NSView *subview = self.singleSubview;
    if (subview) {
        ret = [self cornerRectForBottomCornerRect: ret];
    }
    return ret;
}

- (NSRect) southMiddleRect {
    return [self southMiddleForSize: self.bounds.size];
}

- (NSRect) westMiddleRect {
    return [self westMiddleForSize: self.bounds.size];
}

- (NSRect) eastMiddleRect {
    return [self eastMiddleForSize: self.bounds.size];
}



#pragma mark Cache image rects


- (NSRect) cacheImageTopRight {
    return [self northEastRectForSize: cacheImage.size];
    NSMakeRect(cacheImage.size.width - self.cornerRadius, cacheImage.size.height - self.cornerRadius, self.cornerRadius, self.cornerRadius);
}

- (NSRect) cacheImageTopLeft {
    return [self northWestRectForSize: cacheImage.size];
}

- (NSRect) northMiddleRectForCachedImage {
    return [self northRectForSize: cacheImage.size];
}

- (NSRect) cacheImageBottomMiddle {
    return [self southMiddleForSize: cacheImage.size];
}

- (NSRect) cacheImageLeftMiddle {
    return [self westMiddleForSize: cacheImage.size];
}

- (NSRect) cacheImageRightMiddle {
    return [self eastMiddleForSize: cacheImage.size];
}

- (NSRect) cacheImageBottomRight {
    return [self southEastRectForSize: cacheImage.size];
}

- (NSRect) bottomRect {
    return NSMakeRect(0, 0, self.bounds.size.width, self.cornerRadius);
}

- (NSRect) middleRect {
    return NSMakeRect(0, self.cornerRadius, self.bounds.size.width, self.bounds.size.height - (self.cornerRadius * 2));
}

- (NSRect) resizingRect {
    return NSMakeRect(0, 0, self.bounds.size.width, self.cornerRadius);
}


@end