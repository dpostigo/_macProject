//
// Created by Dani Postigo on 1/17/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "TaskCreationController.h"
#import "CALayer+InfoUtils.h"
#import "NSLayoutConstraint+DPUtils.h"

@implementation TaskCreationController

- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil {
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if (self) {

        self.title = @"New Task";
    }

    return self;
}

- (void) viewDidLoad {
    [super viewDidLoad];

    //
    //    taskField.textLabel.textColor = [NSColor darkGrayColor];
    //    taskField.textLabel.font = [NSFont fontWithName: @"HelveticaNeue" size: 14.0];
    //    [taskField.textLabel sizeToFit];


    //    taskField.wantsLayer = YES;

    //    CALayer *layer = taskField.layer;
    //    [layer makeSuperlayer];
    //
    //    layer.backgroundColor = [NSColor whiteColor].CGColor;
    //    layer.borderColor = [NSColor clearColor].CGColor;
    //    layer.borderWidth = 1.0;
    //
    //    CALayer *sublayer = [layer.sublayers objectAtIndex: 0];
    //    NSLog(@"sublayer.infoString = %@", sublayer.infoString);
    //
    //    CAGradientLayer *gradient = [CAGradientLayer layer];
    //    gradient.opaque = NO;
    //    gradient.colors = @[(__bridge id) [NSColor whiteColor].CGColor,
    //            (__bridge id) [NSColor whiteColor].CGColor,
    //            (__bridge id) [[NSColor crayolaMummysTombColor] mix: [NSColor whiteColor] fraction: 0.9].CGColor];
    ////    [layer insertSublayer: gradient atIndex: 0];
    //
    //    [layer addSublayer: gradient];
    //    gradient.bounds = layer.bounds;
    //    [gradient superConstrain];
    //
    //    NSLog(@"layer.superlayer = %@", layer.superlayer);

    //
    //
    //    layer = jobField.layer;
    //    layer.borderColor = [NSColor blueColor].CGColor;
    //    layer.borderWidth = 1.0;

    //    NSLog(@"jobField.layer.infoString = %@", jobField.layer.infoString);


    for (NSLayoutConstraint *constraint in self.view.constraints) {

        if (constraint.secondItem == taskField) {

            NSLog(@"constraint.firstItem = %@, constraint.secondItem = %@", constraint.firstItem, constraint.secondItem);
            NSLog(@"constraint.firstAttribute = %@, constraint.secondAttribute = %@", constraint.firstAttributeAsString, constraint.secondAttributeAsString);

        }

    }
}


@end