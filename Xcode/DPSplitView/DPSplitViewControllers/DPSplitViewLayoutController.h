//
//  DPSplitViewLayoutController.h
//  Carts
//
//  Created by Daniela Postigo on 9/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPSplitViewVerticalController.h"

@interface DPSplitViewLayoutController : DPSplitViewVerticalController {

    NSUInteger footerIndex;

}

@property(nonatomic) NSUInteger footerIndex;
- (DPSplitViewContainer *) footerContainer;
- (void) addFooterViewController: (NSViewController *) controller;
@end