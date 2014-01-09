//
// Created by Daniela Postigo on 5/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "DataItemObject.h"

@interface BasicTokenField : NSTokenField {
    __unsafe_unretained DataItemObject *rowObject;
}

@property(nonatomic, assign) DataItemObject *rowObject;
@end