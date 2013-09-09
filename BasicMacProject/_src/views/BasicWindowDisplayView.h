//
//  BasicWindowDisplayView.h
//  Carts
//
//  Created by Daniela Postigo on 9/9/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicDisplayView.h"

@interface BasicWindowDisplayView : BasicDisplayView {

}


- (NSView *) singleSubview;
- (NSRect) topLeft;
- (NSRect) topRightCornerRect;
- (NSRect) bottomLeft;
- (NSRect) bottomRight;
- (NSRect) cacheImageTopRight;
- (NSRect) cacheImageTopLeft;
- (NSRect) cacheImageTopMiddle;
- (NSRect) cacheImageBottomRight;
@end