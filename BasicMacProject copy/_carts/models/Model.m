//
//  Model.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "Model.h"

@implementation Model {

}

+ (Model *) sharedModel {
    static Model *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}


- (NSNib *) workspaceNib {
    return [[NSNib alloc] initWithNibNamed: @"Workspace" bundle: nil];
}

@end