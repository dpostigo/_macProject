//
//  NSView+LayoutConstraints.m
//  Carts
//
//  Created by Daniela Postigo on 11/1/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSView+LayoutConstraints.h"
#import "NSObject+InstanceName.h"
#import "AutoLayoutHelpers.h"

@implementation NSView (LayoutConstraints)

- (void) convertToAutolayout {
    if (!self.translatesAutoresizingMaskIntoConstraints && self.superview) {
        if (self.autoresizingMask == (self.autoresizingMask & NSViewWidthSizable)) {
            self.width = self.superview.width;
            [self constrainWidthToSuperview];
        }

        if (self.autoresizingMask == (self.autoresizingMask & NSViewHeightSizable)) {
            self.height = self.superview.height;
            [self constrainHeightToSuperview];
        }
    }
}

- (void) constrainWidthToSuperview {
    NSArray *constraints = [NSArray arrayWithObjects: constraintWidthWithOffset(self, self.superview, 0), nil];
    [self.superview addConstraints: constraints];
}

- (void) constrainHeightToSuperview {
    NSArray *constraints = [NSArray arrayWithObjects: constraintHeightWithOffset(self, self.superview, 0), nil];
    [self.superview addConstraints: constraints];
}

- (NSArray *) widthConstraint {
    return [self constraintWithFormat: @"|[self]|" forView: self];
}


- (NSArray *) widthConstraintForView: (NSView *) view {
    NSString *viewName = [self propertyName: view];
    NSString *format = [NSString stringWithFormat: @"|[%@]|", viewName];
    return [self constraintWithFormat: format forView: view];
}

- (NSArray *) constraintWithFormat: (NSString *) format forView: (NSView *) aView {
    return [NSLayoutConstraint constraintsWithVisualFormat: format options: 0 metrics: nil views: NSDictionaryOfVariableBindings(aView)];
}


@end