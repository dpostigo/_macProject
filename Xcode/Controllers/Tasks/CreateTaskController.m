//
// Created by Dani Postigo on 1/17/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/Job.h>
#import <BOAPI/Task.h>
#import <BOAPI/NSArray+BOBasicObject.h>
#import <BOAPI/User.h>
#import "CreateTaskController.h"
#import "Model.h"
#import "BOAPIModel.h"
#import "GetAssigneeProcess.h"
#import "SuggestibleTextField.h"
#import "NSArray+User.h"
#import "SuggestionsWindowController.h"
#import "SuggestionsManager.h"
#import "BOBackgroundTextField.h"
#import "DPBackgroundTextField.h"
#import "CALayer+InfoUtils.h"

@implementation CreateTaskController {
    NSArray *genders;
}

@synthesize jobButton;
@synthesize selectedJob;
@synthesize taskField;
@synthesize submitButton;

@synthesize selectedTask;

- (void) viewDidLoad {
    [super viewDidLoad];
    [_apiModel subscribeDelegate: self];
    [self setupFields];
}


- (void) awakeFromNib {
    [super awakeFromNib];
    [self viewDidLoad];

    [self roundTextField: (BOBackgroundTextField *) jobField];

    assigneeField.suggestionsController.defaultImage = [NSImage imageNamed: @"default-user"];

    [jobController bind: @"content" toObject: _model withKeyPath: @"jobs" options: nil];

    self.selectedJob = self.selectedTask.job;

    SuggestionsManager *manager = [SuggestionsManager manager];
    [manager addTextField: jobField suggestions: [_model.jobs titles]];
    [manager setItemPrototype: @"TextSuggestionPrototype" textField: jobField];
}


- (void) roundTextField: (BOBackgroundTextField *) textField {
    textField.insets = NSEdgeInsetsMake(4, 4, 4, 4);
    [textField.backgroundView.layer setSublayerCornerRadius: 3.0];
}

- (void) setupFields {

    //    [self customizeField: taskField];
    //    [self customizeField: jobField];
    //    [self customizeField: assigneeField];
    //    [jobField.backgroundLayer sublayerWithName: @"gradient"].cornerRadius = 3.0;
    //    [assigneeField.backgroundLayer sublayerWithName: @"gradient"].cornerRadius = 3.0;
    //
    //    taskField.nextKeyView = jobField;
    //    jobField.nextKeyView = assigneeField;

}



#pragma mark IBActions

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
    //    [jobController setContent: _model.jobs];
}

- (void) jobDidUpdate: (Job *) job assignees: (NSArray *) assignees {
    [assigneeController setContent: self.assignees];

    assigneeField.suggestibleStrings = [self.assignees titles];
    assigneeField.suggestionImages = [self.assignees thumbnailURLs];
}



#pragma mark NSObject + NSEditorRegistration

- (void) objectDidBeginEditing: (id) editor {
    [super objectDidBeginEditing: editor];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void) objectDidEndEditing: (id) editor {
    [super objectDidEndEditing: editor];
}




#pragma mark Setters

- (void) setSelectedJob: (Job *) selectedJob1 {
    selectedJob = selectedJob1;
    if (selectedJob) {
        [_queue addOperation: [[GetAssigneeProcess alloc] initWithJob: selectedJob]];
    }

    id value = [jobController.selection valueForKeyPath: @"self"];

    Task *taskValue = [objectController.selection valueForKeyPath: @"self"];
    NSLog(@"taskValue.assignee.title = %@", taskValue.assignee.title);
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



//
//
//- (void) customizeField: (DPBackgroundTextField *) field {
//
//    CAGradientLayer *gradient;
//    gradient = [CAGradientLayer layer];
//    gradient.name = @"gradient";
//    gradient.colors = @[
//            (__bridge id) [[NSColor crayolaMummysTombColor] mix: [NSColor whiteColor] fraction: 0.9].CGColor,
//            (__bridge id) [NSColor whiteColor].CGColor,
//            (__bridge id) [NSColor whiteColor].CGColor];
//
//    CALayer *layer = field.backgroundView.layer;
//    [layer addSublayer: gradient];
//    gradient.delegate = layer.delegate;
//    gradient.masksToBounds = YES;
//    [gradient superConstrain];
//
//    NSShadow *dropShadow = [[NSShadow alloc] init];
//    dropShadow.shadowColor = [NSColor crayolaMummysTombColor];
//    dropShadow.shadowOffset = NSMakeSize(0, -1);
//    dropShadow.shadowBlurRadius = 2.0;
//    field.backgroundView.shadow = dropShadow;
//
////    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString: [NSString stringWithFormat: @"%@:", field.inputCell.stringValue]];
////    [string addAttribute: NSForegroundColorAttributeName value: [NSColor crayolaMummysTombColor]];
////
////    NSFont *font = [NSFont fontWithName: @"HelveticaNeue" size: field.font.pointSize];
////    [string addAttribute: NSFontAttributeName value: font];
////
////    field.inputCell.attributedLabelString = string;
////    field.stringValue = @"";
//
//}



- (NSArray *) jobs {
    return _model.jobs;
}

@end