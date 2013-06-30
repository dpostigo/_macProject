//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicAppDelegate.h"
#import "BasicCustomWindow.h"
#import "NewCustomWindow.h"
#import "CartsCustomWindow.h"


@interface CartsAppDelegate : BasicAppDelegate <NSApplicationDelegate, NSMenuDelegate> {

    IBOutlet CartsCustomWindow *window;
}
@end