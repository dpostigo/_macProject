//
// Created by Dani Postigo on 1/11/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <BOAPI/Task.h>
#import <NSView-DPAutolayout/NSView+SiblingConstraints.h>
#import "TaskDetailController.h"
#import "BackgroundTextField.h"
#import "Model.h"
#import "NSView+NewConstraint.h"
#import "NSLayoutConstraint+DPUtils.h"
#import "NSView+ConstraintGetters.h"

@implementation TaskDetailController

- (void) viewDidLoad {
    [super viewDidLoad];

    NSLayoutConstraint *widthConstraint = [titleField constraintForAttribute: NSLayoutAttributeWidth item: titleField attribute: NSLayoutAttributeNotAnAttribute secondItem: nil];
    //    widthConstraint = [titleField.constraints objectAtIndex: 0];
    //    NSLog(@"widthConstraint.firstItem = %@", widthConstraint.firstItem);
    //    NSLog(@"widthConstraint.secondItem = %@", widthConstraint.secondItem);
    //    NSLog(@"widthConstraint.firstAttributeAsString = %@", widthConstraint.firstAttributeAsString);
    //    NSLog(@"widthConstraint.secondAttributeAsString = %@", widthConstraint.secondAttributeAsString);
    NSLog(@"widthConstraint = %@", widthConstraint);
    if (widthConstraint) {
        [titleField removeConstraint: widthConstraint];
        [titleField.superview superConstrainWidth];
    }


    //    [_queue addOperation: [[Get alloc] init]];
}

- (void) awakeFromNib {
    [super awakeFromNib];

}


#pragma mark IBOutlets



- (Task *) task {
    return _model.selectedTask;
}

- (void) modelDidSelectTask: (Task *) task {
    [super modelDidSelectTask: task];
    [objectController setContent: self.task];
}


@end