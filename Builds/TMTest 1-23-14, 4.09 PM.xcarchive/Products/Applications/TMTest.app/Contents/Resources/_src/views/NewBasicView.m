//
//  NewBasicView.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NewBasicView.h"
#import "BasicFlippedViewController.h"
#import "NSView+LayoutConstraints.h"
#import "NSView+Debug.h"

@implementation NewBasicView {

}

@synthesize hPadding;
@synthesize vPadding;

@synthesize controller;
@synthesize shouldNotFlip;
@synthesize name;
@synthesize insets;

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
    return !shouldNotFlip;
}

- (NSRect) boundsWithMargins {
    NSRect ret = self.bounds;
    ret.origin.y = insets.top;
    ret.size.height = NSHeight(ret) - insets.top - insets.bottom;
    ret.origin.x = insets.left;
    ret.size.width = NSWidth(ret) - insets.left - insets.right;
    return ret;
}


- (void) viewDidMoveToSuperview {
    [super viewDidMoveToSuperview];
    [self notifyController: @selector(viewDidMoveToSuperview)];

    if ([self.name isEqualToString: @"BasicBannerViewControllerView"]) {
        //        NSLog(@"%s", __PRETTY_FUNCTION__);
    }

    //    if (!self.translatesAutoresizingMaskIntoConstraints) {
    //        for (NSView *subview in self.subviews) {
    //            [subview convertToAutolayout];
    //        }
    //    }
}

- (void) viewDidMoveToWindow {
    [super viewDidMoveToWindow];
    [self notifyController: @selector(viewDidMoveToWindow)];
}

- (void) viewDidEndLiveResize {
    [super viewDidEndLiveResize];
    [self notifyController: @selector(viewDidEndLiveResize)];
}

- (void) updateConstraints {
    [super updateConstraints];
    [self notifyController: @selector(updateConstraints)];
}


- (void) notifyController: (SEL) selector {
    if (self.controller && [self.controller respondsToSelector: selector]) {
        [self.controller performSelector: selector];
    } else {
        if (self.controller) {
            NSLog(@"Did not notify controller, %@", NSStringFromSelector(selector));
        }
    }
}


- (void) notifyController: (SEL) selector withObject: (id) object {
    if (self.controller && [self.controller respondsToSelector: selector]) {
        [self.controller performSelector: selector withObject: object];
    }
}

- (void) setTranslatesAutoresizingMaskIntoConstraints: (BOOL) flag {
    [super setTranslatesAutoresizingMaskIntoConstraints: flag];

    if (!flag) {
        [self notifyController: @selector(viewDidSwitchToAutolayout)];
    }
}


@end