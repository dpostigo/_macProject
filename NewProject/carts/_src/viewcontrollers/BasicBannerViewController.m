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

    [self addMasonryConstraints];

}


- (void) addMasonryConstraints {

    BasicDisplayView *fakeBannerView = [BasicDisplayView newWithBackgroundColor: [NSColor whiteColor]];
    [self.view addSubview: fakeBannerView];
    [fakeBannerView fillSuperviewWidth];

    //if you want to use Masonry without the mas_ prefix
    //define MAS_SHORTHAND before importing Masonry.h see Masonry iOS Examples-Prefix.pch
    //    [fakeBannerView mas_makeConstraints: ^(MASConstraintMaker *make) {
    //        make.top.greaterThanOrEqualTo(superview.mas_top).offset(padding);
    //        make.left.equalTo(superview.mas_left).offset(padding);
    //        make.bottom.equalTo(blueView.mas_top).offset(-padding);
    //        make.right.equalTo(redView.mas_left).offset(-padding);
    //        make.width.equalTo(redView.mas_width);
    //
    //        make.height.equalTo(redView.mas_height);
    //        make.height.equalTo(blueView.mas_height);
    //    }];

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
        NSLog(@"bannerView.frame = %@", NSStringFromRect(bannerView.frame));
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