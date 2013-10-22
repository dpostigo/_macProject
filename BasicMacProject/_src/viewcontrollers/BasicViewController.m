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

- (NewBasicView *) flippedView {
    if (flippedView == nil) {
        flippedView = [NewBasicView basicViewFromView: super.view];
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


@end