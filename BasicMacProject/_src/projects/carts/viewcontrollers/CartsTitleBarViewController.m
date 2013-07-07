//
//  CartsTitleBarViewController.m
//  Carts
//
//  Created by Daniela Postigo on 7/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartsTitleBarViewController.h"
#import "BasicInnerShadowView.h"
#import "NSButton+DPUtils.h"
#import "VeryBasicButton.h"


@implementation CartsTitleBarViewController {

}


- (void) loadView {
    [super loadView];
    NSLog(@"%s", __PRETTY_FUNCTION__);

    //    BasicInnerShadowView *tempView = [[BasicInnerShadowView alloc] init];
    //    [self.view embedView: tempView];


    NSLog(@"rightButtons = %@", rightButtons);
    //    rightButtons.height = self.view.height;

    [rightButtons addObject: [VeryBasicButton buttonWithImage: [NSImage imageNamed: NSImageNameAddTemplate] padding: 5.0]];
    [rightButtons addObject: [NSWindow standardWindowButton: NSWindowCloseButton forStyleMask: NSTitledWindowMask]];

}

@end