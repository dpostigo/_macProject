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

@implementation TitleController

@synthesize addButton;
@synthesize titleLabel;

@synthesize splitView;
@synthesize mainSplitView;

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
    NSLog(@"%s", __PRETTY_FUNCTION__);
    //    self.window.contentDisplayView = [[TaskCreationController alloc] init]

    self.window.viewController = [[TaskCreationController alloc] initWithNibName: @"TaskCreationView" bundle: nil];
}


#pragma mark Load

- (void) viewDidLoad {
    [super viewDidLoad];

    splitView.allowsMouseDown = YES;
    thirdView.postsFrameChangedNotifications = YES;
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(viewDidChange:) name: NSViewFrameDidChangeNotification object: thirdView];

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


- (void) awakeFromNib {
    [super awakeFromNib];

}


- (void) viewDidChange: (NSNotification *) notification {

    NSView *lastMainView = [mainSplitView.subviews lastObject];

    CGFloat widthValue = lastMainView.left;
    widthValue = lastMainView.left;
    widthValue = lastMainView.left - (splitView.dividerThickness * 2);
    [splitView setPosition: widthValue ofDividerAtIndex: 0];

}


@end