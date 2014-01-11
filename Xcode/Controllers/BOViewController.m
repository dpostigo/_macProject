//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "BOViewController.h"
#import "Model.h"
#import "BOAPIModel.h"

@implementation BOViewController

- (void) viewDidLoad {
    _model = [Model sharedModel];
    _apiModel = [BOAPIModel sharedModel];
    [_model subscribeDelegate: self];
    _queue = [NSOperationQueue new];

}
@end