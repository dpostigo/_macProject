//
//  CustomWindow+PositionUtils.h
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomWindow.h"

@interface CustomWindow (Utils)

+ (BasicWindowTitleView *) headerViewWithClass: (Class) class;
+ (BasicWindowTitleView *) defaultHeaderView;
+ (BasicWindowTitleView *) defaultFooter;
@end