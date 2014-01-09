//
//  NSObject+InstanceName.m
//  Carts
//
//  Created by Daniela Postigo on 11/1/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSObject+InstanceName.h"
#import <objc/runtime.h>

@implementation NSObject (InstanceName)

- (NSString *) propertyName: (id) property {
    unsigned int numIvars = 0;
    NSString *key = nil;
    Ivar *ivars = class_copyIvarList([self class], &numIvars);
    for (int i = 0; i < numIvars; i++) {
        Ivar thisIvar = ivars[i];
        if ((object_getIvar(self, thisIvar) == property)) {
            key = [NSString stringWithUTF8String: ivar_getName(thisIvar)];
            break;
        }
    }
    free(ivars);
    return key;
}
@end