//
// Created by Daniela Postigo on 5/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "NSBezierPath+Additions.h"
#import "BasicTableRowView.h"


@interface BasicCustomRowView : BasicTableRowView {

    CGFloat borderWidth;
    CGFloat cornerRadius;
    CGFloat shadowOpacity;

    NSColor *borderColor;
    NSColor *backgroundFillColor;
    NSGradient *gradient;
    NSGradient *selectedGradient;
    JSRoundedCornerOptions cornerOptions;

    NSShadow *shadow;
    NSRect insetRect;
}


@property(nonatomic) JSRoundedCornerOptions cornerOptions;
@property(nonatomic) CGFloat cornerRadius;

@property(nonatomic, strong) NSColor *borderColor;
@property(nonatomic, strong) NSGradient *gradient;
@property(nonatomic, strong) NSColor *backgroundFillColor;

@property(nonatomic) CGFloat shadowOpacity;
@property(nonatomic, strong) NSShadow *shadow;

@property(nonatomic) NSRect insetRect;
@property(nonatomic) CGFloat borderWidth;
@property(nonatomic, strong) NSGradient *selectedGradient;
- (NSRect) modifiedRect: (NSRect) rect;
- (void) drawBackgroundInRect: (NSRect) dirtyRect selected: (BOOL) selected;
@end