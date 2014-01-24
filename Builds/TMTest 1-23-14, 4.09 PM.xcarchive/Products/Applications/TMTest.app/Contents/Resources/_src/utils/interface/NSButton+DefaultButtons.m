//
//  NSButton+DefaultButtons.m
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSButton+DefaultButtons.h"
#import "NSButton+DPUtils.h"

@implementation NSButton (DefaultButtons)

+ (NSButton *) defaultAddButton {

    NSButton *ret = [NSButton buttonWithImage: [NSImage imageNamed: NSImageNameAddTemplate]];
    return ret;

}
@end