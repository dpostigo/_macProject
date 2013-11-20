//
//  CustomWindow.h
//  Carts
//
//  Created by Daniela Postigo on 10/18/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicWindowTitleView.h"

@interface CustomWindow : NSWindow <NSWindowDelegate> {

    BOOL centersWindowButtons;
    NSView *privateContentView;
    NSView *windowHeaderView;
    NSView *windowFooterView;

}

@property(nonatomic, strong) NSView *windowHeaderView;
@property(nonatomic, strong) NSView *windowFooterView;
@property(nonatomic) CGFloat headerBarHeight;
@property(nonatomic, strong) NSView *privateContentView;
@property(nonatomic) BOOL centersWindowButtons;
- (void) setFooterBarHeight: (CGFloat) aHeight;
- (CGFloat) footerBarHeight;
- (NSRect) rectForWindowHeader;
@end