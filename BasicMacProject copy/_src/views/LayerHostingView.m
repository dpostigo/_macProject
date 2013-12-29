//
// Created by Dani Postigo on 12/26/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "LayerHostingView.h"
#import "NSColor+DPColors.h"

@implementation LayerHostingView {

}

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
    self.layer = [CALayer new];
    self.wantsLayer = YES;

    self.layer.backgroundColor = [NSColor offwhiteColor].CGColor;
    self.layer.borderColor = [NSColor whiteColor].CGColor;
    self.layer.borderWidth = 1;

    self.layer.cornerRadius = 10;
    self.layer.shadowColor = [NSColor blackColor].CGColor;
    self.layer.shadowRadius = 2.0;
    self.layer.shadowOpacity = 1.0;
    self.layer.shadowOffset = CGSizeMake(0, -1);

    self.layer.masksToBounds = NO;

}

- (void) updateConstraints {
    [super updateConstraints];
}


- (void) setFrame: (NSRect) frameRect {
    [super setFrame: frameRect];
    self.layer.bounds = self.bounds;
    //    NSLog(@"%@ vs %@", NSStringFromRect(self.layer.bounds), NSStringFromRect(self.bounds));
}


- (void) layoutSublayersOfLayer: (CALayer *) layer {
    [super layoutSublayersOfLayer: layer];
    //    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (BOOL) isFlipped {
    return YES;
}





@end