//
// Created by Daniela Postigo on 5/22/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "PathOptions.h"
#import "ImageOptions.h"


@interface VeryBasicButtonCell : NSButtonCell {

    PathOptions *pathOptions;
    PathOptions *disabledPathOptions;
    PathOptions *highlightedPathOptions;
    PathOptions *innerStrokeOptions;

    ImageOptions *imageOptions;


    BOOL autoAdjustsCornerRadius;

    NSColor *disabledInnerStrokeColor;
}


@property(nonatomic) CGFloat cornerRadius;
@property(nonatomic) CGFloat borderWidth;
@property(nonatomic, strong) NSShadow *innerShadow;
@property(nonatomic, strong) NSShadow *outerShadow;
@property(nonatomic, strong) NSGradient *gradient;
@property(nonatomic, strong) NSGradient *horizontalGradient;
@property(nonatomic, strong) NSColor *borderColor;
@property(nonatomic, strong) NSColor *innerBorderColor;
@property(nonatomic) NSBezierPathCornerOptions cornerOptions;
@property(nonatomic, strong) PathOptions *pathOptions;
@property(nonatomic, strong) NSArray *borderOptions;


@property(nonatomic, strong) NSColor *innerStrokeColor;
@property(nonatomic, strong) NSColor *highlightedColor;
@property(nonatomic) BOOL autoAdjustsCornerRadius;
@property(nonatomic, strong) NSGradient *disabledGradientColor;
@property(nonatomic, strong) NSColor *disabledStrokeColor;
@property(nonatomic, strong) NSColor *disabledInnerStrokeColor;
@property(nonatomic, strong) PathOptions *disabledPathOptions;
@property(nonatomic, strong) ImageOptions *imageOptions;
@property(nonatomic, strong) PathOptions *highlightedPathOptions;
@property(nonatomic, strong) PathOptions *innerStrokeOptions;
- (void) setup;
- (void) drawOuter: (NSGraphicsContext *) context frame: (NSRect) frame;
- (void) drawStroke: (NSGraphicsContext *) context frame: (NSRect) frame;
- (void) drawInnerStroke: (NSGraphicsContext *) context frame: (NSRect) frame;
- (void) drawBackgroundFill: (NSGraphicsContext *) context frame: (NSRect) frame;
- (void) drawHighlight: (NSGraphicsContext *) context frame: (NSRect) frame;
@end
