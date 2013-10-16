//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CartsAppDelegate.h"
#import "TitleBarViewController.h"
#import "BasicInnerShadowView.h"
#import "CartsTitleBarViewController.h"
#import "CartsMainViewController.h"

@implementation CartsAppDelegate

- (void) applicationDelegateDidFinishLaunching: (NSNotification *) notification {
    [super applicationDelegateDidFinishLaunching: notification];

    //    CartsTitleBarViewController *titleController = [[CartsTitleBarViewController alloc] init];
    //    [self embedViewController: [[CartsTitleBarViewController alloc] init] inView: window.titleBarView];
    //    [self embedViewController: [[CartsMainViewController alloc] initWithDefaultNib] inView: window.contentView];

    CartsMainViewController *mainController = [[CartsMainViewController alloc] init];
    basicWindow.contentView = ([[CartsMainViewController alloc] init]).view;
    window.contentView = mainController.view;
//    [window makeKeyAndOrderFront: nil];
    //    basicWindow.contentView = mainController.view;
    //    [self embedView: mainController.view inView: basicWindow.contentView];

}


#pragma mark Setup

- (void) setupTitleBar {

}

#pragma mark Callbacks

@end