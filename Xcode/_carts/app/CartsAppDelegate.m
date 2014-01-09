//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CartsAppDelegate.h"
#import "NSNib+DPUtils.h"
#import "CartsHeaderController.h"
#import "DPWindow.h"
#import "DPHeaderedWindow.h"

@implementation CartsAppDelegate

- (void) applicationDelegateDidFinishLaunching: (NSNotification *) notification {
    [super applicationDelegateDidFinishLaunching: notification];

    [self testNibs];

}

- (void) testNibs {

    CartsHeaderController *controller = [_model.workspaceNib viewControllerForClass: [CartsHeaderController class]];
    NSLog(@"controller = %@", controller);

    bgWindow.headerView = controller.view;

}


@end