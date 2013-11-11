//
//  NSTextField+DPUtils.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSTextField+DPUtils.h"

@implementation NSTextField (DPUtils)

+ (NSTextField *) clearTextField {
    return [NSTextField clearTextFieldWithFrame: NSZeroRect];
}


+ (NSTextField *) clearTextFieldWithFrame: (NSRect) aFrame {
    NSTextField *ret = [[NSTextField alloc] initWithFrame: aFrame];
    ret.backgroundColor = [NSColor clearColor];
    return ret;
}


+ (NSTextField *) clearDisplayTextFieldWithFrame: (NSRect) aFrame {
    return [NSTextField clearDisplayTextFieldWithFrame: aFrame type: [NSTextField class]];
}


+ (NSTextField *) clearDisplayTextFieldWithFrame: (NSRect) aFrame type: (Class) textFieldType {
    NSTextField *ret = [NSTextField displayTextFieldWithFrame: aFrame type: textFieldType];
    ret.backgroundColor = [NSColor clearColor];
    return ret;
}


+ (NSTextField *) displayTextFieldWithFrame: (NSRect) aFrame {
    return [NSTextField displayTextFieldWithFrame: aFrame type: [NSTextField class]];
}


+ (NSTextField *) displayTextFieldWithFrame: (NSRect) aFrame type: (Class) textFieldType {
    NSTextField *ret = [[textFieldType alloc] initWithFrame: aFrame];
    [ret setEditable: NO];
    [ret setBordered: NO];
    return ret;
}


- (id) copyWithZone: (NSZone *) zone {
    NSTextField *copy = [[[self class] allocWithZone: zone] init];

    if (copy != nil) {
        [copy setEditable: self.isEditable];
        [copy setBordered: self.isBordered];
        copy.backgroundColor = self.backgroundColor;
        copy.font = self.font;
        copy.frame = self.frame;

    }

    return copy;
}


@end