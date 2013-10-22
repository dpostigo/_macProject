//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CartsAppDelegate.h"
#import "CartsMainViewController.h"
#import "CustomWindow+Utils.h"
#import "CartsWindowHeaderView.h"

@implementation CartsAppDelegate

- (void) applicationDelegateDidFinishLaunching: (NSNotification *) notification {
    [super applicationDelegateDidFinishLaunching: notification];

    window.delegate = self;
    window.centersWindowButtons = YES;
    window.contentView = ([[CartsMainViewController alloc] init]).view;

    window.windowHeaderView = [CustomWindow headerViewWithClass: [CartsWindowHeaderView class]];
    window.windowFooterView = [CustomWindow defaultFooter];

    window.headerBarHeight = 30;
    window.footerBarHeight = 32;

}



#pragma mark Setup



#pragma mark Callbacks

@end