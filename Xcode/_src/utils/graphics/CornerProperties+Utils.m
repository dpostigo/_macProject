//
//  CornerProperties+PositionUtils.m
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "CornerProperties+Utils.h"
#import "NSBezierPath+Additions.h"

@implementation CornerProperties (Utils)

- (NSString *) cornerTypeAsString {
    return [self.cornerTypeAsArray componentsJoinedByString: @" | "];
}

- (NSArray *) cornerTypeAsArray {

    NSMutableArray *result = [[NSMutableArray alloc] init];

    if (self.cornerType & CornerNone) {
        [result addObject: @"CornerNone"];

    } else {
        if (self.cornerType & CornerUpperLeft) {
            [result addObject: @"CornerUpperLeft"];
        }
        if (self.cornerType & CornerUpperRight) {
            [result addObject: @"CornerUpperRight"];
        }
        if (self.cornerType & CornerLowerRight) {
            [result addObject: @"CornerLowerRight"];
        }
        if (self.cornerType & CornerLowerLeft) {
            [result addObject: @"CornerLowerLeft"];
        }
    }

    return result;
}

- (CornerType) typeForString: (NSString *) string {
    CornerType ret = CornerNone;
    if ([string isEqualToString: @"CornerUpperLeft"]) {

        ret = CornerUpperLeft;

    } else if ([string isEqualToString: @"CornerUpperRight"]) {

        ret = CornerUpperRight;

    } else if ([string isEqualToString: @"CornerLowerRight"]) {

        ret = CornerLowerRight;

    } else if ([string isEqualToString: @"CornerLowerLeft"]) {
        ret = CornerLowerLeft;

    }
    return ret;
}


- (JSRoundedCornerOptions) jsTypeForCornerType: (CornerType) aType {
    JSRoundedCornerOptions ret = CornerNone;

    switch (aType) {

        case CornerUpperLeft :
            ret = JSUpperLeftCorner;
            break;

        case CornerUpperRight :
            ret = JSUpperRightCorner;
            break;

        case CornerLowerRight :
            ret = JSLowerRightCorner;
            break;

        case CornerLowerLeft :
            ret = JSLowerLeftCorner;
            break;

        case CornerNone :
            break;
    }

    return ret;
}


- (JSRoundedCornerOptions) jsOptionsForCornerType: (CornerType) aType {
    JSRoundedCornerOptions ret = 0;
    NSArray *types = [self cornerTypeAsArray];

    for (NSString *typeString in types) {

        CornerType stringType = [self typeForString: typeString];
        ret = ret | [self jsTypeForCornerType: stringType];

    }
    return ret;
}


- (JSRoundedCornerOptions) jsOptions {
    return [self jsOptionsForCornerType: self.cornerType];

}
@end