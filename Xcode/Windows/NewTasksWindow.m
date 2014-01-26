//
// Created by Dani Postigo on 1/16/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <NSColor-Crayola/NSColor+Crayola.h>
#import <BOAPI/Task.h>
#import "NewTasksWindow.h"
#import "NSColor+NewUtils.h"
#import "CALayer+ConstraintUtils.h"
#import "CALayer+FrameUtils.h"
#import "SidebarController.h"
#import "TasksController.h"
#import "ContentController.h"
#import "Model+BOControllers.h"
#import "DividerSplitView.h"
#import "AppStyles.h"
#import "NewTitleController.h"

@implementation NewTasksWindow

@synthesize mainContent;

@synthesize left;
@synthesize middle;
@synthesize right;

- (void) awakeFromNib {
    [super awakeFromNib];

    splitView.dividerColor = [NSColor lightGrayColor];
    self.titleBarView = titleController.view;

    self.left = sidebarController.view;
    [left addConstraint: [NSLayoutConstraint constraintWithItem: left
            attribute: NSLayoutAttributeWidth
            relatedBy: NSLayoutRelationLessThanOrEqual
            toItem: nil
            attribute: NSLayoutAttributeNotAnAttribute
            multiplier: 1.0
            constant: 200]];

    [left addConstraint: [NSLayoutConstraint constraintWithItem: left
            attribute: NSLayoutAttributeWidth
            relatedBy: NSLayoutRelationGreaterThanOrEqual
            toItem: nil
            attribute: NSLayoutAttributeNotAnAttribute
            multiplier: 1.0
            constant: 100]];

    self.middle = tasksController.view;
    [middle addConstraint: [NSLayoutConstraint constraintWithItem: middle
            attribute: NSLayoutAttributeWidth
            relatedBy: NSLayoutRelationGreaterThanOrEqual
            toItem: nil
            attribute: NSLayoutAttributeNotAnAttribute
            multiplier: 1.0
            constant: 200]];

    self.right = contentController.view;

    titleController.referenceView = right;

    NSLog(@"middle.frame = %@", NSStringFromRect(middle.frame));

    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"sidebarController.outline = %@", sidebarController.outline);
    [sidebarController.outline reloadData];

}


#pragma mark Set views

- (void) setLeft: (NSView *) newLeft {
    if (left) {
        left.translatesAutoresizingMaskIntoConstraints = NO;
        newLeft.frame = left.frame;
        [left.superview replaceSubview: left with: newLeft];
        left = newLeft;
        left.translatesAutoresizingMaskIntoConstraints = NO;

    } else {
        left = newLeft;
    }
}


- (void) setMiddle: (NSView *) newView {
    if (middle) {
        middle.translatesAutoresizingMaskIntoConstraints = NO;
        newView.frame = middle.frame;
        [middle.superview replaceSubview: middle with: newView];
        middle = newView;
        middle.translatesAutoresizingMaskIntoConstraints = NO;

    } else {
        middle = newView;
    }
}


- (void) setRight: (NSView *) newView {
    if (right) {
        right.translatesAutoresizingMaskIntoConstraints = NO;
        newView.frame = right.frame;
        [right.superview replaceSubview: right with: newView];
        right = newView;
        right.translatesAutoresizingMaskIntoConstraints = NO;

    } else {
        right = newView;
    }
}


- (void) setMainContent: (NSView *) mainContent1 {

    NSLog(@"right.frame before = %@", NSStringFromRect(right.frame));
    if (mainContent && mainContent.superview) {
        [mainContent removeFromSuperview];
    }

    mainContent = mainContent1;

    if (mainContent) {
        mainContent.frame = right.frame;
        mainContent.width -= splitView.dividerThickness;
        [right.superview replaceSubview: right with: mainContent];
        right = mainContent;

        NSLog(@"right.frame after = %@", NSStringFromRect(right.frame));
    }
}


- (void) stylize {
    [super stylize];
    self.titleBarColor = [NSColor crayolaOnyxColor];
    self.shineColor = [[NSColor whiteColor] mix: [NSColor crayolaOnyxColor] fraction: 0.8];

    CALayer *topRule = [CALayer layer];
    topRule.delegate = self;
    [backgroundLayer.superlayer addSublayer: topRule];
    [topRule superConstrainEdgesH: 0];
    [topRule superConstrainBottomEdge: 0.5];

    topRule.backgroundColor = [NSColor crayolaBlackColor].CGColor;
    topRule.height = 0.5;
    topRule.shadowColor = [NSColor whiteColor].CGColor;
    topRule.shadowRadius = 0.5;
    topRule.shadowOffset = CGSizeMake(0, -1);
    topRule.shadowOpacity = 0.8;

}


- (IBAction) createTaskClicked: (id) sender {
    [_model createTask: @"New task"];
}
//
//- (NSRect) constrainFrameRect: (NSRect) frameRect toScreen: (NSScreen *) screen {
//    return [super constrainFrameRect: frameRect toScreen: screen];
//}


#pragma mark Notification window

- (void) modelDidSelectTask: (Task *) task {

    //    self.mainContent = mainController.view;
    //    self.mainContent = _model.taskDetailController.view;

}


@end