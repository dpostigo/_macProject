//
// Created by Daniela Postigo on 5/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicCustomRowView.h"
#import "NSBezierPath+Additions.h"
#import "NSBezierPath+DPUtils.h"


#define INSETX 16.0f
#define INSETY 7.0f
#define RADIUS 3.0f
#define LEFT_RECT_WIDTH 125.0f // this is the width of the grey part of the cell
#define SHADOW_BLUR_RADIUS 4.0f
#define SHADOW_OPACITY 0.4f
#define SHADOW_OFFSET_X 2.0f
#define SHADOW_OFFSET_Y -2.0f
#define LEFT_SIDE_CELL_COLOR [NSColor colorWithCalibratedWhite:0.89 alpha:1.0]
#define LEFT_SIDE_CELL_COLOR_SELECTED [NSColor colorWithCalibratedRed:0.608 green:0.784 blue:0.910 alpha:1.0]
#define RIGHT_SIDE_CELL_COLOR [NSColor colorWithCalibratedWhite:0.8 alpha:1.0]
#define CELL_BORDER_COLOR [NSColor whiteColor]


@implementation BasicCustomRowView


@synthesize selectedGradient;

@synthesize insetRect;
@synthesize pathOptions;

@synthesize selectedPathOptions;

- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {

        insetRect = NSZeroRect;

        pathOptions = [[PathOptions alloc] init];
        pathOptions.cornerRadius = 0.0;
        pathOptions.cornerOptions = NSBezierPathUpperLeft | NSBezierPathUpperRight | NSBezierPathLowerLeft | NSBezierPathLowerRight;
        pathOptions.borderColor = [NSColor whiteColor];
        pathOptions.borderWidth = 1.0;
        pathOptions.gradient = [[NSGradient alloc] initWithColorsAndLocations:
                [NSColor colorWithWhite: 0.95], 0.0,
                [NSColor colorWithWhite: 0.94], 0.3,
                [NSColor colorWithWhite: 0.93], 0.5,
                [NSColor colorWithWhite: 0.90], 0.8,
                [NSColor colorWithWhite: 0.85], 1.0,
                nil];


        pathOptions.outerShadow = [[NSShadow alloc] init];
        pathOptions.outerShadow.shadowColor = [NSColor blackColor];
        pathOptions.outerShadow.shadowBlurRadius = 2.0;
        pathOptions.outerShadow.shadowOffset = NSMakeSize(0, -1);

        selectedPathOptions = [pathOptions copy];
        selectedPathOptions.gradient = [[NSGradient alloc] initWithColorsAndLocations:
                [NSColor colorWithDeviceWhite: 0.2 alpha: 1.0f], 0.0,
                [NSColor colorWithDeviceWhite: 0.3 alpha: 1.0f], 0.2,
                [NSColor colorWithDeviceWhite: 0.2 alpha: 1.0f], 1.0,
                nil];

    }

    return self;
}

- (void) setFrame: (NSRect) frameRect {
    [super setFrame: frameRect];
    [self setNeedsDisplay: YES];
}


- (NSRect) modifiedRect: (NSRect) rect {
    rect.origin.x += insetRect.origin.x;
    rect.origin.y += insetRect.origin.y;
    rect.size.width += insetRect.size.width;
    rect.size.height += insetRect.size.height;
    return rect;
}

- (void) drawBackgroundInRect: (NSRect) dirtyRect {
    BOOL selected = self.isSelected;
    NSRect rect = [self modifiedRect: self.bounds];
    [self drawBackgroundInRect: rect selected: selected];
}


- (void) drawBackgroundInRect: (NSRect) dirtyRect selected: (BOOL) selected {
    //    NSBezierPath *roundedPath = [NSBezierPath bezierPathWithRoundedRect: dirtyRect corners: self.cornerOptions radius: self.cornerRadius];
    //    [roundedPath drawShadow: self.shadow shadowOpacity: shadowOpacity];


//    NSBezierPath *path = [NSBezierPath bezierPathWithRect: dirtyRect options: pathOptions];
//    [path drawWithPathOptions: self.selected ? selectedPathOptions : pathOptions];
//
//    NSBezierPath *borderPath = [NSBezierPath bezierPathWithRect: dirtyRect borderType: pathOptions.borderOption.borderType];
//    [borderPath drawWithBorderOption: pathOptions.borderOption];

    [NSBezierPath drawBezierPathWithRect: dirtyRect options: pathOptions];
}


- (BOOL) isOpaque {
    return NO;
}


#pragma mark Getters / Setters

- (void) setCornerOptions: (NSBezierPathCornerOptions) cornerOptions1 {
    pathOptions.cornerOptions = cornerOptions1;
}

- (NSBezierPathCornerOptions) cornerOptions {
    return pathOptions.cornerOptions;
}


- (CGFloat) cornerRadius {
    return pathOptions.cornerRadius;
}

- (void) setCornerRadius: (CGFloat) cornerRadius1 {
    pathOptions.cornerRadius = cornerRadius1;
}

- (NSColor *) borderColor {
    return pathOptions.borderColor;
}

- (void) setBorderColor: (NSColor *) borderColor1 {
    pathOptions.borderColor = borderColor1;
}

- (CGFloat) borderWidth {
    return pathOptions.borderWidth;
}

- (void) setBorderWidth: (CGFloat) borderWidth1 {
    pathOptions.borderWidth = borderWidth1;
}

- (BorderType) borderType {
    return pathOptions.borderOption.borderType;
}

- (void) setBorderType: (BorderType) borderType {
    pathOptions.borderOption.borderType = borderType;
}

- (NSGradient *) gradient {
    return pathOptions.gradient;
}

- (void) setGradient: (NSGradient *) gradient1 {
    pathOptions.gradient = gradient1;
}

- (NSShadow *) innerShadow {
    return pathOptions.innerShadow;
}

- (void) setInnerShadow: (NSShadow *) innerShadow {
    pathOptions.innerShadow = innerShadow;
}

- (NSShadow *) outerShadow {
    return pathOptions.outerShadow;
}

- (void) setOuterShadow: (NSShadow *) outerShadow {
    pathOptions.outerShadow = outerShadow;
}

@end