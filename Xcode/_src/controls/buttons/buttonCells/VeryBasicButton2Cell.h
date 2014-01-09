//
//  VeryBasicButton2Cell.h
//  Carts
//
//  Created by Daniela Postigo on 7/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PathOptions.h"
#import "ImageOptions.h"

@interface VeryBasicButton2Cell : NSButtonCell {

    BorderOption *innerBorder;
    PathOptions *pathOptions;
    PathOptions *disabledPathOptions;
    ImageOptions *imageOptions;

}

@property(nonatomic, strong) PathOptions *pathOptions;
@property(nonatomic, strong) PathOptions *disabledPathOptions;
@property(nonatomic, strong) ImageOptions *imageOptions;
@property(nonatomic, strong) BorderOption *innerBorder;
@end