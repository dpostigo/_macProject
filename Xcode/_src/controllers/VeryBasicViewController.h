//
// Created by dpostigo on 2/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BasicTextField.h"
#import "BasicBackgroundViewOld.h"
#import "NavigationController.h"
#import "BasicView.h"
#import "ModelCarts.h"

@class CustomWindow;


@interface VeryBasicViewController : NSViewController <NSTextFieldDelegate> {

    NSOperationQueue *_queue;
    __unsafe_unretained ModelCarts *_model;

    BOOL autoTabbing;
    BOOL showsNavigationBar;

    NSMutableArray *controlsArray;
    NavigationController *navigationController;

    NavigationBar *navigationBar;
    IBOutlet CustomWindow *modalWindow;
    IBOutlet BasicBackgroundViewOld *backgroundView;
    IBOutlet NSButton *submitButton;

    BOOL hasNib;
}

@property(nonatomic) BOOL autoTabbing;
@property(nonatomic) BOOL showsNavigationBar;
@property(nonatomic, strong) NSOperationQueue *queue;
@property(nonatomic, strong) BasicBackgroundViewOld *backgroundView;
@property(nonatomic, strong) NSMutableArray *controlsArray;

@property(nonatomic, strong) NavigationController *navigationController;
@property(nonatomic, strong) NavigationBar *navigationBar;
@property(nonatomic, strong) CustomWindow *modalWindow;

@property(nonatomic, strong) NSButton *submitButton;
@property(nonatomic) BOOL hasNib;
- (IBAction) dismiss: (id) sender;
- (IBAction) handleSubmitButton: (id) sender;

- (id) initWithDefaultNib;
- (void) embedViewController: (NSViewController *) viewController inView: (NSView *) aSuperview;
- (void) embedView: (NSView *) view1 inView: (NSView *) aSuperview;
- (void) replaceView: (NSView *) newView asView: (NSView *) oldView;
- (void) addExternalView: (NSViewController *) viewController toView: (NSView *) aSuperview;

- (void) subscribeControl: (NSTextField *) control;
- (void) textFieldEndedEditing: (NSTextField *) textField;
- (void) resignAllTextFields;
- (void) textFieldEndedEditing: (NSTextField *) textField withRowObject: (DataItemObject *) rowObject tableSection: (DataSection *) tablesection;
- (void) viewDidAppear;
- (BasicView *) basicView;
@end