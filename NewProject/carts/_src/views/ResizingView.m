//
//  ResizingView.m
//  Carts
//
//  Created by Daniela Postigo on 10/25/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "ResizingView.h"

@implementation ResizingView {

}

@synthesize resizesSuperviews;

- (void) viewDidResize {
    [self notifySuperviews];
}

- (void) notifySuperviews {
//
//    if (resizesSuperviews) {
//
//
//        if (self.superview && [self.superview isKindOfClass: [NewBasicView class]]) {
//            NewBasicView *basicView = (NewBasicView *) self.superview;
//            if (basicView.controller) {
////                [basicView resizeWithOldSuperviewSize: <#(NSSize)oldSize#>];
//
//            }
//        }
////        [self notifyController: @selector(subviewDidResize:) withObject: self];
//    }

}

@end