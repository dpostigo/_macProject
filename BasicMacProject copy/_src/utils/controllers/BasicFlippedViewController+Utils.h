//
//  BasicFlippedViewController+PositionUtils.h
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicFlippedViewController.h"

@interface BasicFlippedViewController (Utils)

- (void) replaceView: (NSView *) view1 withView: (NSView *) secondView;
- (void) replaceButton: (NSButton *) button withButtonCellClass: (Class) buttonCellClass;
@end