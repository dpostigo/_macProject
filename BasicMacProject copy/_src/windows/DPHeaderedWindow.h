//
// Created by Dani Postigo on 1/2/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPWindow.h"

@interface DPHeaderedWindow : DPWindow {

    NSView *headerView;
    NSView *footerView;
}

@property(nonatomic, strong) NSView *headerView;
@property(nonatomic, strong) NSView *footerView;
@end