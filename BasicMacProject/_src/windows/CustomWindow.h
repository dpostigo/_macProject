//
//  CustomWindow.h
//  Carts
//
//  Created by Daniela Postigo on 9/23/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicWindowDisplayView.h"

@interface CustomWindow : NSWindow {

    BasicWindowDisplayView *windowBackground;
    NSView *newContentView;

}

@property(nonatomic, strong) BasicWindowDisplayView *windowBackground;

@property(nonatomic) CGFloat topMargin;
@property(nonatomic) CGFloat bottomMargin;
- (void) setup;
@end