//
// Created by Dani Postigo on 1/23/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BOController.h"
#import "NotificationDelegate.h"

@interface ContentController : BOController <NotificationDelegate> {

    NSViewController *currentController;

}

@property(nonatomic, strong) NSViewController *currentController;
@end