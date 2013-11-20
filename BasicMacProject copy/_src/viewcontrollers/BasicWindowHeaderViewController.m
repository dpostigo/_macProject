//
//  BasicWindowHeaderViewController.m
//  Carts
//
//  Created by Daniela Postigo on 7/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicWindowHeaderViewController.h"
#import "CustomWindow.h"
#import "CustomWindow+Utils.h"

@implementation BasicWindowHeaderViewController {

}

@synthesize leftButtons;
@synthesize rightButtons;

- (void) loadView {
    [super loadView];

    self.background = [CustomWindow defaultHeaderView];

    self.leftButtons = [[ButtonContainer alloc] init];
    self.rightButtons = [[ButtonContainer alloc] init];

    NSRect buttonsRect = self.view.bounds;

    NSRect leftRect = buttonsRect;
    leftRect.size.width = buttonsRect.size.width / 2;
    leftButtons.frame = leftRect;
    leftButtons.autoresizingMask = NSViewHeightSizable | NSViewMaxXMargin;

    NSRect rightRect = buttonsRect;
    rightRect.size.width = buttonsRect.size.width / 2;
    rightRect.origin.x = buttonsRect.size.width - rightRect.size.width;
    rightButtons.frame = rightRect;
    rightButtons.autoresizingMask = NSViewHeightSizable | NSViewMinXMargin;

    [self.view addSubview: leftButtons];
    [self.view addSubview: rightButtons];

}


@end