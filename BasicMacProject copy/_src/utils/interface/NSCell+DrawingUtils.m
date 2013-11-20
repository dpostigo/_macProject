//
//  NSCell+DrawingUtils.m
//  TaskManager
//
//  Created by Daniela Postigo on 6/10/13.
//  Copyright 2013 Dani Postigo. All rights reserved.
//

#import "NSCell+DrawingUtils.h"

@implementation NSCell (DrawingUtils)

- (void) setupDefaults {
    self.borderColor = [NSColor lightGrayColor];
    self.backgroundColor = [NSColor clearColor];
    self.shadowColor = [NSColor clearColor];
}

- (void) setBorderColor: (NSColor *) aBorderColor {
    [self setValue: aBorderColor forKey: @"borderColor"];
}

- (void) setBackgroundColor: (NSColor *) aBorderColor {
    [self setValue: aBorderColor forKey: @"backgroundColor"];
}

- (void) setShadowColor: (NSColor *) aBorderColor {
    [self setValue: aBorderColor forKey: @"shadowColor"];
}

- (NSColor *) borderColor {
    return [self valueForKey: @"borderColor"];
}

- (NSColor *) backgroundColor {
    return [self valueForKey: @"backgroundColor"];
}

- (NSColor *) shadowColor {
    return [self valueForKey: @"shadowColor"];
}


@end