//
//  BasicNewCustomWindow.h
//  Carts
//
//  Created by Daniela Postigo on 9/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicView.h"

@interface BasicNewCustomWindow : NSWindow {
    BasicView *internalContentView;

    CGFloat topMargin;
    CGFloat bottomMargin;
    CGFloat leftMargin;
    CGFloat rightMargin;

    NSRect contentRect;

}

@property(nonatomic, strong) BasicView *internalContentView;
@property(nonatomic, strong) id windowBackgroundView;
@property(nonatomic) NSRect contentRect;
@property(nonatomic) CGFloat topMargin;
@property(nonatomic) CGFloat bottomMargin;
@property(nonatomic) CGFloat leftMargin;
@property(nonatomic) CGFloat rightMargin;
- (void) setup;
- (NSRect) bounds;
@end