//
//  CartsWindowHeaderViewControllerOld.h
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicWindowHeaderViewController.h"

@interface CartsWindowHeaderViewControllerOld : BasicWindowHeaderViewController {
    IBOutlet NSSegmentedControl *control;
}

@property(nonatomic, strong) NSSegmentedControl *control;
@end