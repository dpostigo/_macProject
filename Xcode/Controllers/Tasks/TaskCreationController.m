//
// Created by Dani Postigo on 1/17/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <NSColor-Crayola/NSColor+Crayola.h>
#import <BOAPI/Job.h>
#import "TaskCreationController.h"
#import "FinalInputTextField.h"
#import "CALayer+ConstraintUtils.h"
#import "NSColor+NewUtils.h"
#import "NewInputTextFieldCell.h"
#import "NSMutableAttributedString+DPKit.h"
#import "CALayer+InfoUtils.h"
#import "Model.h"
#import "BOAPIModel.h"

@implementation TaskCreationController {
    NSArray *genders;
}

@synthesize jobButton;

- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil {
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if (self) {

        self.title = @"New Task";
    }

    return self;
}

- (void) viewDidLoad {
    [super viewDidLoad];

    [_apiModel addDelegate: self];

    NSArray *fields = [NSArray arrayWithObjects: @"Task",
                                                 @"Job",
                                                 nil];

    for (int j = 0; j < [fields count]; j++) {
        NSString *string = [fields objectAtIndex: j];
    }

    [self setupFields];
    [self testArrayController];

}

- (void) testArrayController {

    genders = [[NSArray alloc] initWithObjects: [NSDictionary dictionaryWithObjectsAndKeys: @"male", @"name", @"m", @"value", nil],
                                                [NSDictionary dictionaryWithObjectsAndKeys: @"female", @"name", @"f", @"value", nil],
                                                nil];

//    genders = self.jobs;
//    [arrayController setContent: genders];
    [arrayController setContent: _model.jobs];

}

- (void) setupFields {

    [self customizeField: taskField];
    [self customizeField: jobField];
    [self customizeField: assigneeField];
    [jobField.backgroundLayer sublayerWithName: @"gradient"].cornerRadius = 3.0;
    [assigneeField.backgroundLayer sublayerWithName: @"gradient"].cornerRadius = 3.0;

    taskField.nextKeyView = jobField;
    jobField.nextKeyView = assigneeField;

}

- (void) customizeField: (FinalInputTextField *) field {

    CAGradientLayer *gradient;
    gradient = [CAGradientLayer layer];
    gradient.name = @"gradient";
    gradient.colors = @[
            (__bridge id) [[NSColor crayolaMummysTombColor] mix: [NSColor whiteColor] fraction: 0.9].CGColor,
            (__bridge id) [NSColor whiteColor].CGColor,
            (__bridge id) [NSColor whiteColor].CGColor];

    CALayer *layer = field.backgroundView.layer;
    [layer addSublayer: gradient];
    gradient.delegate = layer.delegate;
    gradient.masksToBounds = YES;
    [gradient superConstrain];

    NSShadow *dropShadow = [[NSShadow alloc] init];
    dropShadow.shadowColor = [NSColor crayolaMummysTombColor];
    dropShadow.shadowOffset = NSMakeSize(0, -1);
    dropShadow.shadowBlurRadius = 2.0;
    field.backgroundView.shadow = dropShadow;

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString: [NSString stringWithFormat: @"%@:", field.inputCell.stringValue]];
    [string addAttribute: NSForegroundColorAttributeName value: [NSColor crayolaMummysTombColor]];

    NSFont *font = [NSFont fontWithName: @"HelveticaNeue" size: field.font.pointSize];
    [string addAttribute: NSFontAttributeName value: font];

    field.inputCell.attributedLabelString = string;
    field.stringValue = @"";

}


- (void) setJobButton: (NSPopUpButton *) jobButton1 {
    jobButton = jobButton1;
    if (jobButton) {
        //        jobButton.menu.delegate = self;
    }
}



#pragma mark BOAPIDelegate


- (void) jobsDidUpdate: (Job *) job {
    NSLog(@"%s", __PRETTY_FUNCTION__);

}


@end