//
//  VeryBasicButton.m
//  Carts
//
//  Created by Daniela Postigo on 7/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "VeryBasicButton.h"

@implementation VeryBasicButton {

}

+ (Class) cellClass {
    return NSClassFromString([NSString stringWithFormat: @"%@%@", NSStringFromClass([self class]), @"Cell"]);
}


- (id) init {
    self = [super init];
    if (self) {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        self.imagePosition = NSImageBelow;
        self.alignment = NSCenterTextAlignment;

    }

    return self;
}


@end