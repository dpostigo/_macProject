//
// Created by Dani Postigo on 12/27/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BlueLayerBackedView.h"

@implementation BlueLayerBackedView {

}

- (void) viewSetup {
    [super viewSetup];
    self.layer.backgroundColor = [NSColor blueColor].CGColor;
    self.layer.borderColor = [NSColor blackColor].CGColor;
}

@end