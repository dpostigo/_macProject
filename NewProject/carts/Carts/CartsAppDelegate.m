//
//  CartsAppDelegate.m
//  Carts
//
//  Created by Daniela Postigo on 11/5/13.
//  Copyright (c) 2013 Daniela Postigo. All rights reserved.
//

#import "CartsAppDelegate.h"
#import "Masonry.h"
#import "BasicDisplayView.h"
#import "BasicDisplayView+SurrogateUtils.h"
#import "BasicDisplayView+Carts.h"

@implementation CartsAppDelegate

- (void) applicationDidFinishLaunching: (NSNotification *) aNotification {
    // Insert code here to initialize your application

    //    customView.width = 800;
//    [self addMasonryConstraints];

}

- (void) addMasonryConstraints {

    NSView *contentView = self.window.contentView;

    BasicDisplayView *greenView = [BasicDisplayView basicBackground];
    //    greenView.backgroundColor = [NSColor whiteColor];
    //    greenView.layer.borderColor = NSColor.blackColor.CGColor;
    //    greenView.layer.borderWidth = 2;
    [contentView addSubview: greenView];

    BasicDisplayView *redView = [BasicDisplayView newWithBackgroundColor: [NSColor redColor]];
    //    redView.layer.borderColor = NSColor.blackColor.CGColor;
    //    redView.layer.borderWidth = 2;
    [contentView addSubview: redView];

    NSView *blueView = [BasicDisplayView newWithBackgroundColor: [NSColor blueColor]];
    [contentView addSubview: blueView];

    NSView *superview = contentView;
    int padding = 10;

    //if you want to use Masonry without the mas_ prefix
    //define MAS_SHORTHAND before importing Masonry.h see Masonry iOS Examples-Prefix.pch
    [greenView mas_makeConstraints: ^(MASConstraintMaker *make) {
        make.top.greaterThanOrEqualTo(superview.mas_top).offset(padding);
        make.left.equalTo(superview.mas_left).offset(padding);
        make.bottom.equalTo(blueView.mas_top).offset(-padding);
        make.right.equalTo(redView.mas_left).offset(-padding);
        make.width.equalTo(redView.mas_width);

        make.height.equalTo(redView.mas_height);
        make.height.equalTo(blueView.mas_height);
    }];

    //with is semantic and option
    [redView mas_makeConstraints: ^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).with.offset(padding); //with with
        make.left.equalTo(greenView.mas_right).offset(padding); //without with
        make.bottom.equalTo(blueView.mas_top).offset(-padding);
        make.right.equalTo(superview.mas_right).offset(-padding);
        make.width.equalTo(greenView.mas_width);

        make.height.equalTo(@[greenView, blueView]); //can pass array of views
    }];

    [blueView mas_makeConstraints: ^(MASConstraintMaker *make) {
        make.top.equalTo(greenView.mas_bottom).offset(padding);
        make.left.equalTo(superview.mas_left).offset(padding);
        make.bottom.equalTo(superview.mas_bottom).offset(-padding);
        make.right.equalTo(superview.mas_right).offset(-padding);
        make.height.equalTo(@[greenView.mas_height, redView.mas_height]); //can pass array of attributes
    }];

}

- (void) addProgrammaticConstraints {

    NSView *contentView = self.window.contentView;
    NSLog(@"button.constraints = %@", button.constraints);
    [button removeConstraints: button.constraints];
    [customView removeConstraints: customView.constraints];
    NSLog(@"button.constraints = %@", button.constraints);



    //    [button addConstraint: constrain];
    //
    //    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(button);
    //    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[button]|" options: 0 metrics: nil views: NSDictionaryOfVariableBindings(button)];

    //    [self.window.contentView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[button(70)]|" options: 0 metrics: nil views: NSDictionaryOfVariableBindings(button)]];
    //    [self.window.contentView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:[button(21)]" options: 0 metrics: nil views: NSDictionaryOfVariableBindings(button)]];
    //    [self.window.contentView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:[button(70)]" options: 0 metrics: nil views: NSDictionaryOfVariableBindings(button)]];

    NSLog(@"button.constraints = %@", button.constraints);

    //    [self.window.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[avatarView]-[optionalTextField]-[requiredTextField]-|" options:NSLayoutFormatAlignAllBottom metrics:nil views:views]];
    //    [self.window.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[avatarView]-|" options:0 metrics:nil views:views]];
    //    [self.window.contentView addConstraint: [NSLayoutConstraint constraintWithItem: button
    //                                                                         attribute: NSLayoutAttributeWidth
    //                                                                         relatedBy: NSLayoutRelationEqual
    //                                                                            toItem: self.window.contentView
    //                                                                         attribute: NSLayoutAttributeWidth
    //                                                                        multiplier: 1
    //                                                                          constant: 0]];
    //
    //
    //
    //    [contentView addConstraint: [NSLayoutConstraint constraintWithItem: button
    //                                                             attribute: NSLayoutAttributeWidth
    //                                                             relatedBy: NSLayoutRelationEqual
    //                                                                toItem: self.window.contentView
    //                                                             attribute: NSLayoutAttributeWidth
    //                                                            multiplier: 1
    //                                                              constant: 0]];


    NSDictionary *views = NSDictionaryOfVariableBindings(customView);

    [contentView addConstraints:
            [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[customView]|"
                                                    options: 0
                                                    metrics: nil
                                                      views: views]];

    [contentView addConstraints:
            [NSLayoutConstraint constraintsWithVisualFormat: @"V:|[customView]|"
                                                    options: 0
                                                    metrics: nil
                                                      views: views]];

}


@end
