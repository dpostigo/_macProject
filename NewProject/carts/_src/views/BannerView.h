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
    BasicDisplayView *background;
    IBOutlet BasicNewTextField *textLabel;
    IBOutlet BasicNewTextField *detailTextLabel;

    NSEdgeInsets insets;
}

@property(nonatomic, strong) BasicDisplayView *background;
@property(nonatomic, strong) BasicNewTextField *textLabel;
@property(nonatomic, strong) BasicNewTextField *detailTextLabel;
@property(nonatomic) NSEdgeInsets insets;
@end