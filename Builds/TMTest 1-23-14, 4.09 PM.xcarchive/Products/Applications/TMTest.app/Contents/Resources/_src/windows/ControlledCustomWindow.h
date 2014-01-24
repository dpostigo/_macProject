//
//  ControlledCustomWindow.h
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomWindow.h"

@interface ControlledCustomWindow : CustomWindow {

    NSViewController *windowHeaderViewController;
    NSViewController *windowFooterViewController;
}

@property(nonatomic, strong) NSViewController *windowHeaderViewController;
@property(nonatomic, strong) NSViewController *windowFooterViewController;
@end