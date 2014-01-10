//
//  Model.h
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicModel.h"
#import "BOAPIDelegate.h"

@class NSWorkspaceNib;
@class OperationHandler;

@interface Model : BasicModel <BOAPIDelegate> {
    NSWorkspaceNib *masterNib;
    NSObject <BOAPIDelegate> *operationHandler;
}

@property(nonatomic, strong) NSWorkspaceNib *masterNib;
@property(nonatomic, strong) NSObject <BOAPIDelegate> *operationHandler;
@property(nonatomic, strong) NSString *username;
@property(nonatomic, strong) NSString *password;


+ (Model *) sharedModel;
- (NSWorkspaceNib *) masterNib;
@end