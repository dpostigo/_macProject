//
// Created by Dani Postigo on 12/28/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CALayer+ConstraintUtils.h"

@implementation CALayer (ConstraintUtils)

- (void) superConstrain {
    [self constrainToSuperlayerWidth];
    [self constrainToSuperlayerHeight];
}

- (void) constrainToSuperlayerWidth {

    [self superConstrain: kCAConstraintWidth offset: 0];
    [self superConstrain: kCAConstraintMidX offset: 0];
    if (self.superlayer) self.superlayer.layoutManager = [CAConstraintLayoutManager layoutManager];
}

- (void) constrainToSuperlayerHeight {
    [self addConstraint: [CAConstraint constraintWithAttribute: kCAConstraintHeight relativeTo: @"superlayer" attribute: kCAConstraintHeight]];
    [self addConstraint: [CAConstraint constraintWithAttribute: kCAConstraintMidY relativeTo: @"superlayer" attribute: kCAConstraintMidY]];
    if (self.superlayer) self.superlayer.layoutManager = [CAConstraintLayoutManager layoutManager];
}


- (void) constrainToSuperlayerBottom {
    [CAConstraint constraintWithAttribute: kCAConstraintMaxY relativeTo: @"superlayer" attribute: kCAConstraintMaxY offset: 0];
}


- (void) superConstrainEdges: (CGFloat) offset {
    [self superConstrain: kCAConstraintMinX offset: offset];
    [self superConstrain: kCAConstraintMaxX offset: -offset];
    [self superConstrain: kCAConstraintMinY offset: offset];
    [self superConstrain: kCAConstraintMaxY offset: -offset];
}


- (void) superConstrain: (CAConstraintAttribute) edge {
    [self superConstrain: edge offset: 0];
}


- (void) superConstrain: (CAConstraintAttribute) edge offset: (CGFloat) offset {
    [self superConstrain: edge to: edge offset: offset];
}


- (void) superConstrain: (CAConstraintAttribute) subviewEdge to: (CAConstraintAttribute) superlayerEdge {
    [self superConstrain: subviewEdge to: superlayerEdge offset: 0];
}

- (void) superConstrain: (CAConstraintAttribute) subviewEdge to: (CAConstraintAttribute) superlayerEdge offset: (CGFloat) offset {
    [self addConstraint: [CAConstraint constraintWithAttribute: subviewEdge relativeTo: @"superlayer" attribute: superlayerEdge offset: offset]];
}


- (void) setDefaultLayoutManager {
    self.layoutManager = [CAConstraintLayoutManager layoutManager];
}

- (void) makeSuperlayer {
    [self setDefaultLayoutManager];
}
@end