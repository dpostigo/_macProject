//
// Created by dpostigo on 2/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "VeryBasicViewController.h"
#import "BasicSecureTextField.h"
#import "CustomWindow.h"

@implementation VeryBasicViewController {
}

@synthesize backgroundView;
@synthesize controlsArray;
@synthesize autoTabbing;
@synthesize navigationBar;
@synthesize showsNavigationBar;
@synthesize navigationController;

@synthesize modalWindow;



#pragma mark IBActions

@synthesize submitButton;

@synthesize hasNib;

- (IBAction) dismiss: (id) sender {
    if (modalWindow != nil) {
        //        [modalWindow dismissController: self animated: YES];
    }
}



#pragma mark Initing



- (id) initWithDefaultNib {
    return [self initWithNibName: self.nib bundle: nil];
}


- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil {
    if (nibNameOrNil == nil) nibNameOrNil = self.nib;
    self = [super initWithNibName: nibNameOrNil bundle:
            nibBundleOrNil];
    if (self) {
        if (self.nibName == nil) {
            //            NSLog(@"%@, setting view.", NSStringFromClass([self class]));
            [self setView: [[NSView alloc] initWithFrame: NSMakeRect(0, 0, 320, 480)]];
            [self loadView];
        } else {

            self.hasNib = YES;
            //            NSLog(@"%s, self.nibName = %@", __PRETTY_FUNCTION__, self.nibName);
        }
    }
    return self;
}


- (void) loadView {
    if (self.nibName != nil) [super loadView];

    if (_queue == nil) _queue = [NSOperationQueue new];
    _model = [ModelCarts sharedModel];
    [_model subscribeDelegate: self];
    self.controlsArray = [[NSMutableArray alloc] init];
}


#pragma mark Nibs

- (NSString *) nib {
    NSString *ret = [self nibForString: NSStringFromClass([self class])];

    if (ret == nil) {
        Class aClass = [self class];
        while (ret == nil && aClass != [VeryBasicViewController class]) {
            aClass = [aClass superclass];
            ret = [self nibForString: NSStringFromClass(aClass)];
        }
    }
    return ret;
}

- (NSString *) nibForString: (NSString *) string {
    NSString *path = [[NSBundle mainBundle] pathForResource: string ofType: @"nib"];
    NSString *ret = nil;
    if (path != nil) {
        ret = [NSString stringWithFormat: @"%@", string];
    }
    return ret;
}


#pragma mark NavigationBar


- (void) setShowsNavigationBar: (BOOL) showsNavigationBar1 {
    showsNavigationBar = showsNavigationBar1;
}


- (void) embedViewController: (NSViewController *) viewController inView: (NSView *) aSuperview {
    [self embedView: viewController.view inView: aSuperview];
}


- (void) embedView: (NSView *) view inView: (NSView *) aSuperview {
    view.frame = aSuperview.bounds;
    view.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    [aSuperview addSubview: view];
}


- (void) replaceView: (NSView *) newView asView: (NSView *) oldView; {
    newView.frame = oldView.frame;
    newView.autoresizingMask = oldView.autoresizingMask;
    if ([oldView superview]) {
        NSView *superView = [oldView superview];
        [oldView removeFromSuperview];
        [superView addSubview: newView];
    }
}

- (void) addExternalView: (NSViewController *) viewController toView: (NSView *) aSuperview {

    viewController.view.frame = aSuperview.bounds;
    [viewController.view setAutoresizingMask: NSViewWidthSizable | NSViewHeightSizable];
    [aSuperview addSubview: viewController.view];
}

- (IBAction) handleSubmitButton: (id) sender {
}


#pragma mark NSTextFieldDelegate

- (BOOL) control: (NSControl *) control textShouldBeginEditing: (NSText *) fieldEditor {
    return YES;
}

- (BOOL) control: (NSControl *) control textShouldEndEditing: (NSText *) fieldEditor {
    [self textFieldEndedEditing: (NSTextField *) control];
    return YES;
}


#pragma mark BasicTextField

- (void) subscribeControl: (NSTextField *) control {
    if (control == nil) return;
    if ([control isKindOfClass: [NSTextField class]]) {
        NSTextField *textField = (NSTextField *) control;
        textField.delegate = self;

        NSTextField *lastTextField = [controlsArray lastObject];
        lastTextField.nextKeyView = textField;

        if ([controlsArray count] > 0) {
            textField.nextKeyView = [controlsArray objectAtIndex: 0];
        } else {
            if (modalWindow) {
                modalWindow.initialFirstResponder = textField;
                //                modalWindow.autorecalculatesKeyViewLoop
            }
        }
    }
    [controlsArray addObject: control];
}

- (void) textFieldEndedEditing: (NSTextField *) textField {
    if ([textField isKindOfClass: [BasicTextField class]]) {
        BasicTextField *basicTextField = (BasicTextField *) textField;
        [self textFieldEndedEditing: basicTextField withRowObject: basicTextField.rowObject tableSection: basicTextField.tableSection];
    }

    else if ([textField isKindOfClass: [BasicSecureTextField class]]) {
        BasicSecureTextField *secureTextField = (BasicSecureTextField *) textField;
        NSLog(@"secureTextField = %@", secureTextField);
        [self textFieldEndedEditing: secureTextField withRowObject: secureTextField.rowObject tableSection: secureTextField.tableSection];
    }


    //    [self triggerNextControl: textField];
}

- (void) resignAllTextFields {
    for (NSControl *control in controlsArray) {
        if ([control isKindOfClass: [NSTextField class]]) {
            [self textFieldEndedEditing: (NSTextField *) control];
        }
    }
}

- (void) triggerNextControl: (NSControl *) control {

    if (autoTabbing) {
        if ([controlsArray containsObject: control]) {
            NSUInteger index = [controlsArray indexOfObject: control];
            if (index < [controlsArray count] - 1) {
                // NSControl *nextControl = [controlsArray objectAtIndex: index + 1];
                //                [[nextControl window] becomeFirstResponder];
                //                [[nextControl window] makeFirstResponder: nextControl];
            }
        }
    }
}

- (void) textFieldEndedEditing: (NSTextField *) textField withRowObject: (DataItemObject *) rowObject tableSection: (DataSection *) tableSection {
}




#pragma mark Push / pop

- (void) viewDidAppear {

}


#pragma mark NSView handling


- (void) setView: (NSView *) newView {

    if ([newView isKindOfClass: [BasicView class]]) {
        newView.frame = self.view.frame;
        newView.autoresizingMask = self.view.autoresizingMask;
        NSArray *subviews = self.view.subviews;
        [super setView: newView];
        for (NSView *subview in subviews) {
            [self.view addSubview: subview];
        }

    } else {
        [super setView: newView];
    }

}

- (BasicView *) basicView {
    if ([self.view isKindOfClass: [BasicView class]]) return (BasicView *) self.view;
    return nil;
}

@end