//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicAppDelegate.h"

@class DPStyledWindow;


@interface CartsAppDelegate : BasicAppDelegate <NSApplicationDelegate, NSMenuDelegate, NSWindowDelegate> {

    IBOutlet NSWindow *macWindow;
    IBOutlet NSWindow *styledWindow;
    IBOutlet DPStyledWindow *bgWindow;
}
@end