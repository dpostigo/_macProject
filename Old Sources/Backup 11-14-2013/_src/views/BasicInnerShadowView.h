//
// Created by dpostigo on 2/20/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicDisplayView.h"

@class BasicGradient;

@interface BasicInnerShadowView : BasicDisplayView {
    BasicGradient *horizontalShadowGradient;
    BasicGradient *verticalShadowGradient;
}

@property(nonatomic, strong) NSColor *innerShadowColor;
@property(nonatomic, strong) BasicGradient *horizontalShadowGradient;

@end