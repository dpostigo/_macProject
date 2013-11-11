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
#import "BasicButton.h"

@implementation CartsTitleBarViewController {

}

- (void) loadView {
    [super loadView];

    NSButton *button = [BasicButton buttonWithImage: [NSImage imageNamed: NSImageNameAddTemplate] padding: 10.0];
    [button setEnabled: YES];
    button.width = button.height = 30;
    [rightButtons addObject: button];
    //    [rightButtons addObject: [VeryBasicButton buttonWithImage: [NSImage imageNamed: NSImageNameAddTemplate] insets: 10.0]];
    //    [rightButtons addObject: [NSWindow standardWindowButton: NSWindowCloseButton forStyleMask: NSTitledWindowMask]];

}

@end