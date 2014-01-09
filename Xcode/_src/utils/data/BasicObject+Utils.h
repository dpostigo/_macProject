//
//  BasicObject+PositionUtils.h
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicObject.h"

@interface BasicObject (Utils)

+ (NSMutableArray *) objectsWithTitles: (NSArray *) titles;
+ (NSMutableArray *) objectsWithTitles: (NSArray *) titles class: (Class) class;
@end