//
// Created by dpostigo on 2/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicCustomWindow.h"


@interface BasicView : NSView {

    BasicCustomWindow *customWindow;
}


@property(nonatomic, strong) BasicCustomWindow *customWindow;
@end