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
@class Job;
@class Task;

@interface Model : BasicModel <BOAPIDelegate> {

    User *currentUser;

    Job *selectedJob;
    Task *selectedTask;
    User *selectedArtist;
    NSString *selectedFocusType;

    NSWorkspaceNib *masterNib;
    NSObject <BOAPIDelegate> *operationHandler;
}

@property(nonatomic, strong) NSWorkspaceNib *masterNib;
@property(nonatomic, strong) NSObject <BOAPIDelegate> *operationHandler;
@property(nonatomic, strong) NSString *username;
@property(nonatomic, strong) NSString *password;


@property(nonatomic, copy) NSString *selectedFocusType;
@property(nonatomic, strong) User *currentUser;
@property(nonatomic, strong) Job *selectedJob;
@property(nonatomic, strong) User *selectedArtist;
@property(nonatomic, strong) Task *selectedTask;
+ (Model *) sharedModel;
- (NSWorkspaceNib *) masterNib;
- (NSMutableArray *) jobs;
- (NSMutableArray *) tasks;
- (NSMutableArray *) contacts;
- (NSMutableArray *) serviceItems;
@end