//
// Created by Daniela Postigo on 5/18/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicBackgroundViewOld.h"
#import "NSBezierPath+Additions.h"

@interface RoundedView : BasicBackgroundViewOld {
    JSRoundedCornerOptions cornerOptions;
}

@property(nonatomic) JSRoundedCornerOptions cornerOptions;
@end