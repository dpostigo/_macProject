//
// Created by Daniela Postigo on 5/15/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "DataItemObject.h"

@implementation DataItemObject {
}

@synthesize textLabel;
@synthesize detailTextLabel;
@synthesize image;
@synthesize selectedImage;

- (id) initWithTextLabel: (NSString *) aTextLabel {
    self = [super init];
    if (self) {
        self.textLabel = aTextLabel;
    }

    return self;
}

- (id) initWithTextLabel: (NSString *) aTextLabel detailTextLabel: (NSString *) aDetailTextLabel {
    self = [super init];
    if (self) {
        self.textLabel = aTextLabel;
        self.detailTextLabel = aDetailTextLabel;
    }

    return self;
}


@end