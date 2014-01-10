//
//  Model.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "Model.h"
#import "NSWorkspaceNib.h"
#import "OperationHandler.h"
#import "NSObject+UserDefaults.h"

@implementation Model

@synthesize masterNib;
@synthesize operationHandler;

+ (Model *) sharedModel {
    static Model *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}


- (NSWorkspaceNib *) masterNib {
    if (masterNib == nil) {
        masterNib = [[NSWorkspaceNib alloc] initWithNibNamed: @"Workspace" bundle: nil];
    }
    return masterNib;
}

- (id <BOAPIDelegate>) operationHandler {
    if (operationHandler == nil) {
        operationHandler = [[OperationHandler alloc] init];
    }
    return operationHandler;
}



#pragma mark Defaults
//
//- (void) setUsername: (NSString *) username {
//    _username = [username mutableCopy];
//    [[NSUserDefaults standardUserDefaults] setObject: self.username forKey: @"username"];
//
//}


- (void) setPassword: (NSString *) password {
    [self saveObject: password forKey: @"password"];
}

- (NSString *) password {
    NSString *ret = [self savedObjectForKey: @"password"];
    if (ret == nil) {
        ret = @"";
    }
    return ret;
}

- (void) setUsername: (NSString *) username {
    [self saveObject: username forKey: @"username"];
}

- (NSString *) username {
    NSString *ret = [self savedObjectForKey: @"username"];
    if (ret == nil) {
        ret = @"";
    }
    return ret;
}

@end


