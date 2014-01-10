//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CartsAppDelegate.h"
#import "NSNib+WorkspaceNib.h"
#import "DPHeaderedWindow.h"
#import "NSWorkspaceNib.h"
#import "NSWindow+DPUtils.h"

@implementation CartsAppDelegate {
    NSWindow *window;
}

- (void) applicationDelegateDidFinishLaunching: (NSNotification *) notification {
    [super applicationDelegateDidFinishLaunching: notification];


    //    NSLog(@"macWindow.contentView = %@", macWindow.contentView);
    [_model.masterNib load];
    NSView *view = [_model.masterNib viewForClass: @"TestCartsMainController"];
    //    [macWindow setContentView: view];
    //    NSLog(@"macWindow.contentView = %@", macWindow.contentView);

    NSLog(@"view = %@", view);
    bgWindow.headerView = [_model.masterNib viewForClass: @"CartsHeaderController"];
    bgWindow.contentContentView = view;
    [bgWindow close];

    window = [[NSWindow alloc] initWithContentRect: view.bounds styleMask: (NSResizableWindowMask | NSClosableWindowMask | NSTitledWindowMask) backing: NSBackingStoreBuffered defer: NO];
    [window setContentView: view];
    [window makeKeyAndOrderFront: nil];

}


@end