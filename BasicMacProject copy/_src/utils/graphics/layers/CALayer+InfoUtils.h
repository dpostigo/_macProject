//
// Created by Dani Postigo on 12/28/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CALayer (InfoUtils)

- (CALayer *) sublayerWithName: (NSString *) name;
- (NSString *) infoString;
@end