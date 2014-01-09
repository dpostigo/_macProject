//
//  SurrogateObject.h
//  Carts
//
//  Created by Daniela Postigo on 10/23/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SurrogateObject : NSObject {

    NSMutableArray *surrogates;
    NSString *name;

}

@property(nonatomic, strong) NSMutableArray *surrogates;
@property(nonatomic, retain) NSString *name;
- (void) objectInit;
@end