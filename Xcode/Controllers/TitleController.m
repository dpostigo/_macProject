//
// Created by Dani Postigo on 1/15/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/User.h>
#import <BOAPI/Task.h>
#import "TitleController.h"
#import "DDSplitView.h"
#import "DDSplitViewContainer.h"
#import "NSView+SiblingConstraints.h"
#import "NSView+ConstraintGetters.h"
#import "NSButton+DPUtils.h"

@implementation TitleController

@synthesize splitView;
@synthesize mainSplitView;

@synthesize addButton;

@synthesize titleLabel;

- (void) setAddButton: (NSButton *) addButton1 {
    addButton = addButton1;
    [addButton addTarget: self action: @selector(addClicked:)];
}


- (void) setTitleLabel: (NSTextField *) titleLabel1 {
    titleLabel = titleLabel1;
    titleLabel.stringValue = @"";
}


#pragma mark Actions

- (IBAction) addClicked: (id) sender {
    NSLog(@"%s", __PRETTY_FUNCTION__);
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

    //    [addButton.image setTemplate: YES];
    //    [addButton setNeedsDisplay: YES];
}


- (void) awakeFromNib {
    [super awakeFromNib];

}


- (NSLayoutConstraint *) widthConstraintForView: (NSView *) view {
    NSLayoutConstraint *ret = nil;
    NSArray *constraints = [NSArray arrayWithArray: view.constraints];
    for (NSLayoutConstraint *constraint in constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeWidth && constraint.relation == NSLayoutRelationGreaterThanOrEqual) {
            ret = constraint;
            break;
        }
    }

    return ret;

}


- (void) setDividerPosition: (int) index {
    DDSplitViewContainer *mainView = [mainSplitView containerAtIndex: index];
    DDSplitViewContainer *titleView = [splitView containerAtIndex: index];

    CGFloat minValue = [mainSplitView minPossiblePositionOfDividerAtIndex: index];
    CGFloat position = minValue + mainView.width;

    [splitView setPosition: mainView.width ofDividerAtIndex: index];
    //    titleView.width = mainView.width;
}


- (void) setViewWidth: (int) index {
    DDSplitViewContainer *mainView = [mainSplitView containerAtIndex: index];
    DDSplitViewContainer *titleView = [splitView containerAtIndex: index];
    titleView.width = mainView.width;
}

- (void) setLockedValue: (int) index {
    DDSplitViewContainer *mainView = [mainSplitView containerAtIndex: index];
    DDSplitViewContainer *titleView = [splitView containerAtIndex: index];
    titleView.lockedValue = mainView.lockedValue;
    titleView.isLocked = mainView.isLocked;
}





//
//
//- (void) splitViewDidResizeSubviews: (NSNotification *) notification {
//
//    if (notification.object == mainSplitView) {
//        //                [self setDividerPosition: 0];
//
////
//        //        //        for (int j = 0; j < [mainSplitView.subviews count] - 1; j++) {
//        //
//        //        int index = 0;
//        //        DDSplitViewContainer *mainView = [mainSplitView containerAtIndex: index];
//        //        DDSplitViewContainer *titleView = [splitView containerAtIndex: index];
//        //
//        //
//        //        CGFloat minValue = [mainSplitView minPossiblePositionOfDividerAtIndex: index];
//        //        CGFloat position = minValue + mainView.width;
//        //        NSLog(@"position = %f", position);
//        //
//        //        [splitView setPosition: mainView.width ofDividerAtIndex: index];
//        //        titleView.width = mainView.width;
//        //        }
//
//
//
//    } else if (notification.object == splitView) {
//        //        NSLog(@"is splitView");
//
//
//
//
////        for (NSView *view in splitView.subviews) {
////            NSLog(@"view.frame = %@", NSStringFromRect(view.frame));
////        }
//    }
//
//    //    NSLog(@"%s", __PRETTY_FUNCTION__);
//    //
//    //    //    NSLog(@"mainSplitView.constraints = %@", mainSplitView.constraints);
//    //
//    //    NSArray *subviews = [NSArray arrayWithArray: mainSplitView.subviews];
//    //
//    //    //    for (int j = 0; j < [subviews count] - 1; j++) {
//    //    //        DDSplitViewContainer *view1 = [mainSplitView containerAtIndex: j];
//    //    //        DDSplitViewContainer *titleView = [splitView containerAtIndex: j];
//    //    //
//    //    //
//    //    //        CGFloat minValue = [mainSplitView minPossiblePositionOfDividerAtIndex: j];
//    //    //
//    //    //        CGFloat position = view1.left + view1.width;
//    //    //        [splitView setPosition: position ofDividerAtIndex: j];
//    //    //
//    //    //        //        titleView.width = view1.width;
//    //    //        //        NSLog(@"view1.width = %f", view1.width);
//    //    //
//    //    //    }
//
//}



- (void) viewDidChange: (NSNotification *) notification {

    NSView *lastMainView = [mainSplitView.subviews lastObject];
    //    NSLog(@"%f vs %f", thirdView.width, lastMainView.width);

    CGFloat widthValue = lastMainView.left;
    widthValue = lastMainView.left;
    widthValue = lastMainView.left - (splitView.dividerThickness * 2);
    [splitView setPosition: widthValue ofDividerAtIndex: 0];

}


@end