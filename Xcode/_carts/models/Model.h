//
//  Model.h
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicModel.h"
#import "List.h"
#import "BOAPIDelegate.h"

@class NSWorkspaceNib;

@interface Model : BasicModel <BOAPIDelegate> {

    NSWorkspaceNib *masterNib;
}

@property(nonatomic, strong) NSWorkspaceNib *masterNib;

+ (Model *) sharedModel;
- (NSWorkspaceNib *) masterNib;
@end