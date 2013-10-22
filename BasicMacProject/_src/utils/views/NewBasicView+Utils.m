//
//  NewBasicView+Utils.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NewBasicView+Utils.h"

@implementation NewBasicView (Utils)

+ (NewBasicView *) basicViewFromView: (NSView *) view {

    NewBasicView *ret = [[NewBasicView alloc] init];
    if (view != nil) {
        ret.frame = view.frame;
        ret.autoresizingMask = view.autoresizingMask;
        ret.autoresizesSubviews = view.autoresizesSubviews;

        for (NSView *subview in view.subviews) {
            [ret addSubview: subview];
        }
    }

    return ret;

}
@end