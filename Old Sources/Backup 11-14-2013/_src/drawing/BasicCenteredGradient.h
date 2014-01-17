//
//  BasicCenteredGradient.h
//  Carts
//
//  Created by Daniela Postigo on 10/12/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicGradient.h"

@interface BasicCenteredGradient : BasicGradient {

    NSColor *baseColor;
    NSColor *centerColor;
}

@property(nonatomic, strong) NSColor *baseColor;
@property(nonatomic, strong) NSColor *centerColor;
+ (id) gradientWithBaseColor: (NSColor *) baseColor1 centerColor: (NSColor *) aCenterColor;
- (id) initWithBaseColor: (NSColor *) aBaseColor centerColor: (NSColor *) aCenterColor;
- (id) initWithBaseColors: (NSArray *) baseColors centerColor: (NSColor *) aCenterColor;
@end