//
//  BasicSplitLayoutViewController.h
//  Carts
//
//  Created by Daniela Postigo on 7/10/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicSplitViewController.h"


@interface BasicSplitLayoutViewController : BasicSplitViewController {

    NSMutableArray *containers;
    SplitViewContainer *contentContainer;

}

@property(nonatomic, strong) SplitViewContainer *contentContainer;
@property(nonatomic, strong) NSView *contentView;
- (void) updateViews;
- (void) collectViews;
- (void) addViews;
- (void) clearViews;
@end