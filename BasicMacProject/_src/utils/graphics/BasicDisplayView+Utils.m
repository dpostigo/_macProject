//
//  BasicDisplayView+Utils.m
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicDisplayView+Utils.h"
#import "BasicDisplayView+SurrogateUtils.h"

@implementation BasicDisplayView (Utils)

- (void) addGradient: (BasicGradient *) aGradient {
    [self addFill: [[BasicFill alloc] initWithGradient: aGradient]];
}

- (void) removeGradient: (BasicGradient *) aGradient {
    [self removeFill: [self fillForGradient: aGradient]];
}

- (void) addFill: (BasicFill *) aFill {
    [self.fills addObject: aFill];
}

- (void) removeFill: (BasicFill *) aFill {
    if (aFill) [self.fills removeObject: aFill];
}

- (void) addBorder: (BorderOption *) aBorder {
    [self.borderOptions addObject: aBorder];
}

- (void) setBorderWidth: (CGFloat) aBorderWidth borderColor: (NSColor *) aBorderColor {
    self.borderWidth = aBorderWidth;
    self.borderColor = aBorderColor;
}

- (BasicFill *) fillForGradient: (BasicGradient *) aGradient {
    BasicFill *ret = nil;
    for (int j = 0; j < [self.fills count]; j++) {
        BasicFill *aFill = [self.fills objectAtIndex: j];
        if (aFill.gradient == aGradient) {
            ret = aFill;
            break;
        }
    }
    return ret;
}
@end