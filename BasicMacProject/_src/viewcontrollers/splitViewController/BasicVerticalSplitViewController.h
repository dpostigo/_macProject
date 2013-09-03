//
//  BasicVerticalSplitViewController.h
//  Carts
//
//  Created by Daniela Postigo on 7/10/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicSplitViewController.h"
#import "BasicSplitLayoutViewController.h"


@interface BasicVerticalSplitViewController : BasicSplitLayoutViewController {

    SplitViewContainer *headerContainer;
    SplitViewContainer *footerContainer;
}

@property(nonatomic, strong) SplitViewContainer *headerContainer;
@property(nonatomic, strong) SplitViewContainer *footerContainer;
- (void) setFooterView: (NSView *) subview;
- (void) setHeaderView: (NSView *) subview;
@end