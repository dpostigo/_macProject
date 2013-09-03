//
//  BasicSidebarSplitViewController.h
//  Carts
//
//  Created by Daniela Postigo on 7/10/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicSplitViewController.h"
#import "BasicSplitLayoutViewController.h"


@interface BasicSidebarSplitViewController : BasicSplitLayoutViewController {
    SplitViewContainer *sidebarContainer;

}

@property(nonatomic, strong) SplitViewContainer *sidebarContainer;
- (void) setSidebarView: (NSView *) subview;
@end