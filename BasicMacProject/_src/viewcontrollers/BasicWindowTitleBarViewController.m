//
//  BasicWindowTitleBarViewController.m
//  Carts
//
//  Created by Daniela Postigo on 7/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicWindowTitleBarViewController.h"

@implementation BasicWindowTitleBarViewController {

}

@synthesize leftButtons;
@synthesize rightButtons;

- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil {
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if (self) {

    }

    return self;
}

- (void) loadView {
    [super loadView];

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