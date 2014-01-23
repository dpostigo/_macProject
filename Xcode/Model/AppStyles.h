//
// Created by Dani Postigo on 1/22/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppStyles : NSObject {

}

+ (NSShadow *) defaultShadow;
+ (NSShadow *) defaultShadowWithRadius: (CGFloat) radius;
+ (NSShadow *) defaultShadowWithRadius: (CGFloat) radius offset: (NSSize) offset;
+ (CAGradientLayer *) defaultGradientLayer;
+ (void) addDefaultGradient: (CALayer *) layer;
@end