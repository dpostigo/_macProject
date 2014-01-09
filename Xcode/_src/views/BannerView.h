//
//  BannerView.h
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewBasicView.h"
#import "BasicDisplayView.h"
#import "BasicNewTextField.h"
#import "ResizingView.h"

@interface BannerView : NewBasicView {
    BasicDisplayView *displayBackground;
    IBOutlet BasicNewTextField *textLabel;
    IBOutlet BasicNewTextField *detailTextLabel;

}

@property(nonatomic, strong) BasicDisplayView *displayBackground;
@property(nonatomic, strong) BasicNewTextField *textLabel;
@property(nonatomic, strong) BasicNewTextField *detailTextLabel;
@end