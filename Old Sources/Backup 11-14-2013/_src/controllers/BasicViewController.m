//
// Created by Dani Postigo on 12/28/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicViewController.h"
#import "NSView+SuperConstraints.h"

@implementation BasicViewController {

}

@synthesize background;

- (void) setBackground: (NSView *) background1 {
    if (background) [background removeFromSuperview];
    background = background1;

    if (background) {
        background.frame = self.view.bounds;

        if ([self.view.subviews count] == 0) {
            [self.view addSubview: background];
        } else {
            NSView *lastSubview = [self.view.subviews objectAtIndex: 0];
            [self.view addSubview: background positioned: NSWindowBelow relativeTo: lastSubview];
        }

        //        [background fillToSuperview];
        [background superConstrain: NSLayoutAttributeTop constant: 0];
        [background superConstrain: NSLayoutAttributeBottom constant: 0];
        [background superConstrain: NSLayoutAttributeLeft constant: 0];
        [background superConstrain: NSLayoutAttributeRight constant: 0];
    }
}
@end