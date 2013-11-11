//
// Created by dpostigo on 2/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicViewController.h"
#import "NewBasicView+Utils.h"

@implementation BasicViewController {
}

@synthesize titleLabel;
@synthesize flippedView;

@synthesize background;

- (NewBasicView *) flippedView {
    if (flippedView == nil) {
        flippedView = [NewBasicView basicViewFromView: super.view];
        flippedView.controller = self;
//        NSLog(@"flippedView.controller = %@", flippedView.controller);
    }
    return flippedView;
}

- (NSView *) view {
    if (super.view && ![super.view isKindOfClass: [NewBasicView class]]) {
        return self.flippedView;
    }
    return [super view];
}

- (void) loadView {
    [super loadView];
    if (self.titleLabel != nil) self.titleLabel.stringValue = self.title;
}


- (void) setBackground: (NSView *) background1 {
    if (background) [background removeFromSuperview];
    background = background1;

    if (background) {
        background.frame = self.view.bounds;
        background.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;

        if ([self.view.subviews count] == 0) {
            [self.view addSubview: background];

        } else {
            NSView *lastSubview = [self.view.subviews objectAtIndex: 0];
            [self.view addSubview: background positioned: NSWindowBelow relativeTo: lastSubview];
        }
    }
}



- (void) subviewDidResize: (NSView *) subview {

}



#pragma mark View notifications


- (void) viewDidMoveToWindow {
}

- (void) viewDidEndLiveResize {
}


- (void) viewDidSwitchToAutolayout {

}

- (void) viewDidMoveToSuperview {

}
@end