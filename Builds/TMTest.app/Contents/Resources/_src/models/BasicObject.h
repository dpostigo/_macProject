//
// Created by Daniela Postigo on 5/8/13.
// Copyright (c) 2013 Daniela Postigo. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface BasicObject : NSObject <NSCoding> {
    NSString *id;
    NSString *title;
    NSDate *creationDate;
}

@property(nonatomic, retain) NSString *id;
@property(nonatomic, retain) NSString *title;
@property(nonatomic, strong) NSDate *creationDate;

- (id) initWithTitle: (NSString *) aTitle;
+ (id) objectWithTitle: (NSString *) title1;
@end