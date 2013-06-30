//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CartsAppDelegate.h"
#import "TitleBarViewController.h"
#import "CartsMainViewController.h"


@implementation CartsAppDelegate


- (void) applicationDelegateDidFinishLaunching: (NSNotification *) notification {
    [super applicationDelegateDidFinishLaunching: notification];

    NSLog(@"%s", __PRETTY_FUNCTION__);

    [self embedViewController: [[CartsMainViewController alloc] initWithDefaultNib] inView: window.contentView];

}


#pragma mark Setup

- (void) setupTitleBar {

}

#pragma mark Callbacks

@end