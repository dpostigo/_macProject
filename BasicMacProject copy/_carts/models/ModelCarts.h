//
//  ModelCarts.h
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicModel.h"
#import "List.h"

@interface ModelCarts : BasicModel {

    NSMutableArray *lists;
    List *selectedList;

}

@property(nonatomic, strong) List *selectedList;
@property(nonatomic, strong) NSMutableArray *lists;
+ (ModelCarts *) sharedModel;
- (void) addList: (List *) aList;
@end