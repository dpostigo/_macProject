//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CartsAppDelegate.h"
#import "CartsMainViewController.h"
#import "CustomWindow+Utils.h"
#import "CartsWindowHeaderViewController.h"
#import "CartsWindowFooterViewController.h"

@implementation CartsAppDelegate

- (void) applicationDelegateDidFinishLaunching: (NSNotification *) notification {
    [super applicationDelegateDidFinishLaunching: notification];

    window.delegate = self;
    window.centersWindowButtons = YES;
    window.contentView = ([[CartsMainViewController alloc] init]).view;

    window.windowHeaderViewController = [[CartsWindowHeaderViewController alloc] initWithDefaultNib];
    window.windowFooterViewController = [[CartsWindowFooterViewController alloc] initWithDefaultNib];

    window.headerBarHeight = 30;
    window.footerBarHeight = 32;

    //    CartsWindowFooterViewController *footer = (CartsWindowFooterViewController *) window.windowFooterViewController;
    //    NSLog(@"footer.addButton.frame = %@", NSStringFromRect(footer.addButton.frame));
    //
    //    NSLog(@"footer.view.height = %f", footer.view.height);
    //    NSLog(@"footer.addButton.height = %f", footer.addButton.height);
    //
    //    CGFloat top = (footer.view.height - footer.addButton.height) / 2;
    //    NSLog(@"top = %f", top);
    //
    //    NSLog(@"footer.addButton.top = %f", footer.addButton.top);

    [[NSUserDefaults standardUserDefaults] setBool: YES forKey: @"NSConstraintBasedLayoutVisualizeMutuallyExclusiveConstraints"];

}


@end