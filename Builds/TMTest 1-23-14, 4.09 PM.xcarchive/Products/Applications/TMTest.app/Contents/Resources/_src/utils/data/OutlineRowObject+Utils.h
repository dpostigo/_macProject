//
//  OutlineRowObject+PositionUtils.h
//  Carts
//
//  Created by Daniela Postigo on 10/20/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OutlineRowObject.h"
#import "BasicObject.h"

@interface OutlineRowObject (Utils)

+ (OutlineRowObject *) rowObjectWithTitle: (NSString *) title;
+ (OutlineRowObject *) rowObjectWithData: (BasicObject *) object;
+ (NSArray *) rowObjectsWithTitles: (NSArray *) titles;
+ (NSMutableArray *) rowObjectsWithData: (NSArray *) objects;
@end