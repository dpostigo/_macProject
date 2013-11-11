//
// Created by Daniela Postigo on 5/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "NSBezierPath+Additions.h"
#import "BasicTableRowView.h"
#import "PathOptions.h"

@interface BasicCustomRowView : BasicTableRowView {

    CGFloat shadowOpacity;

    NSGradient *selectedGradient;

    NSRect insetRect;
    PathOptions *selectedPathOptions;
}

@property(nonatomic) CGFloat cornerRadius;
@property(nonatomic) CGFloat borderWidth;
@property(nonatomic, strong) NSGradient *gradient;
@property(nonatomic, strong) NSGradient *horizontalGradient;
@property(nonatomic, strong) NSColor *borderColor;
@property(nonatomic, strong) NSColor *innerBorderColor;
@property(nonatomic, strong) NSShadow *innerShadow;
@property(nonatomic, strong) NSShadow *outerShadow;
@property(nonatomic) CornerType cornerOptions;
@property(nonatomic) BorderType borderType;


@property(nonatomic, strong) NSGradient *selectedGradient;


@property(nonatomic) NSRect insetRect;
@property(nonatomic, strong) PathOptions *selectedPathOptions;
- (NSRect) modifiedRect: (NSRect) rect;
- (void) drawBackgroundInRect: (NSRect) dirtyRect selected: (BOOL) selected;
- (BorderType) borderType;
@end