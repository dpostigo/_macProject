//
//  ButtonContainer.m
//  Carts
//
//  Created by Daniela Postigo on 7/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "ButtonContainer.h"


@implementation ButtonContainer {

}


@synthesize buttons;

@synthesize itemSpacing;

- (id) init {
    self = [super init];
    if (self) {
        self.buttons = [[NSMutableArray alloc] init];
        itemSpacing = 0;

    }

    return self;
}


- (void) addObject: (NSButton *) button {
    [buttons addObject: button];
    [self addSubview: button];
    [self redisplayButtons];
}


- (void) removeObject: (NSButton *) button {
    NSUInteger index = [buttons indexOfObject: button];
    if (index != -1) {
        [button removeFromSuperview];
        [buttons removeObject: button];
    }
    [self redisplayButtons];
}

- (void) redisplayButtons {
    CGFloat prevX = 0;
    for (NSButton *button in buttons) {
        NSRect buttonRect = button.frame;
        buttonRect.origin.x = prevX;
        buttonRect.origin.y = (self.height - (self.height - button.height)) / 2;
        button.frame = buttonRect;
        prevX += button.width + itemSpacing;
        //                button.autoresizingMask = NSViewMinYMargin;
    }
    prevX -= itemSpacing;


    NSRect newRect = self.frame;
    newRect.size.width = prevX;
    newRect.origin.x = newRect.origin.x == 0 ? 0 : self.superview.width - newRect.size.width;
    self.frame = newRect;


    //    self.width = prevX;
}

@end