//
//  DataSection+Utils.h
//  Carts
//
//  Created by Daniela Postigo on 10/24/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataSection.h"

@interface DataSection (Utils)

+ (DataSection *) firstObject: (NSMutableArray *) datasource;
- (NSArray *) contentObjects;
- (NSArray *) basicObjects;
- (NSSortDescriptor *) sortModeDescriptor;
- (void) sortRows;
@end