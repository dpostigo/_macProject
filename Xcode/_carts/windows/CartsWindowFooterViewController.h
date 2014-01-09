//
//  CartsWindowFooterViewController.h
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicWindowHeaderViewController.h"
#import "BasicWindowFooterViewController.h"

@interface CartsWindowFooterViewController : BasicWindowFooterViewController {

    IBOutlet NSButton *addButton;
    IBOutlet NSButton *addListButton;
}

@property(nonatomic, strong) NSButton *addButton;
- (IBAction) handleAddListButton: (id) sender;
@end