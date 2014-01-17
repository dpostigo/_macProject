//
//  BasicWindowFooterViewController.m
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicWindowFooterViewController.h"
#import "CustomWindow.h"
#import "CustomWindow+Utils.h"

@implementation BasicWindowFooterViewController {

}

- (void) loadView {
    [super loadView];
    self.background = [CustomWindow defaultFooter];
}


@end