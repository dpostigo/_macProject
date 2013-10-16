//
// Created by Daniela Postigo on 5/19/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSBezierPath+DPUtils.h"
#import "PathOptions.h"
#import "NSBezierPath+Additions.h"

@implementation NSBezierPath (DPUtils)

+ (NSBezierPath *) bezierPathWithRect: (NSRect) rect cornerRadius: (CGFloat) radius cornerType: (CornerType) options {

    if (radius == 0.0 || (options & CornerNone)) {
        return [NSBezierPath bezierPathWithRect: rect];
    }

    //    if (options & (CornerUpperLeft | CornerUpperRight | CornerLowerLeft | CornerLowerRight)) {
    //        NSLog(@"All, options = %d", options);
    //        return [NSBezierPath bezierPathWithRoundedRect: rect xRadius: radius yRadius: radius];
    //    }

    NSBezierPath *path = [NSBezierPath bezierPath];
    NSPoint endPoint;
    NSPoint thruPoint;

    CGFloat xOffset = rect.origin.x;
    // CGFloat yOffset = rect.origin.y;

    [path moveToPoint: NSMakePoint(radius + xOffset, 0)];
    [path lineToPoint: NSMakePoint(rect.size.width - radius + xOffset, 0)];

    endPoint = NSMakePoint(rect.size.width + xOffset, radius);
    thruPoint = NSMakePoint(rect.size.width + xOffset, 0);
    if (options & CornerLowerRight) {
        [path appendBezierPathWithArcFromPoint: thruPoint toPoint: endPoint radius: radius];
    } else {
        [path lineToPoint: thruPoint];
        [path lineToPoint: endPoint];
    }

    endPoint = NSMakePoint(rect.size.width - radius + xOffset, rect.size.height);
    thruPoint = NSMakePoint(rect.size.width + xOffset, rect.size.height);
    if (options & CornerUpperRight) {
        [path appendBezierPathWithArcFromPoint: thruPoint toPoint: endPoint radius: radius];
    } else {
        [path lineToPoint: thruPoint];
        [path lineToPoint: endPoint];
    }

    endPoint = NSMakePoint(0 + xOffset, rect.size.height - radius);
    thruPoint = NSMakePoint(0 + xOffset, rect.size.height);
    if (options & CornerUpperLeft) {
        [path appendBezierPathWithArcFromPoint: thruPoint toPoint: endPoint radius: radius];
    } else {
        [path lineToPoint: thruPoint];
        [path lineToPoint: endPoint];
    }

    endPoint = NSMakePoint(radius + xOffset, 0);
    thruPoint = NSMakePoint(0 + xOffset, 0);
    if (options & CornerLowerLeft) {
        [path appendBezierPathWithArcFromPoint: thruPoint toPoint: endPoint radius: radius];
    } else {
        [path lineToPoint: thruPoint];
        [path lineToPoint: endPoint];
    }

    [path closePath];
    return path;
}


+ (NSBezierPath *) bezierPathWithRect: (NSRect) rect pathOptions: (PathOptions *) pathOptions {
    if (pathOptions.borderWidth > 0 && ![pathOptions.borderColor isEqualTo: [NSColor clearColor]]) {
        rect = NSInsetRect(rect, pathOptions.borderWidth, pathOptions.borderWidth);
    }
    NSBezierPath *path = [NSBezierPath bezierPathWithRect: rect cornerRadius: pathOptions.cornerRadius cornerType: pathOptions.cornerType];
    return path;
}

+ (NSBezierPath *) shadowBezierPathWithRect: (NSRect) rect pathOptions: (PathOptions *) pathOptions {
    NSBezierPath *path = [NSBezierPath bezierPathWithRect: rect cornerRadius: pathOptions.cornerRadius cornerType: pathOptions.cornerType];
    return path;
}


+ (NSBezierPath *) bezierPathWithRect: (NSRect) rect borderType: (BorderType) borderType {

    NSBezierPath *path = [NSBezierPath bezierPath];

    CGFloat xOffset = rect.origin.x;
    CGFloat yOffset = rect.origin.y;

    if (borderType & BorderTypeTop) {
        [path moveToPoint: NSMakePoint(rect.origin.x, rect.size.height + yOffset)];
        [path lineToPoint: NSMakePoint(rect.size.width + xOffset, rect.size.height + yOffset)];
    }
    if (borderType & BorderTypeBottom) {
        [path moveToPoint: NSMakePoint(0 + xOffset, 0 + yOffset)];
        [path lineToPoint: NSMakePoint(rect.size.width + xOffset, 0 + yOffset)];
    }
    if (borderType & BorderTypeLeft) {
        [path moveToPoint: NSMakePoint(0 + xOffset, 0 + yOffset)];
        [path lineToPoint: NSMakePoint(0 + xOffset, rect.size.height + yOffset)];
    }
    if (borderType & BorderTypeRight) {
        [path moveToPoint: NSMakePoint(rect.size.width + xOffset, 0 + yOffset)];
        [path lineToPoint: NSMakePoint(rect.size.width + xOffset, rect.size.height + yOffset)];
    }

    [path closePath];
    return path;
}


#pragma mark Path Options

