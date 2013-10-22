//
//  NewBasicView.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NewBasicView.h"

@implementation NewBasicView {

}

@synthesize topMargin;

@synthesize bottomMargin;

@synthesize leftMargin;

@synthesize rightMargin;

@synthesize hPadding;

@synthesize vPadding;

- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {
        [self viewInit];

    }

    return self;
}

- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {
        [self viewInit];

    }

    return self;
}

- (id) init {
    self = [super init];
    if (self) {
        [self viewInit];

    }

    return self;
}

- (void) viewInit {

}

- (BOOL) isFlipped {
    return YES;
}

- (NSRect) boundsWithMargins {
    NSRect ret = self.bounds;
    ret.origin.y = topMargin;
    ret.size.height = NSHeight(ret) - topMargin - bottomMargin;
    ret.origin.x = leftMargin;
    ret.size.width = NSWidth(ret) - leftMargin - rightMargin;
    return ret;
}


@end