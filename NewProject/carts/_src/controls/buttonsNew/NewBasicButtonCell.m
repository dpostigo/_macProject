//
//  NewBasicButtonCell.m
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NewBasicButtonCell.h"
#import "PathOptions+Utils.h"
#import "BasicCenteredGradient.h"

@implementation NewBasicButtonCell {

}

@synthesize pathOptions;

- (id) initTextCell: (NSString *) aString {
    self = [super initTextCell: aString];
    if (self) {
        [self buttonCellInit];

    }

    return self;
}

- (id) initImageCell: (NSImage *) image {
    self = [super initImageCell: image];
    if (self) {
        [self buttonCellInit];

    }

    return self;
}


- (void) buttonCellInit {
    //    NSLog(@"%s", __PRETTY_FUNCTION__);
    //    self.backgroundColor = [NSColor clearColor];
    pathOptions = [PathOptions defaultPathOptions];
    pathOptions.name = NSStringFromClass([self class]);
    [pathOptions setBorderWidth: 1 borderColor: [NSColor blackColor]];
        [pathOptions borderAtIndex: 1].gradient = [[BasicCenteredGradient alloc] initWithBaseColors: [NSArray arrayWithObjects: [NSColor alphaWhite:  1.0], [NSColor alphaWhite: 1.0], nil] centerColor: [NSColor alphaWhite: 0.6]];
}


- (NSRect) drawTitle: (NSAttributedString *) title withFrame: (NSRect) frame inView: (NSView *) controlView {
    //    NSLog(@"%s", __PRETTY_FUNCTION__);
    return [super drawTitle: title withFrame: frame inView: controlView];
}

- (void) drawBezelWithFrame: (NSRect) frame inView: (NSView *) controlView {
    //    NSLog(@"%s", __PRETTY_FUNCTION__);

    //    NSLog(@"controlView.frame = %@", NSStringFromRect(controlView.frame));

    //    [super drawBezelWithFrame: frame inView: controlView];
}

- (void) drawImage: (NSImage *) image withFrame: (NSRect) frame inView: (NSView *) controlView {
    //    NSLog(@"%s", __PRETTY_FUNCTION__);
    [super drawImage: image withFrame: frame inView: controlView];
}


- (void) drawInteriorWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    //    NSLog(@"%s", __PRETTY_FUNCTION__);
    [super drawInteriorWithFrame: cellFrame inView: controlView];
}

- (void) drawWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    //    NSLog(@"%s", __PRETTY_FUNCTION__);
    //    [super drawWithFrame: cellFrame inView: controlView];


    //    NSLog(@"cellFrame = %@", NSStringFromRect(cellFrame));
    //NSLog(@"controlView.isFlipped = %d", controlView.isFlipped);
    //    NSLog(@"controlView = %@", controlView);
    //    NSLog(@"controlView.frame = %@", NSStringFromRect(controlView.frame));
    [[NSColor clearColor] set];
    NSRectFillUsingOperation(cellFrame, NSCompositeSourceAtop);
    [pathOptions drawWithRect: cellFrame];

}

//- (BOOL) isOpaque {
//    return YES;
//}




@end