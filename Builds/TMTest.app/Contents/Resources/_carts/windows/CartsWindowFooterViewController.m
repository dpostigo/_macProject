//
//  CartsWindowFooterViewController.m
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartsWindowFooterViewController.h"

@implementation CartsWindowFooterViewController {

}

@synthesize addButton;

- (void) loadView {
    [super loadView];

}

- (void) handleAddButton: (id) sender {

}

- (IBAction) handleAddListButton: (id) sender {
    [_model addList: [[List alloc] initWithTitle: @"New List"]];

}


@end