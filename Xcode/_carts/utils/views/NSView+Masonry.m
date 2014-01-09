//
//  NSView+Masonry.m
//  Carts
//
//  Created by Daniela Postigo on 11/7/13.
//  Copyright (c) 2013 Daniela Postigo. All rights reserved.
//

#import "NSView+Masonry.h"
#import "Masonry.h"

@implementation NSView (Masonry)

- (void) constrainToView: (NSView *) view {
    [self mas_updateConstraints: ^(MASConstraintMaker *make) {
        make.centerX.equalTo(view.mas_centerX);
        make.centerY.equalTo(view.mas_centerY);
        make.width.equalTo(view.mas_width);
        make.height.equalTo(view.mas_height);
    }];

}

- (void) fillToSuperview {
    [self fillToSuperviewWithInsets: NSEdgeInsetsMake(0, 0, 0, 0)];
}

- (void) fillToSuperviewWithInsets: (NSEdgeInsets) insets {
    NSView *superview = self.superview;
    [self mas_updateConstraints: ^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).with.offset(insets.top); //with is an optional semantic filler
        make.left.equalTo(superview.mas_left).with.offset(insets.left);
        make.bottom.equalTo(superview.mas_bottom).with.offset(-insets.bottom);
        make.right.equalTo(superview.mas_right).with.offset(-insets.right);
    }];
}

- (void) fillSuperviewWidth {
    [self fillToSuperviewWithInsets: NSEdgeInsetsMake(0, 0, 0, 0)];
}


- (void) fillToSuperviewWidth {

    NSView *superview = self.superview;
    [self mas_updateConstraints: ^(MASConstraintMaker *make) {
        make.width.equalTo(superview.mas_width);
        make.height.equalTo(@100);
        make.centerX.equalTo(superview.mas_centerX);
    }];

}


- (void) fillSuperviewWidthWithInsets: (NSEdgeInsets) insets {
    NSView *superview = self.superview;
    [self mas_updateConstraints: ^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).with.offset(insets.top); //with is an optional semantic filler
        make.left.equalTo(superview.mas_left).with.offset(insets.left);
        make.right.equalTo(superview.mas_right).with.offset(-insets.right);

        //        make.bottom.equalTo(super view.mas_bottom).with.offset(-insets.bottom);
    }];
}
@end