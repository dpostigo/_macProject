//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CartsAppDelegate.h"
#import "NSNib+WorkspaceNib.h"
#import "NSWorkspaceNib.h"
#import "NSWindow+DPUtils.h"
#import "DPStyledWindow.h"
#import "BOAPIModel.h"

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

    //    bgWindow.headerView = [_model.masterNib viewForClass: @"CartsHeaderController"];
//    bgWindow.contentContentView = view;
    //    bgWindow.isVisible = NO;
    //    [bgWindow close];
    //    [bgWindow performClose: nil];

    //    window = [[NSWindow alloc] initWithContentRect: view.bounds styleMask: (NSResizableWindowMask | NSClosableWindowMask | NSTitledWindowMask) backing: NSBackingStoreBuffered defer: NO];
    //    [window setContentView: view];
    //    [window makeKeyAndOrderFront: nil];


    [BOAPIModel sharedModel].delegate = _model.operationHandler;

    NSWindow *loginWindow = [_model.masterNib objectWithIdentifier: @"LoginWindow"];
    [loginWindow makeKeyAndOrderFront: nil];

}


@end