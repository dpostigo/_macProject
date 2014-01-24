//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "NSViewController+Carts.h"
#import "Model.h"

@implementation NSViewController (Carts)

- (Model *) model {
    return [Model sharedModel];
}

@end