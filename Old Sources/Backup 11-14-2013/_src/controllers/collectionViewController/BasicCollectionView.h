//
//  BasicCollectionView.h
//  Carts
//
//  Created by Daniela Postigo on 11/11/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BasicCollectionViewItem;

@protocol BasicCollectionDelegate <NSObject>

@optional
- (void) customizeBasicItem: (BasicCollectionViewItem *) item object: (id) object;
- (void) customizeItem: (NSCollectionViewItem *) item object: (id) object;


@end


@interface BasicCollectionView : NSCollectionView {
    NSSize itemSize;
    __unsafe_unretained id <BasicCollectionDelegate> delegate;

}

@property(nonatomic, assign) id <BasicCollectionDelegate> delegate;
@property(nonatomic) NSSize itemSize;
@property(nonatomic, strong) Class itemClass;
@end