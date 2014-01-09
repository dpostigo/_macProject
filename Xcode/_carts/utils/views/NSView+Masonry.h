//
//  NSView+Masonry.h
//  Carts
//
//  Created by Daniela Postigo on 11/7/13.
//  Copyright (c) 2013 Daniela Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSView (Masonry)

- (void) constrainToView: (NSView *) view;
- (void) fillToSuperview;
- (void) fillToSuperviewWithInsets: (NSEdgeInsets) insets;
- (void) fillSuperviewWidth;
- (void) fillSuperviewWidthWithInsets: (NSEdgeInsets) insets;
@end