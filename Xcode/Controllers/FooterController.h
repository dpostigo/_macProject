//
// Created by Dani Postigo on 1/21/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BOController.h"
#import "BOAPIDelegate.h"

@interface FooterController : BOController <BOAPIDelegate> {

    IBOutlet NSTextField *textLabel;
    BOOL isAnimating;
}

@property(nonatomic, strong) NSTextField *textLabel;
@property(nonatomic) BOOL isAnimating;
@end