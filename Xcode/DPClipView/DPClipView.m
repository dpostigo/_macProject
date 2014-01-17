//
// Created by Dani Postigo on 1/15/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "DPClipView.h"

@implementation DPClipView

- (void) viewFrameChanged: (NSNotification *) notification {
    [super viewFrameChanged: notification];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void) viewBoundsChanged: (NSNotification *) notification {
    [super viewBoundsChanged: notification];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}


@end