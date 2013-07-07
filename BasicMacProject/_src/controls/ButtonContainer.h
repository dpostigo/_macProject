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
}

@property(nonatomic, strong) NSMutableArray *buttons;
@property(nonatomic) CGFloat itemSpacing;
- (void) addObject: (NSButton *) button;
- (void) removeObject: (NSButton *) button;
@end