//
// Created by Dani Postigo on 1/23/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SuggestionsWindowController;

@interface SuggestibleTextField : NSTextField <NSTextFieldDelegate> {
    SuggestionsWindowController *suggestionsController;

    NSURL *suggestedURL;
    BOOL skipNextSuggestion;


    NSMutableArray *suggestibleStrings;
    NSMutableArray *suggestionImages;


}

@property(nonatomic) BOOL skipNextSuggestion;
@property(nonatomic, strong) SuggestionsWindowController *suggestionsController;

@property(nonatomic, strong) NSMutableArray *suggestibleStrings;
@property(nonatomic, strong) NSMutableArray *suggestionImages;
- (IBAction) updateWithSelectedSuggestion: (id) sender;
@end