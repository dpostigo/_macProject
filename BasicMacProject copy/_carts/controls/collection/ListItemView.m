//
//  ListItemView.m
//  Carts
//
//  Created by Daniela Postigo on 11/18/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "ListItemView.h"
#import "TestLayerView.h"
#import "NSView+Masonry.h"

@implementation ListItemView {

}

- (void) loadView {
    [super loadView];

    TestLayerView *testLayerView = [[TestLayerView alloc] init];
//    testLayerView.borderColor = [NSColor blueColor];
    testLayerView.cornerRadius = 20;


    self.background = testLayerView;

    //    [newBg constrainToView: self.background];
    //    [background removeFromSuperview];

    //    [self.background setHidden: YES];
}


@end