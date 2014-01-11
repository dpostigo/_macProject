//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Model;
@class BOAPIModel;

@interface BOViewController : NSViewController {

    Model *_model;
    BOAPIModel *_apiModel;
    NSOperationQueue *_queue;
}

- (void) viewDidLoad;
@end