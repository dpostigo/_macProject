//
// Created by Dani Postigo on 12/27/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "LayerBackedView.h"
#import "NSColor+DPColors.h"
#import "PMPKVObservation.h"

@implementation LayerBackedView {

    NSMutableArray *multipleObservations;
}

//@synthesize shadow;

- (id) init {
    self = [super init];
    if (self) {
        [self viewSetup];
    }

    return self;
}

- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {
        [self viewSetup];
    }

    return self;
}


- (void) viewSetup {
    self.wantsLayer = YES;

    self.layer.backgroundColor = [NSColor offwhiteColor].CGColor;
    self.layer.borderColor = [NSColor whiteColor].CGColor;
    self.layer.borderWidth = 1;

//    self.layer.masksToBounds = YES;
//    self.layer.needsDisplayOnBoundsChange = YES;

}

- (NSShadow *) shadow {
    if (shadow == nil) {
        shadow = [[NSShadow alloc] init];

        multipleObservations = [PMPKVObservation observe: shadow
                forMultipleKeyPaths: @[@"shadowColor", @"shadowOffset", @"shadowBlurRadius"]
                options: 0
                callback: ^(PMPKVObservation *observation, NSDictionary *changes) {
                    //                    NSLog(@"Multiple observation fired for object: %@ keyPath: %@ changes: %@",
                    //                            observation.observedObject,
                    //                            observation.keyPath,
                    //                            changes);
                    //                    NSLog(@"observation.keyPath = %@", observation.keyPath);
                    [super setShadow: shadow];
                }];

    }
    return shadow;
}


- (BOOL) isFlipped {
    return YES;
}




@end