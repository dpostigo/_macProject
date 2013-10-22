//
//  NSCell+DrawingUtils.h
//  TaskManager
//
//  Created by Daniela Postigo on 6/10/13.
//  Copyright 2013 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCell (DrawingUtils)

- (void) setupDefaults;
- (void) setBorderColor: (NSColor *) aBorderColor;
- (void) setBackgroundColor: (NSColor *) aBorderColor;
- (void) setShadowColor: (NSColor *) aBorderColor;
- (NSColor *) borderColor;
- (NSColor *) backgroundColor;
- (NSColor *) shadowColor;
@end