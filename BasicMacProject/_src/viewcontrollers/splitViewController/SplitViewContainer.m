//
// Created by Daniela Postigo on 5/18/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SplitViewContainer.h"

@implementation SplitViewContainer {
}

@synthesize isLocked;
@synthesize delegate;
@synthesize dividerThickness;

@synthesize minimumValue;
@synthesize maximumValue;

- (id) init {
    self = [super init];
    if (self) {

    }

    return self;
}


- (void) notifyDelegate: (SEL) selector {
    if (delegate && [delegate respondsToSelector: selector]) {
        [delegate performSelector: selector withObject: self];
    }
}

- (void) setMaximumWidth: (CGFloat) maximumWidth1 {
    maximumValue = maximumWidth1;
    [self notifyDelegate: @selector(splitContainerChangedMaximumWidth:)];
}

- (void) setMinimumHeight: (CGFloat) minimumHeight1 {
    minimumValue = minimumHeight1;
    [self notifyDelegate: @selector(splitContainerChangedMinimumHeight:)];
}

- (void) setMaximumHeight: (CGFloat) maximumHeight1 {
    maximumValue = maximumHeight1;
    [self notifyDelegate: @selector(splitContainerChangedMaximumHeight:)];
}

- (void) setMaximumValue: (CGFloat) maximumValue1 {
    maximumValue = maximumValue1;
    [self notifyDelegate: @selector(splitContainerChangedMaximumValue:)];
}

- (void) setMinimumValue: (CGFloat) minimumValue1 {
    minimumValue = minimumValue1;
    [self notifyDelegate: @selector(splitContainerChangedMinimumValue:)];
}


@end