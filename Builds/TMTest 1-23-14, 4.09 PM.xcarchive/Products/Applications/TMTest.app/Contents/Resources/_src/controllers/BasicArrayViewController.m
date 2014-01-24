//
// Created by Daniela Postigo on 5/7/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicArrayViewController.h"

@implementation BasicArrayViewController

@synthesize arraySource;
@synthesize arrayController;

- (void) loadView {
    [super loadView];

    self.arraySource = [[NSMutableArray alloc] init];

    if (arrayController == nil) self.arrayController = [[NSArrayController alloc] initWithContent: arraySource];

    [self prepareDataSource];
}

#pragma mark BasicArrayViewController

- (void) prepareDataSource {
}

- (void) setArraySource: (NSMutableArray *) arraySource1 {
    arraySource = arraySource1;

    if (arraySource) {
        self.arrayController = [[NSArrayController alloc] initWithContent: arraySource];
    }
}

- (void) setArrayController: (NSArrayController *) arrayController1 {
    arrayController = arrayController1;
}


@end