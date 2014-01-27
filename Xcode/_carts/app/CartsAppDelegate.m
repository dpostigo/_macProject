//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <BOAPI/BOAPIStorage.h>
#import <BOAPI/Task.h>
#import <BOAPI/User.h>
#import <NSObject-UserDefaults/NSObject+UserDefaults.h>
#import "CartsAppDelegate.h"
#import "NSWorkspaceNib.h"
#import "BOAPIModel.h"
#import "TasksWindowController.h"
#import "AutoCoding.h"
#import "NSString+DPKitUtils.h"

@implementation CartsAppDelegate {
    BOAPIStorage *storage;
    NSMutableArray *arrayTest;
}

- (void) applicationDelegateDidFinishLaunching: (NSNotification *) notification {
    [super applicationDelegateDidFinishLaunching: notification];

    //    [self testObservers];
//    [self testStorageTest];
    [self initApp];

}

- (void) testStorageTest {

    NSString *username = @"testing";
    NSString *storageName = [username filenameEscapedString];

    storage = [[BOAPIStorage alloc] initWithName: storageName];
    //    [storagei addObserver: self forKeyPath: @"items" options: (NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew) context: NULL];

    [storage.tasks addObject: @"Hello1"];
    [storage.tasks addObject: @"Hello2"];
    [storage.tasks addObject: @"Hello3"];
    [storage.tasks addObject: @"Hello4"];
    [storage.tasks removeObject: storage.tasks.lastObject];

    NSLog(@"storage = %@", storage);

}

- (void) initApp {

    BOAPIModel *apiModel = [BOAPIModel sharedModel];
    apiModel.delegate = _model.operationHandler;
    [apiModel subscribeDelegate: self];
    [_model subscribeDelegate: self];

    NSLog(@"apiModel.user = %@", apiModel.user);

    if (apiModel.hasCachedData) {
        [self showTasksWindow];

    } else {
        [self showLoginWindow];
    }

}


- (void) testObservers {

    BOAPIModel *apiModel = [BOAPIModel sharedModel];
    apiModel.delegate = _model.operationHandler;
    //    [apiModel subscribeDelegate: self];
    //    [_model subscribeDelegate: self];


    storage = apiModel.storage;
    NSLog(@"apiModel.tasks = %@", apiModel.tasks);
    NSMutableArray *tasks = storage.tasks;
    [tasks removeObject: tasks.lastObject];
}

- (void) testSavedUsername {

    //    //    storage = [BOAPIStorage autocreateWithName: self.savedUsername];
    //
    //    //    storage = [[BOAPIStorage alloc] initWithName: @"hello"];
    //    storage = [BOAPIStorage autocreateWithName: @"hello"];
    //    [storage.exampleItems addObject: @"Hello1"];
    //    [storage.exampleItems addObject: @"Hello2"];
    //    [storage.exampleItems addObject: @"Hello3"];
    //    [storage.exampleItems addObject: @"Hello4"];
    //    [storage save];


}

- (void) testDataContainer {

    storage = [[BOAPIStorage alloc] initWithName: @"Hello"];
    [storage.exampleItems addObject: [[Task alloc] initWithTitle: @"Task name"]];
    [storage.exampleItems addObject: [[Task alloc] initWithTitle: @"Task to remove"]];
    [storage.exampleItems removeObject: [storage.exampleItems lastObject]];
}

- (NSString *) savedUsername {
    NSString *ret = [self savedObjectForKey: @"blah"];
    if (ret == nil) {
        ret = @"nouser";
    }
    return [ret filenameEscapedString];
}



#pragma mark Getters

- (BOAPIModel *) apiModel {
    return [BOAPIModel sharedModel];
}


- (void) showTasksWindow {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    TasksWindowController *controller = [[TasksWindowController alloc] initWithWindowNibName: @"TasksWindow"];
    [controller.window makeKeyAndOrderFront: nil];
}

- (void) showLoginWindow {
    NSWindowController *controller = [[NSWindowController alloc] initWithWindowNibName: @"LoginWindow"];
    [controller.window makeKeyAndOrderFront: nil];
}
#pragma mark BOAPIDelegate


- (void) userDidLogin: (User *) user {
    //    NSWindowController *controller = [[NSWindowController alloc] initWithWindow: _model.tasksWindow];
    //    [controller.window makeKeyAndOrderFront: nil];


    [self showTasksWindow];
}

- (void) userDidSignOff {
    NSLog(@"%s", __PRETTY_FUNCTION__);

    // TODO: reimplement
    //    NSWindow *loginWindow = [_model.masterNib objectWithIdentifier: @"LoginWindow"];
    //

    NSArray *windows = [[NSApplication sharedApplication] windows];
    for (NSWindow *openWindow in windows) {
        [openWindow performClose: nil];
    }

    [self showLoginWindow];

}

#pragma mark IBActions

- (IBAction) signOut: (id) sender {
    [_model signOut];
}


@end