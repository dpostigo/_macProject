//
//  BasicBannerViewController.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicBannerViewController.h"
#import "AutoLayoutHelpers.h"
#import "NSView+LayoutConstraints.h"
#import "NSView+Debug.h"

@implementation BasicBannerViewController {
    IBOutlet NSView *contentViewContainer;

}

@synthesize bannerView;
@synthesize contentView;

- (id) init {
    self = [super init];
    if (self) {
        NSLog(@"%s", __PRETTY_FUNCTION__);

    }

    return self;
}

//
//
//- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil {
//    if (nibNameOrNil == nil) nibNameOrNil = self.nib;
//    NSLog(@"%s, self.nibName = %@", __PRETTY_FUNCTION__, self.nibName);
//    self = [super initWithNibName: nibNameOrNil bundle:
//            nibBundleOrNil];
//    if (self) {
//        if (self.nibName == nil) {
//            NSLog(@"%s, self.view = %@", __PRETTY_FUNCTION__, self.view);
//            [self setView: [[NSView alloc] initWithFrame: NSMakeRect(0, 0, 320, 480)]];
//            [self loadView];
//        }
//    }
//    return self;
//}



- (void) loadView {
    [super loadView];

    self.flippedView.name = @"BasicBannerViewControllerView";
    self.view.translatesAutoresizingMaskIntoConstraints = NO;

//    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"|[bannerView]|" options: 0 metrics: nil views: NSDictionaryOfVariableBindings(bannerView)]];
    //
    //
    //    NSLog(@"self.view = %@", self.view);
    //    NewBasicView *neView = (NewBasicView *) self.view;
    //    NSLog(@"neView.controller = %@", neView.controller);
    //    NSLog(@"self.flippedView.controller = %@", self.flippedView.controller);
    //
    //    if (bannerView == nil) {
    //        NSLog(@"Creating banner view.");
    //        bannerView = [[BannerView alloc] initWithFrame: self.view.bounds];
    //        [self.view addSubview: bannerView];
    //        [bannerView constrainWidthToSuperview];
    //    }
    //
    //    NSArray *constraints = bannerView.constraints;
    //    for (int j = 0; j < [constraints count]; j++) {
    //    }
    //    if (contentView == nil) {
    //        self.contentView = [[NSView alloc] initWithFrame: self.view.bounds];
    //    }
    //
    //    bannerView.width = self.view.width;
    //
    //    NSLog(@"%s, bannerView = %@", __PRETTY_FUNCTION__, bannerView);
    //    NSLog(@"bannerView.frame = %@", NSStringFromRect(bannerView.frame));
    //    NSLog(@"%s, self.view.frame = %@", __PRETTY_FUNCTION__, NSStringFromRect(self.view.frame));
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

- (void) viewDidEndLiveResize {
    [super viewDidEndLiveResize];
    NSLog(@"%s", __PRETTY_FUNCTION__);

    NSLog(@"self.view = %@", self.view);
    NSLog(@"self.view.translatesAutoresizingMaskIntoConstraints = %d", self.view.translatesAutoresizingMaskIntoConstraints);
    NSLog(@"self.bannerView.translatesAutoresizingMaskIntoConstraints = %d", self.bannerView.translatesAutoresizingMaskIntoConstraints);
    NSLog(@"self.view.frame = %@", NSStringFromRect(self.view.frame));
    NSLog(@"bannerView.frame = %@", NSStringFromRect(bannerView.frame));

    NSLog(@"self.bannerView.constraints = %@", self.bannerView.constraints);

}

- (void) viewDidSwitchToAutolayout {
    [super viewDidSwitchToAutolayout];
    //    NSLog(@"%s", __PRETTY_FUNCTION__);
    //    NSLog(@"self.view = %@", self.view);
    //    NSLog(@"self.view.superview = %@", self.view.superview);

    //    NSLog(@"[self.subviews count] = %lu", [self.subviews count]);
}

- (void) viewDidMoveToSuperview {
    [super viewDidMoveToSuperview];

    if (!self.view.translatesAutoresizingMaskIntoConstraints) {
        bannerView.width = self.view.width;
        NSLog(@"bannerView.frame = %@", NSStringFromRect(bannerView.frame));
        //        [bannerView constrainWidthToSuperview];

    }
}


@end