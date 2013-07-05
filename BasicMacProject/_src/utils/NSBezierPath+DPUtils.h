//
// Created by Daniela Postigo on 5/19/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>

@class PathOptions;

typedef enum {
    NSBezierPathUpperRight = 1 << 0,
    NSBezierPathLowerRight = 1 << 1,
    NSBezierPathLowerLeft  = 1 << 2,
    NSBezierPathUpperLeft  = 1 << 3,
} NSBezierPathCornerOptions;


@interface NSBezierPath (DPUtils)


+ (NSBezierPath *) bezierPathWithRect: (NSRect) rect cornerRadius: (CGFloat) radius options: (NSBezierPathCornerOptions) options;
- (void) drawWithPathOptions: (PathOptions *) pathOptions;
- (void) drawWithFill: (NSColor *) aColor;
- (void) drawGradient: (NSGradient *) gradient;
- (void) drawGradient: (NSGradient *) gradient angle: (CGFloat) angle;
- (void) drawStroke: (NSColor *) strokeColor;
- (void) drawStroke: (NSColor *) strokeColor width: (CGFloat) borderWidth;
- (void) drawShadow: (NSShadow *) shadow1;
- (void) drawShadow: (NSShadow *) shadow1 shadowOpacity: (CGFloat) sOpacity;
- (void) drawShadowColor: (NSColor *) sColor shadowRadius: (CGFloat) sRadius shadowOffset: (NSSize) sOffset shadowOpacity: (CGFloat) sOpacity;
- (void) drawImage: (NSImage *) image;
@end