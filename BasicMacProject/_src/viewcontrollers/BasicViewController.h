//
// Created by dpostigo on 2/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "VeryBasicViewController.h"
#import "NewBasicView.h"

@interface BasicViewController : VeryBasicViewController {

    NSTextField *titleLabel;
    NewBasicView *flippedView;
}

@property(nonatomic, strong) NSTextField *titleLabel;
@property(nonatomic, strong) NewBasicView *flippedView;
@end