//
//  BasicBannerViewController.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicBannerViewController.h"

@implementation BasicBannerViewController {

}

@synthesize bannerView;

- (void) loadView {
    [super loadView];

    if (bannerView == nil) {
        bannerView = [[BannerView alloc] initWithFrame: self.view.bounds];
        bannerView.width = self.view.width;
        bannerView.autoresizingMask = NSViewWidthSizable | NSViewMaxYMargin;
        [self.view addSubview: bannerView];
    }
}

@end