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

- (void) fillSuperviewWithInsets: (NSEdgeInsets) insets {
    NSView *superview = self.superview;
    [self mas_makeConstraints: ^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).with.offset(insets.top); //with is an optional semantic filler
        make.left.equalTo(superview.mas_left).with.offset(insets.left);
        make.bottom.equalTo(superview.mas_bottom).with.offset(-insets.bottom);
        make.right.equalTo(superview.mas_right).with.offset(-insets.right);
    }];
}

- (void) fillSuperviewWidth {
    [self fillSuperviewWithInsets: NSEdgeInsetsMake(0, 0, 0, 0)];
}


- (void) fillSuperviewWidthWithInsets: (NSEdgeInsets) insets {
    NSView *superview = self.superview;
    [self mas_makeConstraints: ^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).with.offset(insets.top); //with is an optional semantic filler
        make.left.equalTo(superview.mas_left).with.offset(insets.left);
        //        make.bottom.equalTo(super view.mas_bottom).with.offset(-insets.bottom);
        make.right.equalTo(superview.mas_right).with.offset(-insets.right);
    }];
}
@end