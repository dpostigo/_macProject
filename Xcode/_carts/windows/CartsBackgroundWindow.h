//
// Created by Dani Postigo on 12/27/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPWindow.h"
#import "DPHeaderedWindow.h"

@interface CartsBackgroundWindow : DPHeaderedWindow {

    CALayer *innerBorderLayer;
}

@property(nonatomic, strong) CALayer *innerBorderLayer;
@end