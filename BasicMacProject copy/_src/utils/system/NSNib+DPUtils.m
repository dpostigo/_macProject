//
// Created by Dani Postigo on 12/29/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSNib+DPUtils.h"

@implementation NSNib (DPUtils)

- (NSArray *) viewControllers {

    NSMutableArray *ret = [[NSMutableArray alloc] init];

    NSArray *objects = nil;
    [self instantiateNibWithOwner: self topLevelObjects: &objects];

    for (id object in objects) {
        if ([object isKindOfClass: [NSViewController class]]) {
            [ret addObject: object];
        }
    }
    return ret;
}


- (id) viewControllerForClass: (Class) class {
    NSViewController *ret = nil;
    NSArray *controllers = self.viewControllers;

    for (NSViewController *controller in controllers) {
        if ([controller isKindOfClass: class]) {
            ret = controller;
            break;
        }
    }
    return ret;
}
@end