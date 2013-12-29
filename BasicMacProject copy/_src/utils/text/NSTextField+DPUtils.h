//
//  NSTextField+BlendingUtils.h
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTextField (DPUtils)

+ (NSTextField *) clearTextField;
+ (NSTextField *) clearTextFieldWithFrame: (NSRect) aFrame;
+ (NSTextField *) clearDisplayTextFieldWithFrame: (NSRect) aFrame;
+ (NSTextField *) clearDisplayTextFieldWithFrame: (NSRect) aFrame type: (Class) textFieldType;
@end