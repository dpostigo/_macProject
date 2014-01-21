//
// Created by Dani Postigo on 1/20/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSView (ConstraintBased)

- (NSLayoutPriority) horizontalContentHuggingPriority;
- (NSLayoutPriority) verticalContentHuggingPriority;
- (NSString *) stringForHorizontalContentHuggingPriority;
- (NSString *) stringForVerticalContentHuggingPriority;
- (NSString *) stringForHorizontalContentCompressionResistancePriority;
- (NSString *) stringForVerticalContentCompressionResistancePriority;
- (NSLayoutPriority) horizontalContentCompressionResistancePriority;
- (NSLayoutPriority) verticalContentCompressionResistancePriority;
@end