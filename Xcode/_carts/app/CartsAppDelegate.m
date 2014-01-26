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
#import "ArrayController.h"
#import "BOLoginWindow.h"

@implementation CartsAppDelegate {
    NSWindow *window;
    BOAPIStorage *storage;
    ArrayController *arrayController;
    NSMutableArray *arrayTest;
}

- (void) applicationDelegateDidFinishLaunching: (NSNotification *) notification {
    [super applicationDelegateDidFinishLaunching: notification];

    //    [self testDPStorage];
    //    [self testStorageTest];
    //
    //    [self testStorage];

    //    [self testDataContainer];
    //    [self testSavedUsername];
    //    [self testBOAPIModel];
    [self initApp];

}


- (void) testBOAPIModel {
    BOAPIModel *apiModel = [BOAPIModel sharedModel];
    NSLog(@"apiModel.user = %@", apiModel.user);
    NSLog(@"apiModel.storage = %@", apiModel.storage);

    [apiModel.storage save];

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

- (void) testStorageTest {

    NSString *username = @"fernando@firstperson.is";
    NSString *storageName = [username filenameEscapedString];

    storage = [[BOAPIStorage alloc] initWithName: storageName];
    //    [storagei addObserver: self forKeyPath: @"items" options: (NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew) context: NULL];

    [storage.exampleItems addObject: @"Hello1"];
    [storage.exampleItems addObject: @"Hello2"];
    [storage.exampleItems addObject: @"Hello3"];
    [storage.exampleItems addObject: @"Hello4"];
    [storage save];

    NSLog(@"storage = %@", storage);

}
//
//- (void) observeValueForKeyPath: (NSString *) keyPath ofObject: (id) object change: (NSDictionary *) change context: (void *) context {
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//    if ([keyPath isEqualToString: @"items"]) {
//        NSLog(@"%s", __PRETTY_FUNCTION__);
//    }
//    //    [super observeValueForKeyPath: keyPath ofObject: object change: change context: context];
//
//}


- (void) testDPStorage {
    //    DPStorage *storage = [[DPStorage alloc] init];
    //    storage.storageName = @"TestStorage";
    //    [storage save];
    //
    //    DPStorage *destored = [storage destore];
    //
    //    DPStorage *lameStorage = [DPStorage destoreWithName: @"Lame"];
    //    NSLog(@"lameStorage = %@", lameStorage);

}


- (void) testStorage {

    //    BOAPIStorage *storage = [[BOAPIStorage alloc] initWithUsername: @"hello"];
    //    [storage.tasks addObject: [[Task alloc] initWithTitle: @"hello"]];
    //
    //    [storage archive];
    //
    //    BOAPIStorage *unarchived = [BOAPIStorage objectWithContentsOfFile: storage.filename];
    //    NSLog(@"unarchived = %@", unarchived);
    //    NSLog(@"[unarchived.tasks count] = %lu", [unarchived.tasks count]);

}

- (void) initApp {

    //    [self saveObject: @"nouser" forKey: kBOStoredUsername];

    BOAPIModel *apiModel = [BOAPIModel sharedModel];
    apiModel.delegate = _model.operationHandler;

    [apiModel subscribeDelegate: self];
    [_model subscribeDelegate: self];
    //    [_model.masterNib load];

    BOLoginWindow *loginWindow = [_model.masterNib objectWithIdentifier: @"LoginWindow"];
    [loginWindow makeKeyAndOrderFront: nil];

    NSLog(@"apiModel.hasCachedData = %d", apiModel.hasCachedData);
    if (apiModel.hasCachedData) {
        [loginWindow validate];

    }

}


- (void) initAppOld {
    //    if (apiModel.)
    //
    //    if (_model.username) {
    //
    //        NSString *filename = [User safeUsername: _model.username];
    //        filename = [BOAPIStorage pathForUsername: filename];
    //
    //        NSLog(@"filename = %@", filename);
    //        BOAPIStorage *instance = [BOAPIStorage objectWithContentsOfFile: filename];
    //        NSLog(@"[instance.tasks count] = %lu", [instance.tasks count]);
    //
    //    } else {
    //    }
    //
    //    //
    //    //    [BOAPIModel sharedModel].defaultUsername = _model.username;
    //    if (_model.username) {
    //        [self showTasksWindow];
    //    } else {
    //        BOLoginWindow *loginWindow = [_model.masterNib objectWithIdentifier: @"LoginWindow"];
    //        [loginWindow makeKeyAndOrderFront: nil];
    //        [loginWindow validate];
    //
    //    }
    //
    //    //    NSLog(@"_model.username = %@", _model.username);
    //    //    //
    //    //    [BOAPIModel sharedModel].delegate = _model.operationHandler;
    //    //
    //    //    [[BOAPIModel sharedModel] subscribeDelegate: self];
    //    //    [_model subscribeDelegate: self];
    //    //
    //    //    [_model.masterNib load];
    //    //
    //    //    BOLoginWindow *loginWindow = [_model.masterNib objectWithIdentifier: @"LoginWindow"];
    //    //    [loginWindow makeKeyAndOrderFront: nil];
    //    //    [loginWindow validate];


}

#pragma mark Getters

- (BOAPIModel *) apiModel {
    return [BOAPIModel sharedModel];
}


- (void) showTasksWindow {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    TasksWindowController *controller = [[TasksWindowController alloc] initWithWindowNibName: @"NewTasksWindow" owner: self];
    [controller.window makeKeyAndOrderFront: nil];

}
#pragma mark BOAPIDelegate


- (void) userDidLogin: (User *) user {
    //    NSWindowController *controller = [[NSWindowController alloc] initWithWindow: _model.tasksWindow];
    //    [controller.window makeKeyAndOrderFront: nil];


    [self showTasksWindow];
}

#pragma mark IBActions

- (IBAction) signOut: (id) sender {
    [_model signOut];
}

- (void) userDidSignOff {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSWindow *loginWindow = [_model.masterNib objectWithIdentifier: @"LoginWindow"];


    NSArray *windows = [[NSApplication sharedApplication] windows];
    for (NSWindow *openWindow in windows) {
        [openWindow performClose: nil];
    }

    [loginWindow makeKeyAndOrderFront: nil];

}

@end