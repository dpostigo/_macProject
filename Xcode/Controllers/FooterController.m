//
// Created by Dani Postigo on 1/21/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/GetTasksOperation.h>
#import <NSColor-Crayola/NSColor+Crayola.h>
#import "FooterController.h"
#import "BOAPIModel.h"
#import "GetLogsOperation.h"
#import "DPWindow.h"
#import "BOWindow.h"
#import "NSView+SiblingConstraints.h"
#import "NSView+ConstraintGetters.h"

@implementation FooterController

@synthesize textLabel;

@synthesize isAnimating;

- (void) viewDidLoad {
    [super viewDidLoad];
    [_apiModel subscribeDelegate: self];

    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor controlColor].CGColor;

    textLabel.textColor = [NSColor blackColor];
}


- (void) operationBegan: (NSString *) operationClass {
//    self.textLabel.stringValue = [self messageForOperationClass: operationClass];
//    [self.textLabel setNeedsDisplay: YES];
//    [self.view setNeedsDisplay: YES];
//
//    [self animateFooterHeight: 20 completion: nil];

}

- (void) operationEnded: (NSString *) operationClass {
//    [self animateFooterHeight: 0 completion: ^{
//        self.textLabel.stringValue = @"";
//    }];
}


- (void) animateFooterHeight: (CGFloat) value completion: (void (^)(void)) completion {

    if (!isAnimating) {

        self.isAnimating = YES;
        BOWindow *window = self.window;
        if (window) {
            NSLayoutConstraint *bottomConstraint = [window.contentView bottomConstraintForItem: window.contentContentView];
            NSLayoutConstraint *heightConstraint = [window.footerBarView staticHeightConstraint];

            [NSAnimationContext runAnimationGroup: ^(NSAnimationContext *context) {
                context.duration = 0.5;
                context.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut];

                if (heightConstraint) {
                    [heightConstraint.animator setConstant: value];
                }

                if (bottomConstraint) {
                    [bottomConstraint.animator setConstant: value + window.hackInset];

                }
            } completionHandler: ^{
                window.footerBarHeight = value;
                self.isAnimating = NO;
                if (completion) completion();

            }];
        }

    }

}

- (NSString *) messageForOperationClass: (NSString *) operationClass {

    NSString *ret = @"";

    NSLog(@"operationClass = %@", operationClass);
    Class classReference = NSClassFromString(operationClass);

    if ([operationClass isEqualToString: @"GetTasksOperation"]) {
        if ([classReference isEqualTo: [GetTasksOperation class]]) {
            NSLog(@"is get tasks");
        }
        if (classReference == [GetTasksOperation class]) {
            NSLog(@"is get tasks 2");

        }
    }

    if (classReference == [GetTasksOperation class]) {
        ret = @"Getting tasks";

    } else if (classReference == [GetLogsOperation class]) {
        ret = @"Getting logs";

    }
    return ret;
}
@end