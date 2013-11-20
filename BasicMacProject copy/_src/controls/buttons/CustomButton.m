//
//  CustomButton.m
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CustomButton.h"
#import "NewBasicButtonCell.h"

@implementation CustomButton {

}

//+ (Class) cellClass {
//    return [super cellClass];
//}


- (id) initWithFrame: (NSRect) frameRect cellClass: (Class) aCellClass {
    self = [super initWithFrame: frameRect];
    if (self) {
        //        [CustomButton setCellClass: aCellClass];
        [self setCell: [[aCellClass alloc] init]];
    }

    return self;

}


- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {

    }

    return self;
}

- (BOOL) isFlipped {
    return NO;
}


@end