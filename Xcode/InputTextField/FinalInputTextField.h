//
// Created by Dani Postigo on 1/20/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NewInputTextFieldCell;

@interface FinalInputTextField : NSTextField {

    IBOutlet NSView *backgroundView;
    CALayer *backgroundLayer;


    NSEdgeInsets insets;

}

@property(nonatomic, strong) NSView *backgroundView;
@property(nonatomic, strong) CALayer *backgroundLayer;
@property(nonatomic) NSEdgeInsets insets;
- (NewInputTextFieldCell *) inputCell;
@end