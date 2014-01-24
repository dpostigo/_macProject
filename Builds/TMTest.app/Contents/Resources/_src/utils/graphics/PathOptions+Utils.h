//
//  PathOptions+PositionUtils.h
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PathOptions.h"

@interface PathOptions (Utils)

+ (PathOptions *) defaultPathOptions;
- (NSRect) rectForPathOptions: (NSRect) rect;
- (void) addBorder: (BorderOption *) aBorder;
- (void) setBorderWidth: (CGFloat) aBorderWidth borderColor: (NSColor *) aBorderColor;
- (BorderOption *) borderAtIndex: (NSInteger) index1;
@end