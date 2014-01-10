//
// Created by Dani Postigo on 12/31/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "ButtonCell.h"

@implementation ButtonCell {

}

- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {
        [self setupButton];
    }

    return self;
}


- (void) setupButton {
    //NSLog(@"self.highlightsBy = %li", self.highlightsBy);
    //NSLog(@"self.showsStateBy = %li", self.showsStateBy);

}


- (void) drawInteriorWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    [super drawInteriorWithFrame: cellFrame inView: controlView];

    //NSLog(@"self.state = %li", self.state);

}

@end