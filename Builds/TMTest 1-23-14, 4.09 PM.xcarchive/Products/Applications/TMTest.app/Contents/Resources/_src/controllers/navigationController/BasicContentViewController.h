//
//  BasicContentViewController.h
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicFlippedViewController.h"

@interface BasicContentViewController : BasicFlippedViewController {

    NSViewController *viewController;

}

@property(nonatomic, strong) NSViewController *viewController;
@end