//
// Created by Dani Postigo on 1/24/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SuggestionsWindowController;

typedef void (^SuggestionsManagerCompletionBlock)(NSTextField *, NSString *id);


@interface SuggestionsManager : NSObject <NSTextFieldDelegate> {
    SuggestionsWindowController *suggestionsController;
    NSMutableArray *textFields;


    NSURL *suggestedURL;
    NSDictionary *selectedSuggestion;
    BOOL skipNextSuggestion;


    NSMutableArray *itemPrototypeStorage;
    NSMutableArray *suggestionStorage;
    NSMutableArray *suggestionIdStorage;
    NSMutableArray *suggestionImageStorage;

    NSTextField *selectedTextField;

    SuggestionsManagerCompletionBlock completion;

}

@property(nonatomic) BOOL skipNextSuggestion;
@property(nonatomic, strong) NSMutableArray *textFields;
@property(nonatomic, strong) NSTextField *selectedTextField;
@property(nonatomic, strong) SuggestionsWindowController *suggestionsController;


@property(nonatomic, strong) NSMutableArray *suggestionImageStorage;
@property(nonatomic, strong) NSMutableArray *suggestionStorage;


@property(nonatomic, strong) NSMutableArray *itemPrototypeStorage;
@property(nonatomic, strong) SuggestionsManagerCompletionBlock completion;


@property(nonatomic, strong) NSMutableArray *suggestionIdStorage;
+ (SuggestionsManager *) manager;
- (void) addTextField: (NSTextField *) textField suggestions: (NSArray *) suggestions;
- (void) addTextField: (NSTextField *) textField suggestions: (NSArray *) suggestions images: (NSArray *) images;
- (void) removeTextField: (NSTextField *) textField;


- (void) setItemPrototype: (NSString *) string textField: (NSTextField *) textField;
- (void) setSuggestionStrings: (NSArray *) suggestions textField: (NSTextField *) textField;
- (void) setImages: (NSArray *) images textField: (NSTextField *) textField;
- (NSString *) itemPrototype;
@end