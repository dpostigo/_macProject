//
//  BasicViewController+Utils.m
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicViewController+Utils.h"
#import "CustomButton.h"

@implementation BasicViewController (Utils)

- (void) replaceView: (NSView *) view withView: (NSView *) secondView {
    secondView.frame = view.frame;
    secondView.autoresizingMask = view.autoresizingMask;
    [view.superview addSubview: secondView positioned: NSWindowBelow relativeTo: view];
    [view removeFromSuperview];
    view = secondView;
}


- (void) replaceButton: (NSButton *) button withButtonCellClass: (Class) buttonCellClass {
    CustomButton *secondButton = [[CustomButton alloc] initWithFrame: button.frame cellClass: buttonCellClass];
    secondButton.frame = button.frame;
    secondButton.title = button.title;
    secondButton.image = button.image;
    secondButton.autoresizingMask = button.autoresizingMask;
    [button.superview addSubview: secondButton positioned: NSWindowBelow relativeTo: button];
    [button removeFromSuperview];
    button = secondButton;
}


@end