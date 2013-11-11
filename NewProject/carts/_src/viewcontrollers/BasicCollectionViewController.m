//
// Created by Daniela Postigo on 5/7/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicCollectionViewController.h"
#import "BasicCollectionViewItem.h"

@implementation BasicCollectionViewController {
}

@synthesize collection;

- (void) loadView {
    [super loadView];
    if (collection == nil) {
        self.collection = [[NSCollectionView alloc] initWithFrame: self.view.bounds];
    }

    NSLog(@"self.collection.frame = %@", NSStringFromRect(self.collection.frame));

}

- (void) setCollection: (NSCollectionView *) collection1 {
    if (collection) [collection removeFromSuperview];

    collection = collection1;

    if (collection) {
        collection.delegate = self;
        collection.itemPrototype = [[BasicCollectionViewItem alloc] init];
        collection.content = arrayController.arrangedObjects;
        collection.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
        [self.view addSubview: collection];
    }
}





@end