//
//  CartsMainViewController2.h
//  Carts
//
//  Created by Daniela Postigo on 6/15/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicSplitViewController.h"
#import "BasicDisplayView.h"
#import "BasicSidebarSplitViewController.h"


@interface CartsMainViewController2 : BasicSidebarSplitViewController {
    BasicDisplayView *contentBackgroundView;
    BasicBackgroundViewOld *sidebarHighlightView;
}
@end