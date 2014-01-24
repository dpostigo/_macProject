//
// Created by Dani Postigo on 1/24/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SuggestionsWindowController;

@interface SuggestionsManager : NSObject <NSTextFieldDelegate> {
    SuggestionsWindowController *suggestionsController;
    NSMutableArray *textFields;


    NSURL *suggestedURL;
    BOOL skipNextSuggestion;


    NSMutableArray *itemPrototypeStorage;
    NSMutableArray *suggestionStorage;
    NSMutableArray *suggestionImageStorage;

    NSTextField *selectedTextField;

}

@property(nonatomic) BOOL skipNextSuggestion;
@property(nonatomic, strong) NSMutableArray *textFields;
@property(nonatomic, strong) NSTextField *selectedTextField;
@property(nonatomic, strong) SuggestionsWindowController *suggestionsController;


@property(nonatomic, strong) NSMutableArray *suggestionImageStorage;
@property(nonatomic, strong) NSMutableArray *suggestionStorage;


@property(nonatomic, strong) NSMutableArray *itemPrototypeStorage;
+ (SuggestionsManager *) manager;
- (void) addTextField: (NSTextField *) textField suggestions: (NSArray *) suggestions;
- (void) addTextField: (NSTextField *) textField suggestions: (NSArray *) suggestions images: (NSArray *) images;
- (void) removeTextField: (NSTextField *) textField;


- (void) setItemPrototype: (NSString *) string textField: (NSTextField *) textField;
- (NSString *) itemPrototype;
@end