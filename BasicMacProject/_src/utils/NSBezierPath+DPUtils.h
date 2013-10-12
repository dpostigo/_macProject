//
// Created by Daniela Postigo on 5/19/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import "BorderOption.h"
#import "CornerProperties.h"
#import "PathOptions.h"

//@class PathOptions;


@interface NSBezierPath (DPUtils)

+ (NSBezierPath *) bezierPathWithRect: (NSRect) rect cornerRadius: (CGFloat) radius cornerType: (CornerType) options;
+ (void) drawBezierPathWithRect: (NSRect) rect options: (PathOptions *) pathOptions;
+ (void) drawBezierPathWithRect: (NSRect) rect borderOptions: (BorderOption *) borderOption;
+ (NSBezierPath *) bezierPathWithRect: (NSRect) rect pathOptions: (PathOptions *) pathOptions;
+ (NSBezierPath *) bezierPathWithRect: (NSRect) rect borderType: (BorderType) borderType;
- (void) drawWithBorderOption: (BorderOption *) borderOption;
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