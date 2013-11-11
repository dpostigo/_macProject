//
//  CartsAppDelegate.h
//  Carts
//
//  Created by Daniela Postigo on 11/5/13.
//  Copyright (c) 2013 Daniela Postigo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CartsAppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet NSButton *button;
    IBOutlet NSView *customView;
}

@property (assign) IBOutlet NSWindow *window;

@end
