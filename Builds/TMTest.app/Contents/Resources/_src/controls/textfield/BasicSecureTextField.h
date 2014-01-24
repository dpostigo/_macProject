//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "DataItemObject.h"
#import "DataSection.h"

@interface BasicSecureTextField : NSSecureTextField {
    __unsafe_unretained DataItemObject *rowObject;
    __unsafe_unretained DataSection *tableSection;
}

@property(nonatomic, assign) DataItemObject *rowObject;
@property(nonatomic, assign) DataSection *tableSection;
@end