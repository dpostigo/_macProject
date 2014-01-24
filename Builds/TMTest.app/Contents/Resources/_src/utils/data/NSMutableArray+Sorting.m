//
//  NSMutableArray+Sorting.m
//  Carts
//
//  Created by Daniela Postigo on 10/24/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSMutableArray+Sorting.h"

@implementation NSMutableArray (Sorting)

- (void) sortUsingDescriptor: (NSSortDescriptor *) descriptor {
    [self sortUsingDescriptors: [NSArray arrayWithObject: descriptor]];
}
@end