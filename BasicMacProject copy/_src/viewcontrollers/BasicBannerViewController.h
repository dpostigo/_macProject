//
//  BasicBannerViewController.h
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicViewController.h"
#import "BannerView.h"

@interface BasicBannerViewController : BasicViewController {

    IBOutlet BannerView *bannerView;
    IBOutlet NSView *contentView;

}

@property(nonatomic, strong) IBOutlet BannerView *bannerView;
@property(nonatomic, strong) IBOutlet NSView *contentView;
@end