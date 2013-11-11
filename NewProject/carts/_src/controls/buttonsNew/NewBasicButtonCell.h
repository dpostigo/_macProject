//
//  NewBasicButtonCell.h
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PathOptions.h"
#import "PathOptionsProtocol.h"

@interface NewBasicButtonCell : NSButtonCell <PathOptionsProtocol> {

    PathOptions *pathOptions;
}

@property(nonatomic, strong) PathOptions *pathOptions;
@end