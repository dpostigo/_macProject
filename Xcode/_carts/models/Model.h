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

@interface Model : BasicModel

+ (Model *) sharedModel;

- (NSNib *) workspaceNib;
@end