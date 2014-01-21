//
// Created by Dani Postigo on 1/15/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/User.h>
#import <BOAPI/Task.h>
#import "TitleController.h"
#import "NSButton+DPUtils.h"
#import "BOWindow.h"
#import "TaskCreationController.h"
#import "DDSplitViewContainer.h"

@implementation TitleController

@synthesize addButton;
@synthesize titleLabel;
@synthesize splitView;
@synthesize mainSplitView;

@synthesize thirdView;

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


- (void) setThirdView: (NSView *) thirdView1 {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    if (thirdView) {
        [[NSNotificationCenter defaultCenter] removeObserver: self name: NSViewFrameDidChangeNotification object: thirdView];
    }

    thirdView = thirdView1;

    if (thirdView) {
        thirdView.postsFrameChangedNotifications = YES;
        [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(viewDidChange:) name: NSViewFrameDidChangeNotification object: thirdView];
    }
}


- (void) setMainSplitView: (DDSplitView *) mainSplitView1 {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    mainSplitView = mainSplitView1;

    DDSplitViewContainer *aView = [mainSplitView containerAtIndex: 2];

}


#pragma mark Actions

- (IBAction) addClicked: (id) sender {
    self.window.viewController = [[TaskCreationController alloc] initWithNibName: @"TaskCreationView" bundle: nil];
}




#pragma mark View lifecycle

- (void) viewDidLoad {
    [super viewDidLoad];
    splitView.allowsMouseDown = YES;
}

- (void) viewDidChange: (NSNotification *) notification {

    NSView *lastMainView = [mainSplitView.subviews lastObject];

    CGFloat widthValue = lastMainView.left;
    widthValue = lastMainView.left;
    widthValue = lastMainView.left - (splitView.dividerThickness * 2);
    [splitView setPosition: widthValue ofDividerAtIndex: 0];

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


@end