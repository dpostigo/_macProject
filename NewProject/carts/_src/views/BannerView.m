//
//  BannerView.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BannerView.h"
#import "NSColor+DPColors.h"
#import "NSTextField+DPUtils.h"
#import "BasicDisplayView+SurrogateUtils.h"
#import "NSView+LayoutConstraints.h"

@implementation BannerView {

}

@synthesize background;
@synthesize textLabel;
@synthesize detailTextLabel;

- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {
        NSLog(@"%s", __PRETTY_FUNCTION__);

    }

    return self;
}

- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {
        NSLog(@"%s", __PRETTY_FUNCTION__);
    }

    return self;
}

- (void) awakeFromNib {
    [super awakeFromNib];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}



- (void) viewInit {
    [super viewInit];

    NSLog(@"%s", __PRETTY_FUNCTION__);
    topMargin = 10;
    bottomMargin = 10;
    leftMargin = rightMargin = 10;
    vPadding = 5;

//    self.translatesAutoresizingMaskIntoConstraints = NO;

    if (background == nil) {
        background = [[BasicDisplayView alloc] initWithFrame: self.bounds];
        background.backgroundColor = [NSColor offwhiteColor];
        background.borderColor = [NSColor offwhiteColor];
        [self addSubview: background];
        [background constrainWidthToSuperview];


        //        NSArray *constraints = [NSArray arrayWithObjects: constraintLeft(background, self, 0), constraintRight(background, self, 0), constraintBottom(background, self, 0), nil];

        //        NSArray *constraints = [NSArray arrayWithObject: constraintWidthWithOffset(background, self, 0)];


        //        NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat: @"|[background]|" options: 0 metrics: nil views: NSDictionaryOfVariableBindings(background)];
        //        [self addConstraints: constraints];

        //        NSArray *constraints = [self newConstraintWithFormat: @"|[background]|" views: NSDictionaryOfVariableBindings(background)];
        //        NSArray *constraints = [self newConstraintWithFormat: @"|[background]|" forView: background];

        //        [self addConstraints: [self widthConstraintForView: background]];
        //        [self addConstraints: constraints];

        //        [self addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"|[background]|"  options: 0 metrics: nil views: NSDictionaryOfVariableBindings(background)]];
        //        background.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;

        //
        //        NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat: @"|[background]|" options: 0 metrics: nil views: NSDictionaryOfVariableBindings(background)];
        //        [self addConstraints: constraints];
        //
        //        constraints = [NSLayoutConstraint constraintsWithVisualFormat: @"V:|[background]|" options: 0 metrics: nil views: NSDictionaryOfVariableBindings(background)];
        //        [self addConstraints: constraints];

    }

//    if (textLabel == nil) {
//        textLabel = (BasicNewTextField *) [NSTextField clearDisplayTextFieldWithFrame: self.boundsWithMargins type: [BasicNewTextField class]];
//        [textLabel.cell setLineBreakMode: NSLineBreakByWordWrapping];
//        [textLabel.cell setWraps: YES];
//        //        textLabel.autoresizingMask = NSViewWidthSizable;
//        textLabel.autosizesToHeight = YES;
//        textLabel.font = [NSFont systemFontOfSize: 14.0];
//        [self addSubview: textLabel];
//        textLabel.stringValue = @"Title";
//    }
//
//    if (detailTextLabel == nil) {
//        detailTextLabel = [textLabel copy];
//        //        detailTextLabel.autoresizingMask = NSViewWidthSizable;
//        detailTextLabel.font = [NSFont systemFontOfSize: [NSFont smallSystemFontSize]];
//        detailTextLabel.textColor = [NSColor grayColor];
//        detailTextLabel.top = textLabel.bottom + vPadding;
//        [self addSubview: detailTextLabel];
//        detailTextLabel.stringValue = @"Subtitle";
//
//    }

    //    self.height = 100;
}



- (void) viewDidEndLiveResize {
    [super viewDidEndLiveResize];

}

//- (void) layout {
//    //    NSLog(@"%s", __PRETTY_FUNCTION__);
//    //    self.height = detailTextLabel.bottom + bottomMargin;
//    [self viewDidResize];
//    [super layout];
//}

//
//
//- (void) resizeSubviewsWithOldSize: (NSSize) oldSize {
//    [super resizeSubviewsWithOldSize: oldSize];
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}
//
//
//- (void) resizeWithOldSuperviewSize: (NSSize) oldSize {
//    [super resizeWithOldSuperviewSize: oldSize];
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}




@end