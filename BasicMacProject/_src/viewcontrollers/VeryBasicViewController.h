//
// Created by dpostigo on 2/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Model.h"
#import "BasicTextField.h"
#import "BasicBackgroundViewOld.h"
#import "NavigationController.h"


@class BasicCustomWindow;


@interface VeryBasicViewController : NSViewController <NSTextFieldDelegate> {

    NSOperationQueue          *_queue;
    __unsafe_unretained Model *_model;

    BOOL autoTabbing;
    BOOL showsNavigationBar;

    NSMutableArray       *controlsArray;
    NavigationController *navigationController;

    NavigationBar *navigationBar;
    IBOutlet BasicCustomWindow *modalWindow;
    IBOutlet BasicBackgroundViewOld *backgroundView;
    IBOutlet NSButton *submitButton;
}


@property(nonatomic) BOOL autoTabbing;
@property(nonatomic) BOOL showsNavigationBar;
@property(nonatomic, strong) NSOperationQueue       *queue;
@property(nonatomic, strong) BasicBackgroundViewOld *backgroundView;
@property(nonatomic, strong) NSMutableArray         *controlsArray;

@property(nonatomic, strong) NavigationController *navigationController;
@property(nonatomic, strong) NavigationBar        *navigationBar;
@property(nonatomic, strong) BasicCustomWindow    *modalWindow;

@property(nonatomic, strong) NSButton *submitButton;
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
- (void) textFieldEndedEditing: (NSTextField *) textField withRowObject: (TableRowObject *) rowObject tableSection: (TableSection *) tablesection;
- (void) viewDidAppear;
@end