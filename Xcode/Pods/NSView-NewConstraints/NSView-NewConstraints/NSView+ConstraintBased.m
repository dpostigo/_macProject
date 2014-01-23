//
// Created by Dani Postigo on 1/20/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "NSView+ConstraintBased.h"

@implementation NSView (ConstraintBased)

- (void) sandbox {

    NSLayoutConstraintOrientation orientation = NSLayoutConstraintOrientationHorizontal;
    [self contentCompressionResistancePriorityForOrientation: orientation];
    //    contentCompressionResistancePriorityForOrientation
}


- (NSLayoutPriority) horizontalContentHuggingPriority {
    return [self contentHuggingPriorityForOrientation: NSLayoutConstraintOrientationHorizontal];
}

- (NSLayoutPriority) verticalContentHuggingPriority {
    return [self contentHuggingPriorityForOrientation: NSLayoutConstraintOrientationVertical];
}


- (NSString *) stringForHorizontalContentHuggingPriority {
    return [self layoutPriorityAsString: [self horizontalContentHuggingPriority]];
}

- (NSString *) stringForVerticalContentHuggingPriority {
    return [self layoutPriorityAsString: [self verticalContentHuggingPriority]];
}


- (NSString *) stringForHorizontalContentCompressionResistancePriority {
    return [self layoutPriorityAsString: [self horizontalContentCompressionResistancePriority]];
}

- (NSString *) stringForVerticalContentCompressionResistancePriority {
    return [self layoutPriorityAsString: [self verticalContentCompressionResistancePriority]];
}

- (NSLayoutPriority) horizontalContentCompressionResistancePriority {
    return [self contentCompressionResistancePriorityForOrientation: NSLayoutConstraintOrientationHorizontal];
}

- (NSLayoutPriority) verticalContentCompressionResistancePriority {
    return [self contentCompressionResistancePriorityForOrientation: NSLayoutConstraintOrientationVertical];
}


- (NSString *) layoutPriorityAsString: (NSLayoutPriority) priority {
    NSString *ret = nil;

    if (priority == NSLayoutPriorityDefaultLow) {
        ret = @"NSLayoutPriorityDefaultLow";

    } else if (priority == NSLayoutPriorityDefaultHigh) {
        ret = @"NSLayoutPriorityDefaultHigh";

    } else if (priority == NSLayoutPriorityDragThatCannotResizeWindow) {
        ret = @"NSLayoutPriorityDragThatCannotResizeWindow";

    } else if (priority == NSLayoutPriorityDragThatCanResizeWindow) {
        ret = @"NSLayoutPriorityDragThatCanResizeWindow";

    } else if (priority == NSLayoutPriorityFittingSizeCompression) {
        ret = @"NSLayoutPriorityFittingSizeCompression";

    } else if (priority == NSLayoutPriorityRequired) {
        ret = @"NSLayoutPriorityRequired";

    } else if (priority == NSLayoutPriorityWindowSizeStayPut) {
        ret = @"NSLayoutPriorityWindowSizeStayPut";

    }

    return ret;
}

@end