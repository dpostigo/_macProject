//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "BOLoginWindow.h"
#import "NSButton+DPUtils.h"
#import "BOLoginOperation.h"

@implementation BOLoginWindow

@synthesize submitButton;

- (void) setSubmitButton: (NSButton *) submitButton1 {
    submitButton = submitButton1;
    if (submitButton) {
        [submitButton addTarget: self action: @selector(validate:)];
    }
}

- (void) validate: (id) sender {

    NSLog(@"%s", __PRETTY_FUNCTION__);

    NSString *username = userField.stringValue;
    NSString *password = passwordField.stringValue;

    NSLog(@"password = %@", password);

    [_queue addOperation: [[BOLoginOperation alloc] initWithUsername: username password: password]];

}
@end