//
// Created by Daniela Postigo on 5/15/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "DataSection.h"
#import "DataItemObject.h"
#import "BasicObject.h"
#import "DataItemObject+Utils.h"
#import "NSMutableArray+Sorting.h"
#import "DataSection+Utils.h"

@implementation DataSection {
}

@synthesize rows;
@synthesize title;

@synthesize sortMode;

- (id) initWithTitle: (NSString *) aTitle {
    self = [super init];
    if (self) {
        [self sectionInit];
        self.title = aTitle;
    }

    return self;
}

- (id) initWithTitle: (NSString *) aTitle content: (id) aContent {
    self = [super init];
    if (self) {
        [self sectionInit];
        self.title = aTitle;
        self.content = aContent;
    }

    return self;
}

- (void) sectionInit {
    self.rows = [[NSMutableArray alloc] init];
    self.sortMode = ItemDateDescendingSortType;

}

- (void) addRow: (id) object {
    DataItemObject *row = nil;
    if ([object isKindOfClass: [DataItemObject class]]) {
        row = object;
    } else if ([object isKindOfClass: [BasicObject class]]) {
        row = [[DataItemObject alloc] initWithBasicObject: object];
    } else {
        NSLog(@"Not adding row.");
        return;
    }

    [self.rows addObject: row];
    [self sortRows];

}


- (void) setRows: (NSMutableArray *) rows1 {
    rows = rows1;
    [self sortRows];
}


@end