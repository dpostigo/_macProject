//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CartsAppDelegate.h"
#import "TitleBarViewController.h"
#import "CartsMainViewController.h"
#import "BasicInnerShadowView.h"
#import "CartsTitleBarViewController.h"


@implementation CartsAppDelegate


- (void) applicationDelegateDidFinishLaunching: (NSNotification *) notification {
    [super applicationDelegateDidFinishLaunching: notification];



    //    [self embedViewController: [[CartsMainViewController alloc] initWithDefaultNib] inView: window.contentView];

    CartsTitleBarViewController *titleController = [[CartsTitleBarViewController alloc] init];
    [self embedViewController: titleController inView: window.titleBarView];
    NSLog(@"window.titleBarView.frame = %@", NSStringFromRect(window.titleBarView.frame));
    NSLog(@"titleController.view.frame = %@", NSStringFromRect(titleController.view.frame));
    NSLog(@"titleController.rightButtons.frame = %@", NSStringFromRect(titleController.rightButtons.frame));

}


#pragma mark Setup

- (void) setupTitleBar {

}

#pragma mark Callbacks

@end