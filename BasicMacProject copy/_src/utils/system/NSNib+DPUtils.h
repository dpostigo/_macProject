//
// Created by Dani Postigo on 12/29/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNib (DPUtils)

- (NSArray *) viewControllers;
- (id) viewControllerForClass: (Class) class;
@end