//
//  AutoLayoutHelpers.h
//
//  Created by Mo Bitar on 5/8/13.
//

#import "NSView+Autolayout.h"
#import <Foundation/Foundation.h>

NSLayoutConstraint *constraintAttributeWithPriority(NSView *item1, NSView *item2, NSLayoutAttribute attribute,
        CGFloat offset, NSLayoutPriority priority);

NSLayoutConstraint *constraintEqual(NSView *item1, NSView *item2, NSLayoutAttribute attribute, CGFloat offset);
NSLayoutConstraint *constraintEqualAttributes(NSView *item1, NSView *item2, NSLayoutAttribute attribute1, NSLayoutAttribute attribute2, CGFloat offset);
NSLayoutConstraint *constraintEqualWithMultiplier(NSView *item1, NSView *item2, NSLayoutAttribute attribute, CGFloat offset, CGFloat multiplier);

NSLayoutConstraint *constraintEqualAttributesWithMultiplier(NSView *item1, NSView *item2, NSLayoutAttribute attribute1,
        NSLayoutAttribute attribute2, CGFloat offset, CGFloat multiplier);

NSLayoutConstraint *constraintCenterX(NSView *item1, NSView *item2);
NSLayoutConstraint *constraintCenterXWithOffset(NSView *item1, NSView *item2, CGFloat offset);

NSLayoutConstraint *constraintCenterY(NSView *item1, NSView *item2);
NSLayoutConstraint *constraintCenterYWithOffset(NSView *item1, NSView *item2, CGFloat offset);

NSLayoutConstraint *constraintTrailVertically(NSView *item1, NSView *item2, CGFloat offset);
NSLayoutConstraint *constraintTrailHorizontally(NSView *item1, NSView *item2, CGFloat offset);

NSLayoutConstraint *constraintLeadVertically(NSView *item1, NSView *item2, CGFloat offset);
NSLayoutConstraint *constraintLeadHorizontally(NSView *item1, NSView *item2, CGFloat offset);

NSLayoutConstraint *constraintWidth(NSView *item1, NSView *item2);
NSLayoutConstraint *constraintWidthWithOffset(NSView *item1, NSView *item2, CGFloat offset);
NSLayoutConstraint *constraintHeight(NSView *item1, NSView *item2);
NSLayoutConstraint *constraintHeightWithOffset(NSView *item1, NSView *item2, CGFloat offset);


NSLayoutConstraint *constraintTop(NSView *item1, NSView *item2, CGFloat offset);
NSLayoutConstraint *constraintBottom(NSView *item1, NSView *item2, CGFloat offset);
NSLayoutConstraint *constraintLeft(NSView *item1, NSView *item2, CGFloat offset);
NSLayoutConstraint *constraintRight(NSView *item1, NSView *item2, CGFloat offset);

NSLayoutConstraint *constraintAbsolute(NSView *item1, NSLayoutAttribute attribute, CGFloat offset);

NSArray *constraintsAbsoluteSize(NSView *item, CGFloat width, CGFloat height);
NSArray *constraintsCenter(NSView *item, NSView *centerTo);
NSArray *constraintsCenterWithOffset(NSView *item, NSView *centerTo, CGFloat xOffset, CGFloat yOffset);
NSArray *constraintsEqualSize(NSView *item1, NSView *item2, CGFloat widthOffset, CGFloat heightOffset);
NSArray *constraintsEqualPosition(NSView *item1, NSView *item2, CGFloat xOffset, CGFloat yOffset);
NSArray *constraintsEqualSizeAndPosition(NSView *item1, NSView *item2);
NSArray *constraintsHeightNotGreaterThanConstant(NSView *item1, NSView *item2, CGFloat constant);
NSArray *constraintsHeightGreaterThanOrEqual(NSView *item1, NSView *item2);