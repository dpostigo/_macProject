//
//  BasicDisplayView.m
//  Carts
//
//  Created by Daniela Postigo on 7/4/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicWindowDisplayView.h"
#import "NSBezierPath+Additions.h"

@implementation BasicWindowDisplayView {

    NSBezierPath *undrawablePath;
}





//
//- (BOOL) wantsDefaultClipping {
//    return NO;
//}

//- (BOOL) preservesContentDuringLiveResize {
//    return NO;
//}
//
//- (NSRect) rectPreservedDuringLiveResize {
//    return self.topRect;
//}



//
//- (NSRect) visibleRect {
//    NSRect ret = [super visibleRect];
//    ret = self.topRect;
//    if (self.inLiveResize) {
//        //        NSLog(@"ret = %@", NSStringFromRect(ret));
//
//    }
//    return ret;
//}


- (BOOL) preservesContentDuringLiveResize {
    return YES;
}


- (void) drawRect: (NSRect) dirtyRect {

    NSRect bounds = self.bounds;

    NSGradient *topGradient = [[NSGradient alloc] initWithStartingColor: [NSColor redColor] endingColor: [NSColor whiteColor]];

    if (cacheImage == nil) {
        cacheImage = [[NSImage alloc] initWithSize: self.bounds.size];
        [cacheImage lockFocus];

        NSBezierPath *path;
        path = [NSBezierPath bezierPathWithRect: self.bounds cornerRadius: self.cornerRadius options: self.cornerOptions];
        [pathOptions.backgroundColor set];
        [path fill];

        [cacheImage unlockFocus];
    }

    NSView *subview = self.singleSubview;
    if (subview) {
        NSRect topRect = NSInsetRect(NSMakeRect(0, subview.top + subview.height, self.bounds.size.width, self.bounds.size.height - (subview.top + subview.height)), self.cornerRadius, 0);
        NSRect bottomRect = NSInsetRect(NSMakeRect(0, 0, self.bounds.size.width, subview.top), self.cornerRadius, 0);

        [pathOptions.backgroundColor set];
        NSRectFill(topRect);
        NSRectFill(bottomRect);

    }

    [cacheImage drawInRect: self.topLeft fromRect: self.cacheImageTopLeft operation: NSCompositeSourceOver fraction: 1.0];


    //        [cacheImage drawAtPoint: self.topLeft.origin fromRect: self.cacheImageTopLeft operation: NSCompositeSourceOver fraction: 1.0];
    [cacheImage drawInRect: self.topRightCornerRect fromRect: self.cacheImageTopRight operation: NSCompositeSourceOver fraction: 1.0];
    [cacheImage drawInRect: self.bottomLeft fromRect: self.bottomLeft operation: NSCompositeSourceOver fraction: 1.0];
    [cacheImage drawInRect: self.bottomRight fromRect: self.cacheImageBottomRight operation: NSCompositeSourceOver fraction: 1.0];



    //        [cacheImage drawInRect: self.topMiddle fromRect: self.cacheImageTopMiddle operation: NSCompositeSourceOver fraction: 1.0];
    //        [cacheImage drawInRect: self.bottomMiddle fromRect: self.cacheImageBottomMiddle operation: NSCompositeSourceOver fraction: 1.0];
    //        [cacheImage drawInRect: self.leftMiddle fromRect: self.cacheImageLeftMiddle operation: NSCompositeSourceOver fraction: 1.0];
    //        [cacheImage drawInRect: self.rightMiddle fromRect: self.cacheImageRightMiddle operation: NSCompositeSourceOver fraction: 1.0];

}




#pragma mark Helpers

- (NSView *) singleSubview {
    return [self.subviews count] == 1 ? [self.subviews objectAtIndex: 0] : nil;
}


- (NSRect) topMiddleForSize: (NSSize) size {
    return NSInsetRect(NSMakeRect(0, size.height - self.cornerRadius, size.width, self.cornerRadius), self.cornerRadius, 0);
}


- (NSRect) bottomMiddleForSize: (NSSize) size {
    return NSMakeRect(self.cornerRadius, 0, size.width - (self.cornerRadius * 2), self.cornerRadius);
}


- (NSRect) leftMiddleForSize: (NSSize) size {
    return NSMakeRect(0, self.cornerRadius, self.cornerRadius, size.height - (self.cornerRadius * 2));
}


