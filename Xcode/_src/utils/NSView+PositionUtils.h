//
// Created by dpostigo on 2/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSView (PositionUtils)


- (void) embedView: (NSView *) aSubview;
- (void) embedInView: (NSView *) aSuperview;
- (void) embedInView: (NSView *) aSuperview autoResizingMask: (NSUInteger) autoMask;
- (void) removeAllSubviews;

@end