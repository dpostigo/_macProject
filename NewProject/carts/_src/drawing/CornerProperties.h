//
//  CornerProperties.h
//  Carts
//
//  Created by Daniela Postigo on 9/30/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    CornerNone = 1 << 0,
    CornerUpperRight = 1 << 1,
    CornerLowerRight = 1 << 2,
    CornerLowerLeft = 1 << 3,
    CornerUpperLeft = 1 << 4,
} CornerType;



@interface CornerProperties : NSObject {
    CGFloat cornerRadius;
    CornerType cornerType;
}

@property(nonatomic) CornerType cornerType;
@property(nonatomic) CGFloat cornerRadius;
@end