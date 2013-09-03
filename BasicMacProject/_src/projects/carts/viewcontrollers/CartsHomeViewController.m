//
//  CartsHomeViewController.m
//  Carts
//
//  Created by Daniela Postigo on 9/3/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartsHomeViewController.h"
#import "BasicInnerShadowView.h"


@implementation CartsHomeViewController {

}


- (void) loadView {
    [super loadView];

    BasicInnerShadowView *backgroundView = [[BasicInnerShadowView alloc] initWithFrame: self.view.bounds];

    //    backgroundView.borderOptions = [NSArray arrayWithObjects:
    //            [[BorderOption alloc] initWithBorderColor: [NSColor darkGrayColor] borderWidth: 0.5 type: BorderTypeTop],
    //            [[BorderOption alloc] initWithBorderColor: [NSColor darkGrayColor] borderWidth: 0.5 type: BorderTypeLeft],
    //            [[BorderOption alloc] initWithBorderColor: [NSColor darkGrayColor] borderWidth: 0.5 type: BorderTypeRight],
    //            nil];
    backgroundView.gradient = [[NSGradient alloc] initWithColors: [NSArray arrayWithObjects: [NSColor blueColor], [NSColor whiteColor], nil]];
    [self embedView: backgroundView inView: self.view];

}


#pragma mark UITableView


#pragma mark IBActions


#pragma mark Callbacks


@end