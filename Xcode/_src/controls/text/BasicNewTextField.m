//
//  BasicNewTextField.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicNewTextField.h"

@implementation BasicNewTextField {

}

@synthesize autosizesToHeight;

- (void) setStringValue: (NSString *) aString {
    [super setStringValue: aString];

    NSRect currentRect = self.frame;

    if (autosizesToHeight) {
        [self sizeToFit];
        self.width = currentRect.size.width;
        if (self.superview) {
            [self layoutSubtreeIfNeeded];
        }
    }
}


- (id) copyWithZone: (NSZone *) zone {
    BasicNewTextField *copy = [[[self class] allocWithZone: zone] init];

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