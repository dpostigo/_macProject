//
// Created by Dani Postigo on 1/15/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/User.h>
#import <BOAPI/Task.h>
#import "TitleController.h"
#import "NSButton+DPUtils.h"
#import "BOWindow.h"
#import "CreateTaskController.h"
#import "DDSplitViewContainer.h"
#import "MainController.h"
#import "NSView+SiblingConstraints.h"
#import "Model.h"

@implementation TitleController

@synthesize addButton;
@synthesize titleLabel;
@synthesize splitView;
@synthesize mainSplitView;

@synthesize thirdView;

@synthesize mainController;

- (void) setAddButton: (NSButton *) addButton1 {
    addButton = addButton1;
    [addButton addTarget: self action: @selector(addClicked:)];
}


- (void) setTitle: (NSString *) title {
    [super setTitle: title];
    self.titleLabel.stringValue = title;
}


- (void) setTitleLabel: (NSTextField *) titleLabel1 {
    titleLabel = titleLabel1;
    titleLabel.stringValue = @"";
}




#pragma mark Actions

- (IBAction) addClicked: (id) sender {

    [_model createTask: @"New Task"];
    //    Task *task = [[Task alloc] initWithTitle: @"New task"];

    self.window.viewController = [[CreateTaskController alloc] initWithNibName: @"TaskCreationView" bundle: nil];
}




#pragma mark View lifecycle

- (void) viewDidLoad {
    [super viewDidLoad];
    splitView.allowsMouseDown = YES;
}



#pragma mark Callbacks


- (void) modelDidSelectTask: (Task *) task {
    [super modelDidSelectTask: task];
    titleLabel.stringValue = task.title;
}


- (void) userDidLogin: (User *) user {
    NSImage *image = [addButton.image copy];
    [image setTemplate: YES];
    [addButton setImage: image];

}


#pragma mark Third view

- (void) setMainController: (MainController *) mainController1 {
    if (mainController) {
        [mainController removeObserver: self forKeyPath: @"contentView"];
    }
    mainController = mainController1;
    [mainController addObserver: self forKeyPath: @"contentView" options: 0 context: NULL];
}


- (void) setThirdView: (NSView *) thirdView1 {
    if (thirdView) {
        [[NSNotificationCenter defaultCenter] removeObserver: self name: NSViewFrameDidChangeNotification object: thirdView];
    }

    thirdView = thirdView1;

    if (thirdView) {
        thirdView.postsFrameChangedNotifications = YES;
        [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(viewDidChange:) name: NSViewFrameDidChangeNotification object: thirdView];
    }
}


- (void) observeValueForKeyPath: (NSString *) keyPath ofObject: (id) object change: (NSDictionary *) change context: (void *) context {
    if (object == mainController) {
        if ([keyPath isEqualToString: @"contentView"]) {
            [self mainContentViewDidChange];
        }
    } else {
        [super observeValueForKeyPath: keyPath ofObject: object change: change context: context];

    }
}

- (void) mainContentViewDidChange {
    DDSplitViewContainer *aView = [mainSplitView containerAtIndex: 2];
    self.thirdView = mainController.contentView;

}


- (void) viewDidChange: (NSNotification *) notification {
    NSView *lastMainView = [mainSplitView.subviews lastObject];
    CGFloat widthValue = lastMainView.left - (splitView.dividerThickness * 2);

    NSLayoutConstraint *widthConstraint = self.middleTitleContainer.staticWidthConstraint;
    if (widthConstraint == nil) {
        widthConstraint = [self.middleTitleContainer staticConstrainWidth: widthValue];
    }
    widthConstraint.constant = widthValue;

}

- (DDSplitViewContainer *) middleTitleContainer {
    return [splitView containerAtIndex: 0];
}

@end