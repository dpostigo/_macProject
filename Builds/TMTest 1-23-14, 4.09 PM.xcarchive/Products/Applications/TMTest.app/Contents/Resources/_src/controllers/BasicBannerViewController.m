//
//  BasicBannerViewController.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicBannerViewController.h"
#import "BasicDisplayView+Carts.h"
#import "Masonry.h"
#import "NSView+Masonry.h"
#import "NSView+DPUtils.h"

@implementation BasicBannerViewController {
    IBOutlet NSView *contentViewContainer;

}

@synthesize bannerView;
@synthesize contentView;

- (void) loadView {
    [super loadView];

    self.flippedView.name = @"BasicBannerViewControllerView";

    if (bannerView == nil) {
        bannerView = [[BannerView alloc] initWithFrame: self.view.bounds];
        [self.view addSubview: bannerView];
    }

}


- (void) setContentView: (NSView *) contentView1 {
    [self.view safeRemove: contentView];
    contentView = contentView1;

    [self.view addSubview: contentView];

}


- (void) viewDidMoveToSuperview {
    [super viewDidMoveToSuperview];

    [bannerView mas_makeConstraints: ^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.centerX.equalTo(self.view.mas_centerX);
        //        make.bottom.equalTo(self.view.mas_bottom);
        make.top.equalTo(self.view.mas_top);
    }];

    NSLog(@"contentView = %@", contentView);
    if (contentView) {
        [contentView mas_updateConstraints: ^(MASConstraintMaker *make) {
            make.width.equalTo(self.view.mas_width);
            make.centerX.equalTo(self.view.mas_centerX);
            make.top.equalTo(bannerView.mas_bottom);
            //            make.height.equalTo(@100);
            make.bottom.equalTo(self.view.mas_bottom);
        }];
    }
}


@end