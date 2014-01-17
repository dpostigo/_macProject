//
//  BasicShadow.h
//  Carts
//
//  Created by Daniela Postigo on 11/16/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ShadowTypeOuter = 0,
    ShadowTypeInner = 1
} ShadowType;


@interface BasicShadow : NSShadow {
    ShadowType shadowType;
    NSString *name;
}

@property(nonatomic) ShadowType shadowType;
@property(nonatomic, retain) NSString *name;


- (void) drawWithRect: (NSRect) rect;
- (void) drawWithPath: (NSBezierPath *) path;
@end