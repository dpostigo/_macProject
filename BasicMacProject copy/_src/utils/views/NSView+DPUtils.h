//
//  NSView+BlendingUtils.h
//  Carts
//
//  Created by Daniela Postigo on 11/11/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSView (DPUtils)

- (void) safeRemove: (NSView *) subview;
- (void) insertSubview: (NSView *) subview atIndex: (NSUInteger) index1;
@end