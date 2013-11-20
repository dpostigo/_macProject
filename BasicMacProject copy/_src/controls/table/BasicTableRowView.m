//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicTableRowView.h"

@implementation BasicTableRowView {
}

@synthesize selectedBackgroundColor;

@synthesize pathOptions;

- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {

        [self tableRowInit];
    }

    return self;
}


- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {
        [self tableRowInit];

    }

    return self;
}

- (void) tableRowInit {
    self.pathOptions = [[PathOptions alloc] init];

}
//
//- (void) drawSelectionInRect: (NSRect) dirtyRect {
//}

@end