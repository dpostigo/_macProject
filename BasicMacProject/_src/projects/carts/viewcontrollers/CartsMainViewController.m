//
//  CartsMainViewController.m
//  Carts
//
//  Created by Daniela Postigo on 6/15/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartsMainViewController.h"
#import "CartsSidebarViewController.h"
#import "BasicDisplayView.h"
#import "BasicInnerShadowView.h"
#import "BasicView.h"


@implementation CartsMainViewController {

}


- (id) initWithCoder: (NSCoder *) coder {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    self = [super initWithCoder: coder];
    if (self) {

    }

    return self;
}


- (void) loadView {
    [super loadView];

    //    self.view = [[BasicView alloc] init];

    contentBackgroundView = [[BasicInnerShadowView alloc] initWithFrame: self.view.bounds];

    //    contentBackgroundView.borderOptions = [NSArray arrayWithObjects:
    //            [[BorderOption alloc] initWithBorderColor: [NSColor darkGrayColor] borderWidth: 0.5 type: BorderTypeTop],
    //            [[BorderOption alloc] initWithBorderColor: [NSColor darkGrayColor] borderWidth: 0.5 type: BorderTypeLeft],
    //            [[BorderOption alloc] initWithBorderColor: [NSColor darkGrayColor] borderWidth: 0.5 type: BorderTypeRight],
    //            nil];
    [self embedView: contentBackgroundView inView: contentView];

    [self embedViewController: [[CartsSidebarViewController alloc] initWithDefaultNib] inView: sidebar];
    //    BasicInnerShadowView *sidebarInnerShadow = [[BasicInnerShadowView alloc] initWithFrame: self.view.bounds];
    //    //    [self embedView: sidebarInnerShadow inView: sidebar];



}




//}


@end