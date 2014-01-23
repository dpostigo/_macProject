//
// Created by Dani Postigo on 1/17/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <NSColor-Crayola/NSColor+Crayola.h>
#import <BOAPI/Job.h>
#import "TaskCreationController.h"
#import "BackgroundTextField.h"
#import "CALayer+ConstraintUtils.h"
#import "NSColor+NewUtils.h"
#import "NewInputTextFieldCell.h"
#import "NSMutableAttributedString+DPKit.h"
#import "CALayer+InfoUtils.h"
#import "Model.h"
#import "BOAPIModel.h"
#import "GetAssigneeProcess.h"
#import "BOWindow.h"

@implementation TaskCreationController {
    NSArray *genders;
}

@synthesize jobButton;
@synthesize selectedJob;

- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil {
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if (self) {
        self.title = @"New Task";
    }

    return self;
}

- (void) viewDidLoad {
    [super viewDidLoad];

    [_apiModel subscribeDelegate: self];

    NSArray *fields = [NSArray arrayWithObjects: @"Task", @"Job", nil];

    for (int j = 0; j < [fields count]; j++) {
        NSString *string = [fields objectAtIndex: j];
    }

    [self setupFields];


    //    self.window.initialFirstResponder = taskField;
    //    [self.window selectNextKeyView: taskField];

}


- (void) awakeFromNib {
    [super awakeFromNib];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [taskField becomeFirstResponder];
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





#pragma mark IBActions

- (IBAction) popupButtonClicked: (id) sender {
    NSPopUpButton *button = sender;
    id value = [jobController.selection valueForKeyPath: @"self"];
}


- (IBAction) updateSelectedJob: (id) sender {
    NSPopUpButton *button = sender;
    self.selectedJob = [jobController.selection valueForKeyPath: @"self"];

}


- (IBAction) updateSelectedAssignee: (id) sender {
    NSPopUpButton *button = sender;
    //    NSLog(@"[button valueClassForBinding: <#(NSString *)binding#>] = %@", [button valueClassForBinding: <#(NSString *)binding#>]);
    //    id value = [jobController.selection valueForKeyPath: @"self"];
    //    self.selectedJob = value;

}



#pragma mark BOAPIDelegate


- (void) jobsDidUpdate: (Job *) job {
    [jobController setContent: _model.jobs];
}

- (void) jobDidUpdate: (Job *) job assignees: (NSArray *) assignees {
    //    [assigneeController setContent: self.assignees];
}




#pragma mark Setters

- (void) setSelectedJob: (Job *) selectedJob1 {
    selectedJob = selectedJob1;
    if (selectedJob) {
        [_queue addOperation: [[GetAssigneeProcess alloc] initWithJob: selectedJob]];
    }
}

- (User *) selectedAssignee {
    return [assigneeController.selection valueForKeyPath: @"self"];
}

#pragma mark Getters


- (NSArray *) assignees {
    return self.selectedJob == nil ? nil : self.selectedJob.assignees;
}


#pragma mark Submit

- (IBAction) submit: (id) sender {

    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"self.selectedAssignee = %@", self.selectedAssignee);
}


#pragma mark Styling



- (void) customizeField: (BackgroundTextField *) field {

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


@end