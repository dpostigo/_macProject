//
//  BasicDisplayView+Carts.m
//  Carts
//
//  Created by Daniela Postigo on 11/7/13.
//  Copyright (c) 2013 Daniela Postigo. All rights reserved.
//

#import "BasicDisplayView+Carts.h"
#import "NSColor+CartsUtils.h"
#import "BasicInnerShadowView.h"
#import "BasicDisplayView+SurrogateUtils.h"
#import "BasicShadow.h"

@implementation BasicDisplayView (Carts)

+ (BasicDisplayView *) basicBackground {
    BasicInnerShadowView *aView = [[BasicInnerShadowView alloc] init];
    aView.innerShadow.shadowColor = [NSColor blackColor];
    aView.innerShadow.shadowOffset = NSMakeSize(-1, -1);
    aView.backgroundColor = [NSColor desaturatedDarkSlateHighlight];
    aView.borderWidth = 0;
    return aView;

}


+ (BasicDisplayView *) newWithBackgroundColor: (NSColor *) aColor {
    BasicDisplayView *ret = [[BasicDisplayView alloc] init];
    ret.backgroundColor = aColor;
    return ret;

}
@end