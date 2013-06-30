//
//  BasicCustomWindowFrame.h
//  Carts
//
//  Created by Daniela Postigo on 6/24/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BasicCustomWindowFrame : NSView {
    CGFloat windowFramePadding;

    NSRect bottomRightRect;
    NSSize resizeRectSize;

}

@property(nonatomic) CGFloat windowFramePadding;
@property(nonatomic) NSRect bottomRightRect;
@property(nonatomic) NSSize resizeRectSize;
@end