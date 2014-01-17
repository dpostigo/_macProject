//
// Created by Dani Postigo on 1/16/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "NewTasksWindow.h"

@implementation NewTasksWindow

- (void) awakeFromNib {
    [super awakeFromNib];

    NSLog(@"%s", __PRETTY_FUNCTION__);

    testWindow.delegate = self;

    [self addChildWindow: testWindow ordered: NSWindowAbove];
}






//
//- (NSRect) constrainFrameRect: (NSRect) frameRect toScreen: (NSScreen *) screen {
//    return [super constrainFrameRect: frameRect toScreen: screen];
//}


@end