//
//  CartsHomeViewController.m
//  Carts
//
//  Created by Daniela Postigo on 9/3/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartsHomeViewController.h"
#import "BasicInnerShadowView.h"
#import "NSColor+CartsUtils.h"
#import "CartsListViewController.h"

@implementation CartsHomeViewController {

}

- (void) loadView {
    [super loadView];

    BasicInnerShadowView *background = [[BasicInnerShadowView alloc] initWithFrame: self.view.bounds];
    background.innerShadow.shadowColor = [NSColor blackColor];
    background.innerShadow.shadowOffset = NSMakeSize(-1, -1);
    background.backgroundColor = [NSColor desaturatedDarkSlateHighlight];
    [self embedView: background inView: self.view];

}

#pragma mark Callbacks

- (void) listWasSelected: (List *) list {

    if (_model.selectedList) {
        self.viewController = [[CartsListViewController alloc] init];
    }

}


@end