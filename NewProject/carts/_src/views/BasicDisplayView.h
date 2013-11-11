//
//  BasicDisplayView.h
//  Carts
//
//  Created by Daniela Postigo on 7/4/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicView.h"
#import "PathOptionsProtocol.h"

@interface BasicDisplayView : BasicView <PathOptionsProtocol> {
    PathOptions *pathOptions;
    NSImage *cacheImage;
}

@property(nonatomic, strong) PathOptions *pathOptions;

- (void) pathOptionsInit;

- (id) copyWithZone: (NSZone *) zone;
@end