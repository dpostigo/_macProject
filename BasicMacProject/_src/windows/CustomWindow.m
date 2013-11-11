//
//  CustomWindow.m
//  Carts
//
//  Created by Daniela Postigo on 10/18/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CustomWindow.h"
#import "NSWindow+DPUtils.h"

#define TITLE_HEIGHT 22

@implementation CustomWindow {

}

@synthesize windowHeaderView;
@synthesize windowFooterView;
@synthesize privateContentView;
@synthesize centersWindowButtons;

- (id) initWithContentRect: (NSRect) contentRect styleMask: (NSUInteger) aStyle backing: (NSBackingStoreType) bufferingType defer: (BOOL) flag {
    self = [super initWithContentRect: contentRect styleMask: aStyle backing: bufferingType defer: flag];
    if (self) {
        //        self.delegate = self;

    }

    return self;
}


- (void) setHeaderBarHeight: (CGFloat) titleBarHeight1 {
    if (!self.isTexturedWindow) self.isTexturedWindow = YES;
    self.contentBorderThicknessForTopEdge = titleBarHeight1;
    [self updateContentView];
}

- (CGFloat) headerBarHeight {
    return self.contentBorderThicknessForTopEdge;
}

- (void) setFooterBarHeight: (CGFloat) aHeight {
    self.contentBorderThicknessForBottomEdge = aHeight;
    [self updateContentView];
}

- (CGFloat) footerBarHeight {
    return self.contentBorderThicknessForBottomEdge;
}


- (void) setWindowHeaderView: (NSView *) windowChrome1 {
    windowHeaderView = windowChrome1;
    windowHeaderView.frame = self.rectForWindowHeader;
    windowHeaderView.autoresizingMask = NSViewWidthSizable | NSViewMinYMargin;
    [self addSubviewToWindowFrame: windowHeaderView];
}


- (void) setWindowFooterView: (NSView *) windowChrome1 {
    windowFooterView = windowChrome1;
    windowFooterView.frame = self.rectForWindowFooter;
    windowFooterView.autoresizingMask = NSViewWidthSizable | NSViewMaxYMargin;
    [self addSubviewToWindowFrame: windowFooterView];
}


- (void) updateContentView {
    if (windowHeaderView) windowHeaderView.frame = self.rectForWindowHeader;
    if (windowFooterView) windowFooterView.frame = self.rectForWindowFooter;
    if (privateContentView) privateContentView.frame = [self contentRectForFrameRect: self.bounds];

    if (centersWindowButtons) {

        CGFloat buttonAreaHeight = NSHeight(windowHeaderView.frame);
        //        buttonAreaHeight = (self.contentBorderThicknessForTopEdge - TITLE_HEIGHT);


        for (NSButton *button in self.windowButtonClones) {
            //            NSButton *buttonCopy = [button copy];
            NSRect buttonRect = button.frame;
            //            buttonRect.origin.y = (NSHeight(windowHeaderView.frame) - button.height) / 2;
            //            buttonRect.origin.y = NSHeight(windowHeaderView.frame) - 22 - 52;
            buttonRect.origin.y = NSHeight(self.bounds);
            //            buttonRect.origin.y = NSHeight(windowHeaderView.bounds) - button.height;
            //            buttonRect.origin.y = buttonRect.origin.y - (buttonRect.origin.y / 2);
            button.frame = buttonRect;
            button.height += 10;
            button.height = self.headerBarHeight - 20;
            button.autoresizingMask = NSViewNotSizable;
            //            button.height = NSHeight(self.windowFrame.frame) - NSHeight([self contentRectForFrameRect: self.bounds];)
            if (windowHeaderView) {
                //                button.autoresizingMask = NSViewMaxYMargin;
                //                [windowHeaderView addSubview: button];
                //                [self addViewToTitleBar: button atXPosition: button.left];
            }
        }
    }

}

#pragma mark NSView overrides


- (void) setContentView: (NSView *) aView {

    if (self.contentView) {
        privateContentView = aView;
        aView.frame = self.contentAsView.bounds;
        aView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
        [self.contentView addSubview: aView];
    } else {
        [super setContentView: aView];
    }
}



#pragma mark Getters



- (NSRect) rectForWindowHeader {
    //CGFloat topThicknessDiff = headerBarHeight > self.contentBorderThicknessForTopEdge ?
    NSRect ret = self.bounds;
    ret.size.height = self.contentBorderThicknessForTopEdge;
    ret.origin.y = self.bounds.size.height - ret.size.height;
    return ret;
}

- (NSRect) rectForWindowFooter {
    NSRect ret = self.bounds;
    ret.size.height = self.contentBorderThicknessForBottomEdge;
    ret.origin.y = 0;
    return ret;
}

- (NSRect) contentRectForFrameRect: (NSRect) windowFrame {
    //    NSLog(@"%s", __PRETTY_FUNCTION__);

    NSRect returnWindowFrame = windowFrame;
    returnWindowFrame.origin = NSZeroPoint;
    //    NSLog(@"NSHeight(returnWindowFrame) = %f", NSHeight(returnWindowFrame));

    if (self.hasTitleBar) {
        returnWindowFrame.size.height = NSHeight(returnWindowFrame) - TITLE_HEIGHT;
        //        NSLog(@"NSHeight(returnWindowFrame) = %f", NSHeight(returnWindowFrame));
    }

    if (self.contentBorderThicknessForTopEdge > 0) {

        //        NSLog(@"Has top edge, %f", self.contentBorderThicknessForTopEdge);
        returnWindowFrame.size.height = NSHeight(returnWindowFrame) - (self.contentBorderThicknessForTopEdge - TITLE_HEIGHT);
        //        NSLog(@"NSHeight(returnWindowFrame) = %f", NSHeight(returnWindowFrame));

    }

    if (self.contentBorderThicknessForBottomEdge > 0) {
        //        NSLog(@"Has bottom edge, %f", self.contentBorderThicknessForBottomEdge);
        returnWindowFrame.origin.y = self.contentBorderThicknessForBottomEdge;
        returnWindowFrame.size.height = returnWindowFrame.size.height - self.contentBorderThicknessForBottomEdge;
        //        NSLog(@"NSHeight(returnWindowFrame) = %f", NSHeight(returnWindowFrame));

    }
    return returnWindowFrame;
}

- (void) windowDidBecomeKey: (NSNotification *) notification {
    NSLog(@"%s", __PRETTY_FUNCTION__);

}

- (void) windowDidBecomeMain: (NSNotification *) notification {
    NSLog(@"%s", __PRETTY_FUNCTION__);

}


@end