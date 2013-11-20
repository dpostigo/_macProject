//
//  ButtonContainer.h
//  Carts
//
//  Created by Daniela Postigo on 7/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicInnerShadowView.h"

@interface ButtonContainer : NSView {

    NSMutableArray *buttons;
    CGFloat itemSpacing;
    CGFloat rightMargin;
}

@property(nonatomic, strong) NSMutableArray *buttons;
@property(nonatomic) CGFloat itemSpacing;
@property(nonatomic) CGFloat rightMargin;
- (void) addObject: (NSButton *) button;
- (void) removeObject: (NSButton *) button;
@end