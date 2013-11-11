//
//  DataItemObject+Utils.m
//  Carts
//
//  Created by Daniela Postigo on 10/24/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "DataItemObject+Utils.h"
#import "BasicObject.h"

@implementation DataItemObject (Utils)

- (id) initWithTextLabel: (NSString *) aTextLabel detailTextLabel: (NSString *) aDetailTextLabel cellIdentifier: (NSString *) aCellIdentifier {
    self = [super init];
    if (self) {
        self.textLabel = aTextLabel;
        self.detailTextLabel = aDetailTextLabel;
        self.cellIdentifier = aCellIdentifier;
    }

    return self;
}


- (id) initWithBasicObject: (BasicObject *) basicObject {
    self = [super init];
    if (self) {
        self.textLabel = basicObject.title;
        self.content = basicObject;
    }
    return self;
}

- (id) initWithTextLabel: (NSString *) aTextLabel detailTextLabel: (NSString *) aDetailTextLabel cellIdentifier: (NSString *) aCellIdentifier image: (NSImage *) anImage {
    self = [super init];
    if (self) {
        self.textLabel = aTextLabel;
        self.detailTextLabel = aDetailTextLabel;
        self.cellIdentifier = aCellIdentifier;
        self.image = anImage;
    }

    return self;
}


- (id) initWithTextLabel: (NSString *) aTextLabel detailTextLabel: (NSString *) aDetailTextLabel cellIdentifier: (NSString *) aCellIdentifier content: (id) aContent image: (NSImage *) anImage {
    self = [super init];
    if (self) {
        self.textLabel = aTextLabel;
        self.detailTextLabel = aDetailTextLabel;
        self.cellIdentifier = aCellIdentifier;
        self.content = aContent;
        self.image = anImage;
    }

    return self;
}

- (id) initWithTextLabel: (NSString *) aTextLabel detailTextLabel: (NSString *) aDetailTextLabel image: (NSImage *) anImage {
    self = [super init];
    if (self) {
        self.textLabel = aTextLabel;
        self.detailTextLabel = aDetailTextLabel;
        self.image = anImage;
    }

    return self;
}


- (id) initWithTextLabel: (NSString *) aTextLabel cellIdentifier: (NSString *) aCellIdentifier {
    self = [super init];
    if (self) {
        self.textLabel = aTextLabel;
        self.cellIdentifier = aCellIdentifier;
    }

    return self;
}

- (id) initWithTextLabel: (NSString *) aTextLabel cellIdentifier: (NSString *) aCellIdentifier content: (id) aContent {
    self = [super init];
    if (self) {
        self.textLabel = aTextLabel;
        self.cellIdentifier = aCellIdentifier;
        self.content = aContent;
    }

    return self;
}

- (id) initWithTextLabel: (NSString *) aTextLabel cellIdentifier: (NSString *) aCellIdentifier content: (id) aContent image: (NSImage *) anImage {
    self = [super init];
    if (self) {
        self.textLabel = aTextLabel;
        self.cellIdentifier = aCellIdentifier;
        self.content = aContent;
        self.image = anImage;
    }

    return self;
}

- (id) initWithTextLabel: (NSString *) aTextLabel content: (NSString *) aContent {
    self = [super init];
    if (self) {
        self.textLabel = aTextLabel;
        self.content = aContent;
    }

    return self;
}

- (id) initWithTextLabel: (NSString *) aTextLabel image: (NSImage *) anImage {
    self = [super init];
    if (self) {
        self.textLabel = aTextLabel;
        self.image = anImage;
    }

    return self;
}

- (id) initWithTextLabel: (NSString *) aTextLabel image: (NSImage *) anImage cellIdentifier: (NSString *) aCellIdentifier {
    self = [super init];
    if (self) {
        self.textLabel = aTextLabel;
        self.image = anImage;
        self.cellIdentifier = aCellIdentifier;
    }

    return self;
}

- (id) initWithTextLabel: (NSString *) aTextLabel image: (NSImage *) anImage selectedImage: (NSImage *) aSelectedImage {
    self = [super init];
    if (self) {
        self.textLabel = aTextLabel;
        self.image = anImage;
        self.selectedImage = aSelectedImage;
    }

    return self;
}

- (id) initWithTextLabel: (NSString *) aTextLabel image: (NSImage *) anImage content: (id) aContent {
    self = [super init];
    if (self) {
        self.textLabel = aTextLabel;
        self.image = anImage;
        self.content = aContent;
    }

    return self;
}


- (id) initWithContent: (id) aContent cellIdentifier: (NSString *) aCellIdentifier {
    self = [super init];
    if (self) {
        self.cellIdentifier = aCellIdentifier;
        self.content = aContent;
    }

    return self;
}

@end