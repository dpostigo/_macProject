//
// Created by Dani Postigo on 1/23/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "DividerSplitView.h"

@implementation DividerSplitView

@synthesize dividerColor;

- (void) awakeFromNib {
    [super awakeFromNib];

//    for (NSLayoutConstraint *constraint in self.constraints) {
//        if (constraint.firstAttribute == NSLayoutAttributeWidth && constraint.relation == NSLayoutRelationEqual) {
//            [self removeConstraint: constraint];
//        }
//    }

}


- (NSColor *) dividerColor {
    if (dividerColor == nil) {
        dividerColor = [NSColor clearColor];
    }
    return dividerColor;
}


@end