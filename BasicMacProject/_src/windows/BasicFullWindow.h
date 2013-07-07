//
// Created by Daniela Postigo on 5/4/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicCustomWindowOld.h"
#import "DMSplitView.h"
#import "BasicSplitViewOld.h"


@interface BasicFullWindow : BasicCustomWindowOld {
    IBOutlet BasicSplitViewOld *mainSplitView;
    IBOutlet BasicSplitViewOld *bottomSplitView;

    IBOutlet NSView *mainView;
    IBOutlet NSView *sidebarView;
    IBOutlet NSView *topView;
    IBOutlet NSView *bottomView;
}


@property(nonatomic, strong) NSView         *mainView;
@property(nonatomic, strong) BasicSplitViewOld *mainSplitView;
@property(nonatomic, strong) BasicSplitViewOld *bottomSplitView;
@end