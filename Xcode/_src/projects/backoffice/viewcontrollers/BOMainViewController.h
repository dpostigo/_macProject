//
//  BOMainViewController.h
//  TaskManager
//
//  Created by Daniela Postigo on 5/26/13.
//  Copyright 2013 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPSplitViewController.h"
#import "DPSplitViewContainer.h"
#import "DPSplitViewSidebarController.h"

@interface BOMainViewController : DPSplitViewSidebarController {

    IBOutlet DPSplitView *contentSplitView;
    //    IBOutlet DPSplitViewContainer *mainView;
    IBOutlet DPSplitViewContainer *topView;
    IBOutlet DPSplitViewContainer *bottomView;

}
@end