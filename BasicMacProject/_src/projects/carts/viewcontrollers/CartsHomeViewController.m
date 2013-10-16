//
//  CartsHomeViewController.m
//  Carts
//
//  Created by Daniela Postigo on 9/3/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartsHomeViewController.h"
#import "BasicInnerShadowView.h"
#import "NSColor+DPColors.h"

@implementation CartsHomeViewController {

}

- (void) loadView {
    [super loadView];

    BasicInnerShadowView *background = [[BasicInnerShadowView alloc] initWithFrame: self.view.bounds];
//    background.borderColor = [NSColor yellowColor];
    background.innerShadow.shadowColor = [NSColor blackColor];
    background.innerShadow.shadowOffset = NSMakeSize(-1, -1);

    //    backgroundView.borderOptions = [NSArray arrayWithObjects:
    //            [[BorderOption alloc] initWithBorderColor: [NSColor darkGrayColor] borderWidth: 0.5 type: BorderTypeTop],
    //            [[BorderOption alloc] initWithBorderColor: [NSColor darkGrayColor] borderWidth: 0.5 type: BorderTypeLeft],
    //            [[BorderOption alloc] initWithBorderColor: [NSColor darkGrayColor] borderWidth: 0.5 type: BorderTypeRight],
    //            nil];

    background.gradient = [[BasicGradient alloc] initWithColors: [NSArray arrayWithObjects: [NSColor offwhiteColor], [NSColor whiteColor], nil]];
    [self embedView: background inView: self.view];


    //    nextResponder = homeController.view;

}


#pragma mark UITableView


#pragma mark IBActions


#pragma mark Callbacks


@end