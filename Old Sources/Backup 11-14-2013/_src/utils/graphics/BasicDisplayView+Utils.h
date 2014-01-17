//
//  BasicDisplayView+PositionUtils.h
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicDisplayView.h"

@class BasicGradient;
@class BasicFill;
@class BorderOption;

@interface BasicDisplayView (Utils)

- (void) addGradient: (BasicGradient *) aGradient;
- (void) removeGradient: (BasicGradient *) aGradient;
- (void) addFill: (BasicFill *) aFill;
- (void) removeFill: (BasicFill *) aFill;
- (void) addBorder: (BorderOption *) aBorder;
- (void) setBorderWidth: (CGFloat) aBorderWidth borderColor: (NSColor *) aBorderColor;
- (BasicFill *) fillForGradient: (BasicGradient *) aGradient;

@end