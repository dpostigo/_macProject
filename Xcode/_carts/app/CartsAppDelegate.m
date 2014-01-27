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

    //    [self testDPStorage];
    //    [self testStorageTest];
    //
    //    [self testStorage];

    //    [self testDataContainer];
    //    [self testSavedUsername];
    //    [self testBOAPIModel];
    [self initApp];

}


- (void) initApp {

//    [self saveObject: @"nouser" forKey: kBOStoredUsername];

    BOAPIModel *apiModel = [BOAPIModel sharedModel];
    apiModel.delegate = _model.operationHandler;
    [apiModel subscribeDelegate: self];
    [_model subscribeDelegate: self];

    NSLog(@"apiModel.user = %@", apiModel.user);

    if (apiModel.hasCachedData) {
        [self showTasksWindow];

    } else {
        NSWindowController *controller = [[NSWindowController alloc] initWithWindowNibName: @"LoginWindow"];
        [controller.window makeKeyAndOrderFront: nil];
    }

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
    TasksWindowController *controller = [[TasksWindowController alloc] initWithWindowNibName: @"TasksWindow"];
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

    //    [loginWindow makeKeyAndOrderFront: nil];

}

#pragma mark IBActions

- (IBAction) signOut: (id) sender {
    [_model signOut];
}



@end