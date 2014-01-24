//
// Created by Daniela Postigo on 5/7/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicCollectionViewController.h"
#import "BasicCollectionViewItem.h"
#import "Masonry.h"
#import "BasicDisplayView.h"
#import "BasicDisplayView+Carts.h"
#import "BasicDisplayView+SurrogateUtils.h"

@implementation BasicCollectionViewController {
}

@synthesize collection;

- (void) loadView {
    [super loadView];

    insets = NSEdgeInsetsMake(10, 10, 10, 10);
    if (collection == nil) self.collection = [[BasicCollectionView alloc] initWithFrame: self.view.bounds];
}


- (void) setCollection: (BasicCollectionView *) collection1 {
    if (collection) {
        if (collection.superview) [collection removeFromSuperview];
    }

    collection = collection1;

    if (collection) {
        collection.delegate = self;
        collection.itemPrototype = [[BasicCollectionViewItem alloc] init];
        collection.content = arrayController.arrangedObjects;
        [self.view addSubview: collection];
    }
}

- (void) viewDidMoveToSuperview {
    [super viewDidMoveToSuperview];

    [self.view setNeedsUpdateConstraints: YES];
    [self updateConstraints];

}

- (void) updateConstraints {
    [super updateConstraints];

    if (collection) {
        [collection mas_updateConstraints: ^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).with.insets(insets);
        }];
    }
}

#pragma mark NSCollectionViewDelegate

- (void) customizeBasicItem: (BasicCollectionViewItem *) item object: (id) object {
    item.displayBackground.backgroundColor = [NSColor whiteColor];
}


- (void) customizeItem: (NSCollectionViewItem *) item object: (id) object {

}


@end