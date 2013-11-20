//
//  BasicShadow+Utils.h
//  Carts
//
//  Created by Daniela Postigo on 11/16/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicShadow.h"

@interface BasicShadow (Utils)

+ (BasicShadow *) basicShadowFromShadow: (NSShadow *) shadow1;
- (NSString *) shadowTypeAsString;
@end