//
// Created by Dani Postigo on 12/27/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LayerBackedView : NSView {
    NSShadow *shadow;
}

- (void) viewSetup;
@end