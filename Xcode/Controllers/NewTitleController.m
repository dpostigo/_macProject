//
// Created by Dani Postigo on 1/23/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <NSView-NewConstraints/NSView+NewConstraint.h>
#import <NSView-DPAutolayout/NSView+SiblingConstraints.h>
#import <BOAPI/Task.h>
#import "NewTitleController.h"
#import "DDSplitView.h"

@implementation NewTitleController

@synthesize referenceView;

- (void) awakeFromNib {
    [super awakeFromNib];
    [self viewDidLoad];

    splitView.allowsMouseDown = YES;
    splitView.splitDividerColor = [NSColor blackColor];
    splitView.translatesAutoresizingMaskIntoConstraints = NO;
    self.middle.translatesAutoresizingMaskIntoConstraints = NO;
    self.right.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}


- (void) setReferenceView: (NSView *) referenceView1 {
    if (referenceView) {
        [[NSNotificationCenter defaultCenter] removeObserver: self name: NSViewFrameDidChangeNotification object: referenceView];
    }
    referenceView = referenceView1;

    if (referenceView) {
        referenceView.postsFrameChangedNotifications = YES;
        [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(viewDidChange:) name: NSViewFrameDidChangeNotification object: referenceView];
    }
}


- (void) viewDidChange: (NSNotification *) notification {

    CGFloat widthValue = referenceView.left;

    NSLayoutConstraint *leading = [splitView superLeadingConstraint];
    if (leading == nil) {
        leading = [splitView superConstrainLeading: referenceView.superview.left];
    }
    leading.constant = referenceView.superview.left;

    NSView *view = self.right;

    for (NSLayoutConstraint *constraint in splitView.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeWidth && constraint.relation == NSLayoutRelationEqual) {
            [splitView removeConstraint: constraint];
        }
    }

    NSLayoutConstraint *widthConstraint = view.staticWidthConstraint;

    if (widthConstraint == nil) {
        widthConstraint = [view staticConstrainWidth: referenceView.width];
    }
    widthConstraint.constant = referenceView.width;

}


- (NSView *) middle {
    return [splitView.subviews objectAtIndex: 0];
}


- (NSView *) right {
    return [splitView.subviews objectAtIndex: 1];
}


#pragma mark Notification Delegate




- (void) modelDidSelectTask: (Task *) task {
    //    textLabel.stringValue = task.title;
}

- (void) modelDidCreateTask: (Task *) task {
    //    textLabel.stringValue = task.title;

}


- (void) userDidLogin: (User *) user {
    //    NSImage *image = [addButton.image copy];
    //    [image setTemplate: YES];
    //    [addButton setImage: image];

}

@end