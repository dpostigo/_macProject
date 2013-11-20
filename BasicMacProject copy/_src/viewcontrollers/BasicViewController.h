//
// Created by dpostigo on 2/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "VeryBasicViewController.h"
#import "NewBasicView.h"

@interface BasicViewController : VeryBasicViewController {

    NSTextField *titleLabel;
    NewBasicView *flippedView;
    NSView *background;

    NSEdgeInsets insets;
}

@property(nonatomic, strong) NSTextField *titleLabel;
@property(nonatomic, strong) NewBasicView *flippedView;
@property(nonatomic, strong) NSView *background;
@property(nonatomic) NSEdgeInsets insets;
- (void) viewDidMoveToWindow;
- (void) viewDidEndLiveResize;
- (void) viewDidSwitchToAutolayout;
- (void) viewDidMoveToSuperview;
- (void) updateConstraints;
- (void) subviewDidResize: (NSView *) subview;
@end