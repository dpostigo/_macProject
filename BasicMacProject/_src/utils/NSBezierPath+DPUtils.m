//
// Created by Daniela Postigo on 5/19/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSBezierPath+DPUtils.h"
#import "PathOptions.h"
#import "NSBezierPath+Additions.h"


@implementation NSBezierPath (DPUtils)


+ (NSBezierPath *) bezierPathWithRect: (NSRect) rect cornerRadius: (CGFloat) radius options: (NSBezierPathCornerOptions) options {

    rect = NSInsetRect(rect, 0.5, 0.5);

    if (radius == 0.0) return [NSBezierPath bezierPathWithRect: rect];
    NSBezierPath *path = [NSBezierPath bezierPath];

    NSPoint endPoint;
    NSPoint thruPoint;


    [path moveToPoint: NSMakePoint(radius, 0)];
    [path lineToPoint: NSMakePoint(rect.size.width - radius, 0)];

    endPoint = NSMakePoint(rect.size.width, radius);
    thruPoint = NSMakePoint(rect.size.width, 0);
    if (options & NSBezierPathLowerRight) {
        [path appendBezierPathWithArcFromPoint: thruPoint toPoint: endPoint radius: radius];
    } else {
        [path lineToPoint: thruPoint];
        [path lineToPoint: endPoint];
    }


    endPoint = NSMakePoint(rect.size.width - radius, rect.size.height);
    thruPoint = NSMakePoint(rect.size.width, rect.size.height);
    if (options & NSBezierPathUpperRight) {
        [path appendBezierPathWithArcFromPoint: thruPoint toPoint: endPoint radius: radius];
    } else {
        [path lineToPoint: thruPoint];
        [path lineToPoint: endPoint];
    }


    endPoint = NSMakePoint(0, rect.size.height - radius);
    thruPoint = NSMakePoint(0, rect.size.height);
    if (options & NSBezierPathUpperLeft) {
        [path appendBezierPathWithArcFromPoint: thruPoint toPoint: endPoint radius: radius];
    } else {
        [path lineToPoint: thruPoint];
        [path lineToPoint: endPoint];
    }


    endPoint = NSMakePoint(radius, 0);
    thruPoint = NSMakePoint(0, 0);
    if (options & NSBezierPathLowerLeft) {
        [path appendBezierPathWithArcFromPoint: thruPoint toPoint: endPoint radius: radius];
    } else {
        [path lineToPoint: thruPoint];
        [path lineToPoint: endPoint];

    }

    [path closePath];
    return path;
}

#pragma mark Path Options

+ (void) drawBezierPathWithRect: (NSRect) rect options: (PathOptions *) pathOptions {
    NSBezierPath *path = [NSBezierPath bezierPathWithRect: rect options: pathOptions];
    [path drawWithPathOptions: pathOptions];


    for (BorderOption *borderOption in pathOptions.borderOptions) {
        if (borderOption.borderType & BorderTypeAll) [path drawWithBorderOption: borderOption];
        else {
            NSBezierPath *borderPath = [NSBezierPath bezierPathWithRect: rect borderType: borderOption.borderType];
            [borderPath drawWithBorderOption: borderOption];
        }
    }
}


+ (NSBezierPath *) bezierPathWithRect: (NSRect) rect options: (PathOptions *) pathOptions {
    NSBezierPath *path = [NSBezierPath bezierPathWithRect: rect cornerRadius: pathOptions.cornerRadius options: pathOptions.cornerOptions];
    return path;
}


+ (NSBezierPath *) bezierPathWithRect: (NSRect) rect borderType: (BorderType) borderType {
    NSBezierPath *path = [NSBezierPath bezierPath];

    if (borderType & BorderTypeTop) {
        [path moveToPoint: NSMakePoint(0, 0)];
        [path lineToPoint: NSMakePoint(rect.size.width, 0)];
    }
    if (borderType & BorderTypeBottom) {
        [path moveToPoint: NSMakePoint(0, rect.size.height)];
        [path lineToPoint: NSMakePoint(rect.size.width, rect.size.height)];
    }
    if (borderType & BorderTypeLeft) {
        [path moveToPoint: NSMakePoint(0, 0)];
        [path lineToPoint: NSMakePoint(0, rect.size.height)];
    }
    if (borderType & BorderTypeRight) {
        [path moveToPoint: NSMakePoint(rect.size.width, 0)];
        [path lineToPoint: NSMakePoint(rect.size.width, rect.size.height)];
    }
    return path;
}


- (void) drawWithBorderOption: (BorderOption *) borderOption {
    [self drawStroke: borderOption.borderColor width: borderOption.borderWidth];

}

- (void) drawWithPathOptions: (PathOptions *) pathOptions {
    if (pathOptions.gradient != nil) [pathOptions.gradient drawInBezierPath: self angle: 90];
    else [self drawWithFill: pathOptions.backgroundColor];
    if (pathOptions.horizontalGradient != nil) [pathOptions.horizontalGradient drawInBezierPath: self angle: 0];
    if (pathOptions.innerShadow != nil) [self drawShadow: pathOptions.innerShadow];
    if (pathOptions.borderType == BorderTypeAll) [self drawStroke: pathOptions.borderColor width: pathOptions.borderWidth];
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