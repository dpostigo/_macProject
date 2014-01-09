//
//  BasicShadow.m
//  Carts
//
//  Created by Daniela Postigo on 11/16/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicShadow.h"

@implementation BasicShadow {

}

@synthesize name;
@synthesize shadowType;

- (id) init {
    self = [super init];
    if (self) {
        self.shadowType = ShadowTypeOuter;
    }

    return self;
}


- (void) drawWithRect: (NSRect) rect {

}

- (void) drawWithPath: (NSBezierPath *) path {
    if (![self.shadowColor isEqualTo: [NSColor clearColor]]) {

        if (self.shadowType == ShadowTypeInner) {

            [NSGraphicsContext saveGraphicsState];
            [[NSGraphicsContext currentContext] setCompositingOperation: NSCompositeSourceOver];


            //    [shadowPath setClip];
            [path setLineWidth: 0.5];
            [path setLineCapStyle: NSRoundLineCapStyle];
            [path setLineJoinStyle: NSBevelLineJoinStyle];

            [[NSColor clearColor] set];
            [self set];

            [self.shadowColor setStroke];
            [path fill];
            [path stroke];

            [NSGraphicsContext restoreGraphicsState];

        } else if (self.shadowType == ShadowTypeOuter) {

//            NSLog(@"Drawing outer shadow.");


//
//            [[NSColor redColor] set];
//            [path fill];

            [NSGraphicsContext saveGraphicsState];
            [[NSGraphicsContext currentContext] setCompositingOperation: NSCompositeSourceOver];

            //            [path setClip];
            [path setLineWidth: 0.5];
            [path setLineCapStyle: NSRoundLineCapStyle];
            [path setLineJoinStyle: NSBevelLineJoinStyle];

            [[NSColor whiteColor] set];
            [self set];

//            [self.shadowColor setStroke];
            [path fill];
//            [path stroke];

            [NSGraphicsContext restoreGraphicsState];

        }

    }

}


@end