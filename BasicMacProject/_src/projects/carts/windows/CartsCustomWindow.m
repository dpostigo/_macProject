//
//  CartsCustomWindow.m
//  Carts
//
//  Created by Daniela Postigo on 6/29/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartsCustomWindow.h"


@implementation CartsCustomWindow




- (id) initWithContentRect: (NSRect) contentRect styleMask: (NSUInteger) aStyle backing: (NSBackingStoreType) bufferingType defer: (BOOL) flag {
    self = [super initWithContentRect: contentRect styleMask: aStyle backing: bufferingType defer: flag];
    if (self) {
        self.buttonHeight = 30.0;
        self.buttonSpacing = 8.0;
//        self.windowFramePadding = 1.0;

    }

    return self;
}


#pragma mark Class


@end