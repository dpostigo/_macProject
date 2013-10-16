//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicAppDelegate.h"
#import "BasicCustomWindowOld.h"
#import "BasicCustomWindow.h"
#import "CartsCustomWindow.h"

@interface CartsAppDelegate : BasicAppDelegate <NSApplicationDelegate, NSMenuDelegate> {

    IBOutlet NSWindow *window;
    IBOutlet NSWindow *macWindow;
    IBOutlet NSWindow *basicWindow;
}
@end