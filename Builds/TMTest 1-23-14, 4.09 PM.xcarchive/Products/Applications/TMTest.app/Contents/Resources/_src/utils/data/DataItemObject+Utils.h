//
//  DataItemObject+PositionUtils.h
//  Carts
//
//  Created by Daniela Postigo on 10/24/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataItemObject.h"
#import "BasicObject.h"

@interface DataItemObject (Utils)

- (id) initWithTextLabel: (NSString *) aTextLabel detailTextLabel: (NSString *) aDetailTextLabel cellIdentifier: (NSString *) aCellIdentifier;

- (id) initWithTextLabel: (NSString *) aTextLabel detailTextLabel: (NSString *) aDetailTextLabel cellIdentifier: (NSString *) aCellIdentifier image: (NSImage *) anImage;
- (id) initWithTextLabel: (NSString *) aTextLabel detailTextLabel: (NSString *) aDetailTextLabel cellIdentifier: (NSString *) aCellIdentifier content: (id) aContent image: (NSImage *) anImage;

- (id) initWithTextLabel: (NSString *) aTextLabel detailTextLabel: (NSString *) aDetailTextLabel image: (NSImage *) anImage;

- (id) initWithTextLabel: (NSString *) aTextLabel cellIdentifier: (NSString *) aCellIdentifier;
- (id) initWithTextLabel: (NSString *) aTextLabel cellIdentifier: (NSString *) aCellIdentifier content: (id) aContent;
- (id) initWithTextLabel: (NSString *) aTextLabel cellIdentifier: (NSString *) aCellIdentifier content: (id) aContent image: (NSImage *) anImage;

- (id) initWithTextLabel: (NSString *) aTextLabel content: (id) aContent;

- (id) initWithTextLabel: (NSString *) aTextLabel image: (NSImage *) anImage;
- (id) initWithTextLabel: (NSString *) aTextLabel image: (NSImage *) anImage cellIdentifier: (NSString *) aCellIdentifier;
- (id) initWithTextLabel: (NSString *) aTextLabel image: (NSImage *) anImage selectedImage: (NSImage *) aSelectedImage;
- (id) initWithTextLabel: (NSString *) aTextLabel image: (NSImage *) anImage content: (id) aContent;

- (id) initWithContent: (id) aContent cellIdentifier: (NSString *) aCellIdentifier;

//- (id) initWithContent: (id) aContent;
- (id) initWithBasicObject: (BasicObject *) basicObject;


@end