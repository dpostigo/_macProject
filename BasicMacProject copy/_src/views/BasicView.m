//
// Created by dpostigo on 2/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicView.h"
#import "BasicCustomWindow.h"

@implementation BasicView {
    NSTrackingRectTag trackingRect;
}

@synthesize customWindow;

- (void) viewWillDraw {
    [super viewWillDraw];
}

- (void) viewWillStartLiveResize {
    [super viewWillStartLiveResize];
}

- (void) viewWillMoveToWindow: (NSWindow *) newWindow {
    [super viewWillMoveToWindow: newWindow];
}

- (void) viewDidMoveToWindow {
    [super viewDidMoveToWindow];

    if ([self.window isKindOfClass: [BasicCustomWindow class]]) self.customWindow = (BasicCustomWindow *) self.window;
}

- (BOOL) isOpaque {
    return NO;
}


@end