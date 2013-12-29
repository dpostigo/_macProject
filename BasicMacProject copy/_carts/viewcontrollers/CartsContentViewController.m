//
//  CartsContentViewController.m
//  Carts
//
//  Created by Daniela Postigo on 9/3/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CartsContentViewController.h"
#import "CartsListViewController.h"

@implementation CartsContentViewController {

}

- (void) loadView {
    [super loadView];

    //    BasicInnerShadowView *aView = [[BasicInnerShadowView alloc] initWithFrame: self.view.bounds];
    //    aView.innerShadow.shadowColor = [NSColor blackColor];
    //    aView.innerShadow.shadowOffset = NSMakeSize(-1, -1);
    //    aView.backgroundColor = [NSColor desaturatedDarkSlateHighlight];
    //    aView.borderWidth = 0;


    NSView *bg = [[NSView alloc] init];
    //    self.background = aView;

    //    self.background = [BasicDisplayView newWithBackgroundColor: [NSColor redColor]];
}




#pragma mark Callbacks

- (void) listWasSelected: (List *) list {
    if (_model.selectedList) {
        self.viewController = [[CartsListViewController alloc] init];
        //        self.viewController = [[BasicBannerViewController alloc] init];
    }

}


@end