//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "BOWindow.h"
#import "Model.h"

@implementation BOWindow {
}

- (id) initWithContentRect: (NSRect) contentRect styleMask: (NSUInteger) aStyle backing: (NSBackingStoreType) bufferingType defer: (BOOL) flag {
    self = [super initWithContentRect: contentRect styleMask: aStyle backing: bufferingType defer: flag];
    if (self) {
        _queue = [NSOperationQueue new];
        _model = [Model sharedModel];
        [_model subscribeDelegate: self];
    }

    return self;
}

@end