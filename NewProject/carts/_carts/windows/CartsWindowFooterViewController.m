//
//  CartsWindowFooterViewController.m
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartsWindowFooterViewController.h"
#import "NSButton+DefaultButtons.h"
#import "BasicViewController+Utils.h"
#import "CustomButton.h"
#import "NewBasicButtonCell.h"

@implementation CartsWindowFooterViewController {

}

@synthesize addButton;

- (void) loadView {
    [super loadView];

    //    self.flippedView.shouldNotFlip = YES;

    //    NSLog(@"self.view.frame = %@", NSStringFromRect(self.view.frame));
    //    NSLog(@"self.view.width = %f", self.view.width);

    //    addButton.top = (self.view.height - addButton.height)/2;

    //    NSLog(@"addButton.superview = %@", addButton.superview);
    //    NSLog(@"addListButton.superview = %@", addListButton.superview);

    [self replaceButton: addButton withButtonCellClass: [NewBasicButtonCell class]];

}

- (void) handleAddButton: (id) sender {

}

- (IBAction) handleAddListButton: (id) sender {
    [_model addList: [[List alloc] initWithTitle: @"New List"]];

}


@end