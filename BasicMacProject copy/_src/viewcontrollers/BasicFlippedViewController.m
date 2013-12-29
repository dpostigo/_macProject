//
// Created by dpostigo on 2/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicFlippedViewController.h"
#import "NewBasicView+Utils.h"

@implementation BasicFlippedViewController {
}

@synthesize titleLabel;
@synthesize flippedView;

@synthesize insets;

- (NewBasicView *) flippedView {
    if (flippedView == nil) {
        flippedView = [NewBasicView basicViewFromView: super.view];
        flippedView.controller = self;
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
    insets = NSEdgeInsetsMake(0, 0, 0, 0);
    if (self.titleLabel != nil) self.titleLabel.stringValue = self.title;
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

//- (void) updateConstraints {
//
//}
@end