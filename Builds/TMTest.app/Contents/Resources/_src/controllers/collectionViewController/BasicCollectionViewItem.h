//
//  BasicCollectionViewItem.h
//  Carts
//
//  Created by Daniela Postigo on 10/24/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicDisplayView.h"

@class BasicCollectionView;

@interface BasicCollectionViewItem : NSCollectionViewItem {
    NSView *background;
    BasicDisplayView *displayBackground;
    NSEdgeInsets insets;

}

@property(nonatomic, strong) NSView *background;
@property(nonatomic) NSEdgeInsets insets;


@property(nonatomic, strong) BasicDisplayView *displayBackground;
+ (BasicDisplayView *) displayBackground;
- (BasicCollectionView *) basicCollectionView;
@end