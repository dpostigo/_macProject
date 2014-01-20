//
// Created by Dani Postigo on 1/19/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@class InputTextFieldCell;

@interface InputTextField : NSTextField {

}

- (InputTextFieldCell *) inputCell;
- (NSTextField *) textLabel;
@end