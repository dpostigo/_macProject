//
// Created by Dani Postigo on 1/17/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputTextFieldCell : NSTextFieldCell {


    BOOL adjustsBorder;
    NSTextField *textLabel;
    NSEdgeInsets padding;
    BOOL isEditing;
}

@property(nonatomic) NSEdgeInsets padding;
@property(nonatomic, strong) NSTextField *textLabel;
@property(nonatomic) BOOL adjustsBorder;
@property(nonatomic) BOOL isEditing;
@end