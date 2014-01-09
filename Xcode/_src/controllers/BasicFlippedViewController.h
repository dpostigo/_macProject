//
// Created by dpostigo on 2/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "VeryBasicViewController.h"
#import "NewBasicView.h"
#import "BasicViewController.h"

@interface BasicFlippedViewController : BasicViewController {

    NSTextField *titleLabel;
    NewBasicView *flippedView;

    NSEdgeInsets insets;
}

@property(nonatomic, strong) NSTextField *titleLabel;
@property(nonatomic, strong) NewBasicView *flippedView;
@property(nonatomic) NSEdgeInsets insets;
- (void) viewDidMoveToWindow;
- (void) viewDidEndLiveResize;
- (void) viewDidSwitchToAutolayout;
- (void) viewDidMoveToSuperview;
- (void) updateConstraints;
- (void) subviewDidResize: (NSView *) subview;
@end