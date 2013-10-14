//
//  BasicScalingGradient.h
//  Carts
//
//  Created by Daniela Postigo on 10/13/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicGradient.h"
#import "BasicCenteredGradient.h"

@interface BasicScalingGradient : BasicCenteredGradient {
    CGFloat baseLength;
}

@property(nonatomic) CGFloat baseLength;
- (id) initWithBaseColor: (NSColor *) aBaseColor centerColor: (NSColor *) aCenterColor centerAmount: (CGFloat) aCenterAmount baseLength: (CGFloat) aBaseLength;
@end