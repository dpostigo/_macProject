//
//  BasicSplitSidebarViewController.h
//  Carts
//
//  Created by Daniela Postigo on 9/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicSplitHorizontalViewController.h"

@interface BasicSplitSidebarViewController : BasicSplitHorizontalViewController {
    NSUInteger sidebarIndex;
    NSUInteger mainControllerIndex;

}

@property(nonatomic) NSUInteger sidebarIndex;
- (SplitViewContainer *) sidebarContainer;
- (void) setSidebarViewController: (NSViewController *) controller;
- (void) setMainViewController: (NSViewController *) controller;
- (NSViewController *) sidebarViewController;
- (NSViewController *) mainViewController;
- (void) addSidebarViewController: (NSViewController *) controller;
@end