//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BasicSecureTextField.h"
#import "BasicSecureTextFieldCell.h"


@implementation BasicSecureTextField {
}


@synthesize tableSection;
@synthesize rowObject;


+ (Class) cellClass {
    return [BasicSecureTextFieldCell class];
}


@end