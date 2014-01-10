//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "TestCartsMainController.h"
#import "DDSplitView.h"
#import "NSViewController+Carts.h"
#import "Model.h"
#import "NSWorkspaceNib.h"
#import "CartsSidebarViewController.h"
#import "CartsContentViewController.h"

@implementation TestCartsMainController

@synthesize splitView;

- (void) viewDidLoad {
    CartsSidebarViewController *controller = [[CartsSidebarViewController alloc] init];
    CartsContentViewController *controller2 = [[CartsContentViewController alloc] init];

    [splitView setSubviewAtIndex: 0 with: self.sidebarView];
    [splitView setSubviewAtIndex: 1 with: self.contentView];
    [splitView lockContainerAtIndex: 0];
    [splitView setHoldingPriority: 20 forSubviewAtIndex: 1];

}

- (NSView *) sidebarView {
    return [self.model.masterNib viewForClass: @"TestCartsSidebarController"];
}


- (NSView *) contentView {
    NSView *testView2 = [[NSView alloc] init];
    testView2.frame = [splitView subviewAtIndex: 0].bounds;
    testView2.wantsLayer = YES;
    testView2.layer.backgroundColor = [NSColor blueColor].CGColor;
    return testView2;
}


- (void) setView: (NSView *) view1 {
    [super setView: view1];
    //    self.view.translatesAutoresizingMaskIntoConstraints = NO;

}


- (void) setSplitView: (DDSplitView *) splitView1 {
    splitView = splitView1;
}


- (void) loadView {
    [super loadView];
    NSLog(@"%s", __PRETTY_FUNCTION__);

}


- (void) oldviewDidLoad {

    CartsSidebarViewController *controller = [[CartsSidebarViewController alloc] init];
    CartsContentViewController *controller2 = [[CartsContentViewController alloc] init];


    NSWorkspaceNib *nib = self.model.masterNib;
    NSView *sidebarView = [nib viewForClass: @"TestCartsSidebarController"];


    NSView *vanillaSubview1 = [vanilla.subviews objectAtIndex: 0];

    NSView *testView = [[NSView alloc] init];
    testView.frame = [splitView subviewAtIndex: 1].bounds;
    testView.wantsLayer = YES;
    testView.layer.backgroundColor = [NSColor redColor].CGColor;

    NSView *testView2 = [[NSView alloc] init];
    testView2.frame = [splitView subviewAtIndex: 0].bounds;
    testView2.wantsLayer = YES;
    testView2.layer.backgroundColor = [NSColor blueColor].CGColor;

    NSLog(@"[splitView holdingPriorityForSubviewAtIndex: 0] = %f", [splitView holdingPriorityForSubviewAtIndex: 0]);
    NSLog(@"[splitView holdingPriorityForSubviewAtIndex: 1] = %f", [splitView holdingPriorityForSubviewAtIndex: 1]);

    //    [[vanilla.subviews objectAtIndex: 0] addSubview: testView];
    //    [[vanilla.subviews objectAtIndex: 1] addSubview: testView];
    //    [vanilla setSubviews: [NSArray arrayWithObjects: controller.view, testView, nil]];

    NSLog(@"sidebarView.translatesAutoresizingMaskIntoConstraints = %d", sidebarView.translatesAutoresizingMaskIntoConstraints);
    NSLog(@"testView.translatesAutoresizingMaskIntoConstraints = %d", testView.translatesAutoresizingMaskIntoConstraints);
    NSLog(@"controller.view.translatesAutoresizingMaskIntoConstraints = %d", controller.view.translatesAutoresizingMaskIntoConstraints);

    //    controller.view.width = 100;
    //    controller.view.translatesAutoresizingMaskIntoConstraints = NO;


    //    [splitView setSubviewAtIndex: 0 with: controller.view];
    //    [splitView setSubviewAtIndex: 0 with: sidebarView];

    //    testView.translatesAutoresizingMaskIntoConstraints = NO;
    //    testView2.translatesAutoresizingMaskIntoConstraints = NO;
    [splitView setSubviewAtIndex: 0 with: sidebarView];
    [splitView setSubviewAtIndex: 1 with: testView2];
    [splitView lockContainerAtIndex: 0];
    [splitView setHoldingPriority: 20 forSubviewAtIndex: 1];
    //

    //        testView.translatesAutoresizingMaskIntoConstraints = NO;
    //        testView2.translatesAutoresizingMaskIntoConstraints = NO;
    //    [vanilla setSubviews: [NSArray arrayWithObjects: testView, testView2, nil]];
    //    [vanilla setSubviewAtIndex: 0 with: testView];
    //    [splitView setSubviewAtIndex: 1 with: testView2];
    //    [splitView lockContainerAtIndex: 0];
    //    [vanilla setHoldingPriority: 20 forSubviewAtIndex: 1];

    //    [splitView setHoldingPriority: NSLAYOUTPRIO forSubviewAtIndex: <#(NSInteger)subviewIndex#>];
    //    [splitView setHoldingPriority: NSLayoutPriorityFittingSizeCompression forSubviewAtIndex: 0];

    NSLog(@"[splitView holdingPriorityForSubviewAtIndex: 0] = %f", [splitView holdingPriorityForSubviewAtIndex: 0]);
    NSLog(@"[splitView holdingPriorityForSubviewAtIndex: 1] = %f", [splitView holdingPriorityForSubviewAtIndex: 1]);

}


@end