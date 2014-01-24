//
//  OutlineSection+PositionUtils.h
//  Carts
//
//  Created by Daniela Postigo on 10/20/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OutlineSection.h"

@interface OutlineSection (Utils)

+ (OutlineSection *) expandableSectionWithTitle: (NSString *) title1;
+ (OutlineSection *) expandableSectionWithTitle: (NSString *) title1 rows: (NSArray *) rows1;
@end