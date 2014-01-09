//
//  BasicLayoutViewController.h
//  Carts
//
//  Created by Daniela Postigo on 9/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicSplitVerticalViewController.h"

@interface BasicLayoutViewController : BasicSplitVerticalViewController {

    NSUInteger footerIndex;

}

@property(nonatomic) NSUInteger footerIndex;
- (SplitViewContainer *) footerContainer;
- (void) addFooterViewController: (NSViewController *) controller;
@end