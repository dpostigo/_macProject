//
// Created by Daniela Postigo on 5/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicFlippedViewController.h"

@interface TokenTestViewController : BasicFlippedViewController {

    IBOutlet NSTokenField *tokensField;
    IBOutlet NSMenu *sharedMenu;
    IBOutlet NSMenu *tokenMenu;
    NSMutableArray *builtInKeywords;
}

@property(nonatomic, strong) NSTokenField *tokensField;
@property(nonatomic, strong) NSMenu *sharedMenu;
@property(nonatomic, strong) NSMenu *tokenMenu;
@property(nonatomic, strong) NSMutableArray *builtInKeywords;
@end