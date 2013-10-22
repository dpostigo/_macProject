//
//  CartsListViewController.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartsListViewController.h"

@implementation CartsListViewController {

}

- (void) loadView {
    [super loadView];

    bannerView.textLabel.stringValue = _model.selectedList.title;
}


@end