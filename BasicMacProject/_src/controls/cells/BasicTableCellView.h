//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicBackgroundViewOld.h"
#import "BasicTextField.h"


@interface BasicTableCellView : NSTableCellView {
    IBOutlet BasicTextField *textFieldCustom;
    IBOutlet BasicTextField *detailTextLabel;
    IBOutlet NSButton *button;
    IBOutlet NSButton *secondButton;
    IBOutlet NSButton *accessoryButton;
    IBOutlet BasicTextField *captionLabel;
    IBOutlet BasicBackgroundViewOld *backgroundView;
}


@property(nonatomic, strong) BasicTextField         *detailTextLabel;
@property(nonatomic, strong) NSButton               *button;
@property(nonatomic, strong) BasicTextField         *captionLabel;
@property(nonatomic, strong) BasicBackgroundViewOld *backgroundView;
@property(nonatomic, strong) BasicTextField         *textFieldCustom;
@property(nonatomic, strong) NSButton               *secondButton;
@property(nonatomic, strong) NSButton               *accessoryButton;
@end