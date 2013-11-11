//
// Created by Daniela Postigo on 5/8/13.
// Copyright (c) 2013 Daniela Postigo. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicObject.h"
#import "NSObject+NSCoding.h"

@implementation BasicObject {
}

@synthesize id;
@synthesize title;

@synthesize creationDate;

- (id) initWithCoder: (NSCoder *) coder {
    self = [super init];
    if (self) {
        [self autoDecode: coder];
    }
    return self;
}

- (id) initWithTitle: (NSString *) aTitle {
    self = [super init];
    if (self) {
        self.title = aTitle;
        self.creationDate = [NSDate date];
    }

    return self;
}

+ (id) objectWithTitle: (NSString *) title {
    return [[self alloc] initWithTitle: title];
}

- (void) encodeWithCoder: (NSCoder *) coder {
    [self autoEncodeWithCoder: coder];
}

@end