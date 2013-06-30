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


@synthesize cornerRadius;
@synthesize cornerOptions;
@synthesize borderColor;
@synthesize borderWidth;
@synthesize gradient;
@synthesize selectedGradient;
@synthesize backgroundFillColor;

@synthesize shadow;
@synthesize shadowOpacity;


@synthesize insetRect;


- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {

        insetRect = NSZeroRect;

        shadow = [[NSShadow alloc] init];
        shadow.shadowColor = [NSColor blackColor];
        shadow.shadowBlurRadius = 2.0;
        shadow.shadowOffset = NSMakeSize(0, -1);
        shadowOpacity = 0.5;

        cornerRadius = 2.0;
        cornerOptions = JSUpperLeftCorner | JSUpperRightCorner | JSLowerLeftCorner | JSLowerRightCorner;
        backgroundFillColor = [NSColor colorWithCalibratedWhite: 0.89 alpha: 1.0];
        borderColor = [NSColor whiteColor];
        borderWidth = 1.0;
        gradient = [[NSGradient alloc] initWithColorsAndLocations:
                [NSColor colorWithDeviceWhite: 0.85f alpha: 1.0f], 0.0f,
                [NSColor colorWithDeviceWhite: 0.90f alpha: 1.0f], 0.2f,
                [NSColor colorWithDeviceWhite: 0.93f alpha: 1.0f], 0.5f,
                [NSColor colorWithDeviceWhite: 0.94f alpha: 1.0f], 0.7f,
                [NSColor colorWithDeviceWhite: 0.95f alpha: 1.0f], 1.0f,
                nil];

        selectedGradient = [[NSGradient alloc] initWithColorsAndLocations:
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

    NSBezierPath *roundedPath = [NSBezierPath bezierPathWithRoundedRect: dirtyRect corners: cornerOptions radius: cornerRadius];
    [roundedPath drawShadow: shadow shadowOpacity: shadowOpacity];


    NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect: dirtyRect corners: cornerOptions radius: cornerRadius];
    [path drawGradient: self.selected ? selectedGradient : gradient angle: -90];
    [path drawStroke: borderColor width: borderWidth];
}

//
//- (void) setSelected: (BOOL) selected {
//    if (selected != self.isSelected) [self setNeedsDisplay: YES];
//    [super setSelected: selected];
//}


- (BOOL) isOpaque {
    return NO;
}

@end