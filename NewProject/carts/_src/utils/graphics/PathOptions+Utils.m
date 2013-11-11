//
//  PathOptions+Utils.m
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "PathOptions+Utils.h"

@implementation PathOptions (Utils)

+ (PathOptions *) defaultPathOptions {
    PathOptions *ret = [[PathOptions alloc] init];
    ret.gradient = [[BasicGradient alloc] initWithTopColor: [NSColor colorWithString: @"414957"] bottomColor: [NSColor colorWithString: @"313641"] percent: 0.5];
    ret.cornerRadius = 5;
    ret.cornerType = CornerUpperLeft | CornerUpperRight | CornerLowerLeft | CornerLowerRight;
    [ret setBorderWidth: 0.5 borderColor: [NSColor blackColor]];
    [ret addBorder: [BorderOption topBorderWithGradient: [BasicGradient whiteShineGradient] borderWidth: 0.5]];
    return ret;
}


- (NSRect) rectForPathOptions: (NSRect) rect {

    if (self.borderWidth > 0 && ![self.borderColor isEqualTo: [NSColor clearColor]]) {
        rect = NSInsetRect(rect, self.borderWidth, self.borderWidth);
    }

    return rect;
}

- (void) addBorder: (BorderOption *) aBorder {
    [self.borderOptions addObject: aBorder];
}

- (void) setBorderWidth: (CGFloat) aBorderWidth borderColor: (NSColor *) aBorderColor {
    self.borderWidth = aBorderWidth;
    self.borderColor = aBorderColor;
}

- (BorderOption *) borderAtIndex: (NSInteger) index {
    return index > [self.borderOptions count] ? nil : [self.borderOptions objectAtIndex: index];
}

@end