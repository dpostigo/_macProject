//
//  ResizingView.h
//  Carts
//
//  Created by Daniela Postigo on 10/25/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewBasicView.h"

@interface ResizingView : NewBasicView {

    BOOL resizesSuperviews;
}

@property(nonatomic) BOOL resizesSuperviews;
- (void) viewDidResize;
@end