//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicAppDelegate.h"
#import "CustomWindow.h"
#import "ControlledCustomWindow.h"

@interface CartsAppDelegate : BasicAppDelegate <NSApplicationDelegate, NSMenuDelegate, NSWindowDelegate> {

    IBOutlet ControlledCustomWindow *window;
    IBOutlet NSWindow *macWindow;
    IBOutlet NSWindow *styledWindow;
}
@end