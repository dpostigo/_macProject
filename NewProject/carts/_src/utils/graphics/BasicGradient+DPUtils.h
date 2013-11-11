//
//  BasicGradient+DPUtils.h
//  Carts
//
//  Created by Daniela Postigo on 10/20/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicGradient.h"

@interface BasicGradient (DPUtils)

+ (BasicGradient *) darkeningGradientWithColor: (NSColor *) aColor percent: (CGFloat) percentage;
+ (BasicGradient *) darkeningGradientWithColor: (NSColor *) aColor percent: (CGFloat) percentage darkAmount: (CGFloat) amount;
@end