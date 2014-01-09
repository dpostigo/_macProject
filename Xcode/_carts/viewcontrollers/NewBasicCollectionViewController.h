//
//  NewBasicCollectionViewController.h
//  Carts
//
//  Created by Daniela Postigo on 10/24/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicFlippedViewController.h"

@interface NewBasicCollectionViewController : BasicFlippedViewController <NSCollectionViewDelegate> {

    NSCollectionView *collection;
}

@property(nonatomic, strong) NSCollectionView *collection;
@end