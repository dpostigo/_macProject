//
// Created by Daniela Postigo on 5/7/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicArrayViewController.h"
#import "BasicCollectionView.h"
#import "BasicCollectionViewItem.h"

@interface BasicCollectionViewController : BasicArrayViewController <NSCollectionViewDelegate, BasicCollectionDelegate> {
    BasicCollectionView *collection;

    IBOutlet NSCollectionView *nibCollection;
}

@property(nonatomic, strong) BasicCollectionView *collection;
- (void) customizeBasicItem: (BasicCollectionViewItem *) item object: (id) object;
- (void) customizeItem: (NSCollectionViewItem *) item object: (id) object;
@end