//
// Created by dpostigo on 12/18/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSString+Utils.h"

@implementation NSString (Utils)

- (NSURL *) URL {
    return [NSURL URLWithString: self];
}

- (BOOL) containsString: (NSString *) substring {
    NSRange range = [self rangeOfString : substring];
    BOOL found = (range.location != NSNotFound);
    return found;
}

@end