- (NSRect) rightMiddleForSize: (NSSize) size {
    return NSMakeRect(size.width - self.cornerRadius, self.cornerRadius, self.cornerRadius, size.height - (self.cornerRadius * 2));
}

- (NSRect) cornerRectForTopCornerRect: (NSRect) cornerRect {
    NSRect ret = cornerRect;
    NSView *subview = self.singleSubview;
    NSRect topRect = NSInsetRect(NSMakeRect(0, subview.top + subview.height, self.bounds.size.width, self.bounds.size.height - (subview.top + subview.height)), self.cornerRadius, 0);
    CGFloat offset = topRect.size.height - self.cornerRadius;
    ret.origin.y -= offset;
    ret.size.height += offset;
    return ret;
}


- (NSRect) cornerRectForBottomCornerRect: (NSRect) cornerRect {
    NSRect ret = cornerRect;
    NSView *subview = self.singleSubview;
    NSRect bottomRect = NSInsetRect(NSMakeRect(0, 0, self.bounds.size.width, subview.top), self.cornerRadius, 0);
    CGFloat offset = bottomRect.size.height - self.cornerRadius;
    ret.size.height += offset;
    return ret;
}

- (NSRect) topLeftForSize: (NSSize) size {
    NSRect ret = NSMakeRect(0, size.height - self.cornerRadius, self.cornerRadius, self.cornerRadius);
    NSView *subview = self.singleSubview;
    if (subview) {
        ret = [self cornerRectForTopCornerRect: ret];
    }
    return ret;
}


- (NSRect) topRightForSize: (NSSize) size {
    NSRect ret = NSMakeRect(size.width - self.cornerRadius, size.height - self.cornerRadius, self.cornerRadius, self.cornerRadius);
    NSView *subview = self.singleSubview;
    if (subview) {
        ret = [self cornerRectForTopCornerRect: ret];
    }
    return ret;
}


- (NSRect) bottomLeftForSize: (NSSize) size {
    NSRect ret = NSMakeRect(0, 0, self.cornerRadius, self.cornerRadius);
    NSView *subview = self.singleSubview;
    if (subview) {
        ret = [self cornerRectForBottomCornerRect: ret];
    }
    return ret;
}


- (NSRect) bottomRightForSize: (NSSize) size {
    NSRect ret = NSMakeRect(size.width - self.cornerRadius, 0, self.cornerRadius, self.cornerRadius);
    NSView *subview = self.singleSubview;
    if (subview) {
        ret = [self cornerRectForBottomCornerRect: ret];
    }
    return ret;
}


- (NSRect) topLeft {
    return [self topLeftForSize: self.bounds.size];
}

- (NSRect) topRightCornerRect {
    return [self topRightForSize: self.bounds.size];
}

- (NSRect) bottomLeft {
    return [self bottomLeftForSize: self.bounds.size];
}

- (NSRect) bottomRight {
    return [self bottomRightForSize: self.bounds.size];
}

- (NSRect) topMiddle {
    return [self topMiddleForSize: self.bounds.size];
}

- (NSRect) bottomMiddle {
    return [self bottomMiddleForSize: self.bounds.size];
}

- (NSRect) leftMiddle {
    return [self leftMiddleForSize: self.bounds.size];
}

- (NSRect) rightMiddle {
    return [self rightMiddleForSize: self.bounds.size];
}


- (NSRect) cacheImageTopRight {
    return [self topRightForSize: cacheImage.size];
    NSMakeRect(cacheImage.size.width - self.cornerRadius, cacheImage.size.height - self.cornerRadius, self.cornerRadius, self.cornerRadius);
}

- (NSRect) cacheImageTopLeft {
    return [self topLeftForSize: cacheImage.size];
}


- (NSRect) cacheImageTopMiddle {
    return [self topMiddleForSize: cacheImage.size];
}

- (NSRect) cacheImageBottomMiddle {
    return [self bottomMiddleForSize: cacheImage.size];
}

- (NSRect) cacheImageLeftMiddle {
    return [self leftMiddleForSize: cacheImage.size];
}

- (NSRect) cacheImageRightMiddle {
    return [self rightMiddleForSize: cacheImage.size];
}

- (NSRect) cacheImageBottomRight {
    return [self bottomRightForSize: cacheImage.size];
}


- (NSRect) topRect {
    return NSMakeRect(0, self.cornerRadius, self.bounds.size.width, self.bounds.size.height - self.cornerRadius);
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