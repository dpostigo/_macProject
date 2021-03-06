//
//  List.h
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicObject.h"

@interface List : BasicObject {

    NSMutableArray *items;

}

@property(nonatomic, strong) NSMutableArray *items;
@end