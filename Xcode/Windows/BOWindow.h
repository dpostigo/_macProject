//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DPWindow/DPStyledWindow.h>

@class Model;

@interface BOWindow : DPStyledWindow {

    Model *_model;
    NSOperationQueue *_queue;

}
@end