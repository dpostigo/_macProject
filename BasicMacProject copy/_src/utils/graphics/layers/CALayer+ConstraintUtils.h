//
// Created by Dani Postigo on 12/28/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface CALayer (ConstraintUtils)

- (void) constrainToSuperlayer;
- (void) constrainToSuperlayerWidth;
- (void) constrainToSuperlayerHeight;
- (void) constrainToSuperlayerBottom;
- (void) superConstrain: (CAConstraintAttribute) edge;
- (void) superConstrain: (CAConstraintAttribute) edge offset: (CGFloat) offset;
- (void) superConstrain: (CAConstraintAttribute) subviewEdge to: (CAConstraintAttribute) superlayerEdge;
- (void) superConstrain: (CAConstraintAttribute) subviewEdge to: (CAConstraintAttribute) superlayerEdge offset: (CGFloat) offset;
- (void) setDefaultLayoutManager;
- (void) makeSuperlayer;
@end