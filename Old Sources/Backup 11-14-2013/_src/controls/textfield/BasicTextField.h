//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "DataItemObject.h"
#import "DataSection.h"

@class BasicTextField;

@protocol BasicTextFieldDelegate <NSObject>

- (void) textFieldDidChange: (BasicTextField *) textField notification: (NSNotification *) notification;


@end


@interface BasicTextField : NSTextField {
    __unsafe_unretained DataItemObject *rowObject;
    __unsafe_unretained DataSection *tableSection;
    NSShadow *shadow;
    NSString *text;

    __unsafe_unretained id <BasicTextFieldDelegate> delegate;
}

@property(nonatomic, assign) DataItemObject *rowObject;
@property(nonatomic, assign) DataSection *tableSection;
@property(nonatomic, strong) NSShadow *shadow;
@property(nonatomic, assign) id <BasicTextFieldDelegate> delegate;
- (NSColor *) shadowColor;
- (NSSize) shadowOffset;
- (CGFloat) shadowBlurRadius;
- (void) setShadowColor: (NSColor *) color;
- (void) setShadowOffset: (NSSize) size1;
- (void) setShadowBlurRadius: (CGFloat) blurRadius;
- (void) setText: (NSString *) string;
- (BOOL) textShouldEndEditing: (NSText *) textObject;
@end