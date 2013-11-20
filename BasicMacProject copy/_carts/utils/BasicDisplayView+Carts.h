//
//  BasicDisplayView+Carts.h
//  Carts
//
//  Created by Daniela Postigo on 11/7/13.
//  Copyright (c) 2013 Daniela Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicDisplayView.h"

@interface BasicDisplayView (Carts)

+ (BasicDisplayView *) basicBackground;
+ (BasicDisplayView *) newWithBackgroundColor: (NSColor *) aColor;
@end