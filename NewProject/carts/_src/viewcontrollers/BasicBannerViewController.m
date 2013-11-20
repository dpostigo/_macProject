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

@implementation BasicBannerViewController {
    IBOutlet NSView *contentViewContainer;

}

@synthesize bannerView;
@synthesize contentView;

- (void) loadView {
    [super loadView];

    self.flippedView.name = @"BasicBannerViewControllerView";
    self.view.translatesAutoresizingMaskIntoConstraints = NO;

//    [self addMasonryConstraints];

    if (bannerView == nil) {
        NSLog(@"Creating banner view.");
        bannerView = [[BannerView alloc] initWithFrame: self.view.bounds];
        [self.view addSubview: bannerView];


        [bannerView mas_makeConstraints: ^(MASConstraintMaker *make) {
            make.width.equalTo(self.view.mas_width);
//            make.height.equalTo(@100);
            make.centerX.equalTo(self.view.mas_centerX);
        }];
    }

}


- (void) addMasonryConstraints {

    BasicDisplayView *fakeBannerView = [BasicDisplayView newWithBackgroundColor: [NSColor whiteColor]];
    [self.view addSubview: fakeBannerView];


    [fakeBannerView mas_makeConstraints: ^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.height.equalTo(@100);
        make.centerX.equalTo(self.view.mas_centerX);
    }];

}


- (void) viewDidEndLiveResize {
    [super viewDidEndLiveResize];
    NSLog(@"%s", __PRETTY_FUNCTION__);

}

- (void) viewDidSwitchToAutolayout {
    [super viewDidSwitchToAutolayout];

}

- (void) viewDidMoveToSuperview {
    [super viewDidMoveToSuperview];

    if (!self.view.translatesAutoresizingMaskIntoConstraints) {
        //        bannerView.width = self.view.width;
        // NSLog(@"bannerView.frame = %@", NSStringFromRect(bannerView.frame));
        //        [bannerView constrainWidthToSuperview];

    }
}



//
//- (void) setContentView: (NSView *) contentView1 {
//
//    if (contentView) {
//        //        if (contentView1) {
//        //            [contentView1 addConstraints: contentView.constraints];
//        //        }
//        [contentView removeFromSuperview];
//
//    }
//    contentView = contentView1;
//    if (contentView) {
//        contentView.top = bannerView.bottom;
//        //        contentView.height = self.view.height - bannerView.height;
//        //        contentView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable | NSViewMaxYMargin;
//        [self.view addSubview: contentView];
//        NSLog(@"contentView.frame = %@", NSStringFromRect(contentView.frame));
//    }
//}

//
//- (void) subviewDidResize: (NSView *) subview {
//    [super subviewDidResize: subview];
//    NSLog(@"%s", __PRETTY_FUNCTION__);
////    contentView.top = bannerView.bottom;
////    contentView.height = self.view.height - bannerView.height;
//}

@end