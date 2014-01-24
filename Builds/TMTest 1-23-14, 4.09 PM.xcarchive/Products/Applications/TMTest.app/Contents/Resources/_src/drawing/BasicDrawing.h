//
//  BasicDrawing.h
//  Carts
//
//  Created by Daniela Postigo on 11/14/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasicDrawing : NSObject {
    NSString *name;
    BOOL debug;
}

@property(nonatomic) BOOL debug;
@property(nonatomic, copy) NSString *name;
@end