//
// Created by Dani Postigo on 1/2/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "DPHeaderedWindow.h"
#import "NSView+SuperConstraints.h"
#import "NSView+ConstraintGetters.h"

@implementation DPHeaderedWindow {

}


@synthesize headerView;
@synthesize footerView;



- (void) setHeaderView: (NSView *) headerView1 {
    if (headerView && headerView.superview) {
        [headerView removeFromSuperview];
    }

    headerView = headerView1;

    if (headerView) {
        [self.themeFrame addSubview: headerView];

        headerView.translatesAutoresizingMaskIntoConstraints = NO;

        [headerView superConstrain: NSLayoutAttributeLeft constant: self.hackInset];
        [headerView superConstrain: NSLayoutAttributeRight constant: -self.hackInset];
        [headerView selfConstrain: NSLayoutAttributeHeight constant: self.titleBarHeight];
        //        [headerView superConstrain: NSLayoutAttributeTop constant: self.hackInset];
        [headerView superConstrain: NSLayoutAttributeTop constant: self.hackInset];

    }
}

- (void) setFooterView: (NSView *) footerView1 {
    if (footerView && footerView.superview) {
        [footerView removeFromSuperview];
    }

    footerView = footerView1;

    if (footerView) {
        [windowView addSubview: footerView];
        footerView.translatesAutoresizingMaskIntoConstraints = NO;

        CGFloat inset = 0;
        [footerView superConstrain: NSLayoutAttributeLeft constant: self.hackInset];
        [footerView superConstrain: NSLayoutAttributeRight constant: -self.hackInset];
        [footerView selfConstrain: NSLayoutAttributeHeight constant: self.footerBarHeight];
        [footerView superConstrain: NSLayoutAttributeBottom constant: -inset];
    }

}


- (void) updateConstraintsIfNeeded {
    [super updateConstraintsIfNeeded];


    if (footerView) {
        NSLayoutConstraint *bottomConstraint = [windowView bottomConstraintForItem: footerView];
        bottomConstraint.constant = -self.hackInset;
    }

}

@end