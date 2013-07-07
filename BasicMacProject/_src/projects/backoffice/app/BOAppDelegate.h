//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicAppDelegate.h"
#import "AppWindow.h"
#import "BasicCustomWindowOld.h"
#import "DPCustomWindow.h"


@interface BOAppDelegate : BasicAppDelegate <NSApplicationDelegate, NSMenuDelegate> {

    IBOutlet NSView *rightView;
    IBOutlet NSView *leftView;

    IBOutlet NSWindow *loginWindow;
    IBOutlet NSPanel *loginPanel;
    IBOutlet BasicCustomWindowOld *contentWindow;
    IBOutlet DPCustomWindow *newTaskWindow;
}
@end