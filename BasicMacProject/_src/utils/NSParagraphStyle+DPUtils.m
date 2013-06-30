//
//  NSParagraphStyle+DPUtils.m
//  Carts
//
//  Created by Daniela Postigo on 6/24/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSParagraphStyle+DPUtils.h"


@implementation NSParagraphStyle (DPUtils)


+ (NSParagraphStyle *) paragraphWithAlignment: (NSTextAlignment) alignment {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment: alignment];
    return paragraphStyle;
}
@end