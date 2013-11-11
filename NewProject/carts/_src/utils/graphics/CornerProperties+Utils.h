//
//  CornerProperties+Utils.h
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CornerProperties.h"
#import "NSBezierPath+Additions.h"

@interface CornerProperties (Utils)

- (NSArray *) cornerTypeAsArray;
- (CornerType) typeForString: (NSString *) string;
- (JSRoundedCornerOptions) jsTypeForCornerType: (CornerType) aType;
- (JSRoundedCornerOptions) jsOptionsForCornerType: (CornerType) aType;
- (JSRoundedCornerOptions) jsOptions;
@end