+ (void) drawBezierPathWithRect: (NSRect) rect options: (PathOptions *) pathOptions {
    NSBezierPath *path = [NSBezierPath bezierPathWithRect: rect pathOptions: pathOptions];
    [path drawWithPathOptions: pathOptions];

    for (BorderOption *borderOption in pathOptions.borderOptions) {
        if (borderOption.borderType & BorderTypeAll) [path drawWithBorderOption: borderOption];
        else {
            [NSBezierPath drawBezierPathWithRect: rect borderOptions: borderOption];
        }
    }

    if (pathOptions.innerPathOptions != nil) {
        rect = NSInsetRect(rect, pathOptions.borderWidth, pathOptions.borderWidth);
        [NSBezierPath drawBezierPathWithRect: rect options: pathOptions.innerPathOptions];
    }
}

+ (void) drawBezierPathWithRect: (NSRect) rect borderOptions: (BorderOption *) borderOption {
    NSBezierPath *borderPath = [NSBezierPath bezierPathWithRect: rect borderType: borderOption.borderType];
    [borderPath drawWithBorderOption: borderOption];
}



#pragma mark Options

- (void) drawWithBorderOption: (BorderOption *) borderOption {
    [self drawStroke: borderOption.borderColor width: borderOption.borderWidth];

}

- (void) drawWithPathOptions: (PathOptions *) pathOptions {
    if (pathOptions.gradient == nil) {
        [self drawWithFill: pathOptions.backgroundColor];
    } else {
        [pathOptions.gradient drawInBezierPath: self angle: 90];
    }

    if (pathOptions.innerShadow != nil) {
        [self drawShadow: pathOptions.innerShadow];
    }
    if (pathOptions.borderType == BorderTypeAll) {
        [self drawWithBorderOption: pathOptions.borderOption];
    }

    [pathOptions.gradient drawInBezierPath: self angle: 90];


    //    if (pathOptions.gradient != nil) {
    //        [pathOptions.gradient drawInBezierPath: self angle: 90];
    //    }
    //    else {
    //
    ////        [self drawWithFill: pathOptions.backgroundColor];
    //    }


    //    if (pathOptions.innerShadow != nil) {
    //        [self drawShadow: pathOptions.innerShadow];
    //    }
    //    if (pathOptions.borderType == BorderTypeAll) {
    //        [self drawStroke: pathOptions.borderColor width: pathOptions.borderWidth];
    //    }
}


#pragma mark Gradient




- (void) drawWithFill: (NSColor *) aColor {
    [NSGraphicsContext saveGraphicsState];
    [aColor setFill];
    [self fill];
    [NSGraphicsContext restoreGraphicsState];
}

- (void) drawGradient: (NSGradient *) gradient {
    [self drawGradient: gradient angle: 90.0f];

}

- (void) drawGradient: (NSGradient *) gradient angle: (CGFloat) angle {
    [NSGraphicsContext saveGraphicsState];
    [gradient drawInBezierPath: self angle: angle];
    //    [gradient drawInRect: self.bounds angle: angle];
    //    [self setClip];
    [NSGraphicsContext restoreGraphicsState];
}


#pragma mark Stroke


- (void) drawStroke: (NSColor *) strokeColor {
    [self drawStroke: strokeColor width: 1.0];
}

- (void) drawStroke: (NSColor *) strokeColor width: (CGFloat) borderWidth {
    if (borderWidth == 0.0) return;
    [NSGraphicsContext saveGraphicsState];
    [strokeColor setStroke];
    [self setLineWidth: borderWidth];
    [self setLineCapStyle: NSRoundLineCapStyle];
    [self setLineJoinStyle: NSBevelLineJoinStyle];
    [self stroke];
    [NSGraphicsContext restoreGraphicsState];
}




#pragma mark Shadow

- (void) drawShadow: (NSShadow *) shadow {
    //    [self drawShadow: shadow shadowOpacity: 0.5];
    [shadow.shadowColor set];
    [shadow.shadowColor setStroke];
    [NSGraphicsContext saveGraphicsState];
    [self setClip];
    [shadow set];
    [self stroke];
    [NSGraphicsContext restoreGraphicsState];
}


- (void) drawShadow: (NSShadow *) shadow shadowOpacity: (CGFloat) sOpacity {
    NSColor *alphaShadowColor = [shadow.shadowColor colorWithAlphaComponent: sOpacity];

    [NSGraphicsContext saveGraphicsState];
    [shadow set];
    [alphaShadowColor setFill];
    [self fill];
    [NSGraphicsContext restoreGraphicsState];
}


- (void) drawShadowColor: (NSColor *) sColor shadowRadius: (CGFloat) sRadius shadowOffset: (NSSize) sOffset shadowOpacity: (CGFloat) sOpacity {
    NSShadow *theShadow = [[NSShadow alloc] init];
    theShadow.shadowColor = sColor;
    theShadow.shadowBlurRadius = sRadius;
    theShadow.shadowOffset = sOffset;
    [self drawShadow: theShadow shadowOpacity: sOpacity];
}


- (void) drawImage: (NSImage *) image {
    [NSGraphicsContext saveGraphicsState];
    [self addClip];
    [image drawInRect: self.bounds fromRect: NSZeroRect operation: NSCompositeSourceOver fraction: 1.0];
    [NSGraphicsContext restoreGraphicsState];

}
@end