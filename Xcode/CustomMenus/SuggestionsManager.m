//
// Created by Dani Postigo on 1/24/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <DPKit/NSArray+DPStringSearch.h>
#import "SuggestionsManager.h"
#import "SuggestionsWindowController.h"

@implementation SuggestionsManager

@synthesize skipNextSuggestion;
@synthesize selectedTextField;
@synthesize suggestionsController;

@synthesize textFields;
@synthesize suggestionImageStorage;
@synthesize suggestionStorage;

@synthesize itemPrototypeStorage;

@synthesize completion;

@synthesize suggestionIdStorage;

+ (SuggestionsManager *) manager {
    static SuggestionsManager *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}


- (void) addTextField: (NSTextField *) textField suggestions: (NSArray *) suggestions {
    [self addTextField: textField suggestions: suggestions images: [NSArray array]];
}

- (void) addTextField: (NSTextField *) textField suggestions: (NSArray *) suggestions images: (NSArray *) images {
    [self addTextField: textField suggestions: suggestions images: [NSArray array] prototype: @"suggestionprototype"];
}


- (void) addTextField: (NSTextField *) textField suggestions: (NSArray *) suggestions images: (NSArray *) images prototype: (NSString *) prototype {
    [self.textFields addObject: textField];
    [self.suggestionStorage addObject: suggestions];
    [self.suggestionImageStorage addObject: images];
    [self.itemPrototypeStorage addObject: prototype];

    textField.delegate = self;
}

- (void) removeTextField: (NSTextField *) textField {
    if ([self.textFields containsObject: textField]) {
        NSUInteger index = [self.textFields indexOfObject: textField];
        [self.textFields removeObjectAtIndex: index];
        [self.suggestionStorage removeObjectAtIndex: index];
        [self.suggestionImageStorage removeObjectAtIndex: index];
    }
}

- (void) setItemPrototype: (NSString *) string textField: (NSTextField *) textField {
    if ([self.textFields containsObject: textField]) {
        NSUInteger index = [self.textFields indexOfObject: textField];
        [self.itemPrototypeStorage replaceObjectAtIndex: index withObject: string];
    }
}


- (void) setSuggestionStrings: (NSArray *) suggestions textField: (NSTextField *) textField {
    if ([self.textFields containsObject: textField]) {
        NSUInteger index = [self.textFields indexOfObject: textField];
        [self.suggestionStorage replaceObjectAtIndex: index withObject: suggestions];
    }
}


- (void) setImages: (NSArray *) images textField: (NSTextField *) textField {
    if ([self.textFields containsObject: textField]) {
        NSUInteger index = [self.textFields indexOfObject: textField];
        [self.suggestionImageStorage replaceObjectAtIndex: index withObject: images];
    }
}


- (void) controlTextDidBeginEditing: (NSNotification *) notification {
    self.selectedTextField = notification.object;

    self.suggestionsController.itemPrototypeName = self.itemPrototype;

    SuggestionsWindowController *controller = self.suggestionsController;
    [self updateSuggestionsFromControl: notification.object];
}


- (void) controlTextDidChange: (NSNotification *) notification {
    if (!self.skipNextSuggestion) {
        [self updateSuggestionsFromControl: notification.object];
    } else {
        suggestedURL = nil;

        [self.suggestionsController cancelSuggestions];

        self.skipNextSuggestion = NO;
    }
}

/* The field editor has ended editing the text. This is not the same as the action from the NSTextField. In the MainMenu.xib, the search text field is setup to only send its action on return / enter. If the user tabs to or clicks on another control, text editing will end and this method is called. We don't consider this committal of the action. Instead, we realy on the text field's action (see -takeImageFromSuggestedURL: above) to commit the suggestion. However, since the action may not occur, we need to cancel the suggestions window here.
*/
- (void) controlTextDidEndEditing: (NSNotification *) obj {
    [self.suggestionsController cancelSuggestions];
}


/* As the delegate for the NSTextField, this class is given a chance to respond to the key binding commands interpreted by the input manager when the field editor calls -interpretKeyEvents:. This is where we forward some of the keyboard commands to the suggestion window to facilitate keyboard navigation. Also, this is where we can determine when the user deletes and where we can prevent AppKit's auto completion.
*/
- (BOOL) control: (NSControl *) control textView: (NSTextView *) textView doCommandBySelector: (SEL) commandSelector {

    if (commandSelector == @selector(moveUp:)) {
        // Move up in the suggested selections list
        [self.suggestionsController moveUp: textView];
        return YES;
    }

    if (commandSelector == @selector(moveDown:)) {
        // Move down in the suggested selections list
        [self.suggestionsController moveDown: textView];
        return YES;
    }

    if (commandSelector == @selector(deleteForward:) || commandSelector == @selector(deleteBackward:)) {
        /* The user is deleting the highlighted portion of the suggestion or more. Return NO so that the field editor performs the deletion. The field editor will then call -controlTextDidChange:. We don't want to provide a new set of suggestions as that will put back the characters the user just deleted. Instead, set skipNextSuggestion to YES which will cause -controlTextDidChange: to cancel the suggestions window. (see -controlTextDidChange: above)
        */
        self.skipNextSuggestion = YES;
        return NO;
    }

    if (commandSelector == @selector(complete:)) {
        // The user has pressed the key combination for auto completion. AppKit has a built in auto completion. By overriding this command we prevent AppKit's auto completion and can respond to the user's intention by showing or cancelling our custom suggestions window.
        if ([self.suggestionsController.window isVisible]) {
            [self.suggestionsController cancelSuggestions];
        } else {
            [self updateSuggestionsFromControl: control];
        }

        return YES;
    }

    if (commandSelector == @selector(insertNewline:) || commandSelector == @selector(insertTab:)) {
        [self didSubmit: self.selectedTextField];

    }

    // This is a command that we don't specifically handle, let the field editor do the appropriate thing.
    return NO;
}


- (void) didSubmit: (NSTextField *) textField {
    if (completion) {
        completion(textField, @"anId");
    }

}

/* Update the field editor with a suggested string. The additional suggested characters are auto selected.
*/
- (void) updateFieldEditor: (NSText *) fieldEditor withSuggestion: (NSString *) suggestion {
    NSRange selection = NSMakeRange(fieldEditor.selectedRange.location, suggestion.length);
    fieldEditor.string = suggestion;
    //    fieldEditor.selectedRange = selection;
}


/* Determines the current list of suggestions, display the suggestions and update the field editor.
*/
- (void) updateSuggestionsFromControl: (NSControl *) control {
    NSText *fieldEditor = [control.window fieldEditor: NO forObject: control];

    if (fieldEditor) {
        // Only use the text up to the caret position
        NSRange selection = fieldEditor.selectedRange;
        NSString *text = [fieldEditor.string substringToIndex: selection.location];

        NSArray *suggestions = [self suggestionsForText: text];

        if (suggestions.count == 0) {
            suggestedURL = nil;
            selectedSuggestion = nil;
            [self.suggestionsController cancelSuggestions];
        } else {
            // We have at least 1 suggestion. Update the field editor to the first suggestion and show the suggestions window.
            NSDictionary *suggestion = [suggestions objectAtIndex: 0];
            suggestedURL = [suggestion objectForKey: kSuggestionImageURL];
            selectedSuggestion = suggestion;
            [self updateFieldEditor: fieldEditor withSuggestion: [suggestion objectForKey: kSuggestionLabel]];

            self.suggestionsController.suggestions = suggestions;

            if (!self.suggestionsController.window.isVisible) {
                [self.suggestionsController beginForTextField: (NSTextField *) control];
            }
        }

    }
}


/* This is the action method for when the user changes the suggestion selection. Note, this action is called continuously as the suggestion selection changes while being tracked and does not denote user committal of the suggestion. For suggestion committal, the text field's action method is used (see above). This method is wired up programatically in the -controlTextDidBeginEditing: method below.
*/
- (IBAction) updateWithSelectedSuggestion: (id) sender {

    NSDictionary *entry = [sender selectedSuggestion];
    if (entry) {

        selectedSuggestion = entry;
        NSText *fieldEditor = [self.suggestionsController.currentTextField.window fieldEditor: NO forObject: self];
        if (fieldEditor) {
            [self updateFieldEditor: fieldEditor withSuggestion: [entry objectForKey: kSuggestionLabel]];
            suggestedURL = [entry objectForKey: kSuggestionImageURL];
        }
    }
}



#pragma mark Suggestions





- (NSArray *) suggestionsForText: (NSString *) text {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if (self.suggestibleStrings) {
        NSMutableArray *results = [[self.suggestibleStrings stringsStartingWithString: text] mutableCopy];
        NSMutableArray *containingStrings = [[self.suggestibleStrings stringsContainingString: text] mutableCopy];
        [containingStrings removeObjectsInArray: results];
        [results addObjectsFromArray: containingStrings];

        for (NSString *string in results) {
            NSDictionary *entry = [self dictionaryForSuggestibleString: string];
            [ret addObject: entry];
        }
    }

    return ret;
}


- (NSDictionary *) dictionaryForSuggestibleString: (NSString *) string {
    NSMutableDictionary *entry = [[NSMutableDictionary alloc] init];
    [entry setObject: string forKey: kSuggestionLabel];
    [entry setObject: @"" forKey: kSuggestionDetailedLabel];

    NSString *imageString = [self imageStringForSuggestibleString: string];
    [entry setObject: imageString forKey: kSuggestionImageURL];

    return entry;

}

- (NSString *) imageStringForSuggestibleString: (NSString *) string {
    NSString *ret = @"";
    if (self.suggestionImages) {
        NSUInteger index = [self.suggestibleStrings indexOfObject: string];
        if (index != -1 && [self.suggestionImages count] > 0) {
            ret = [self.suggestionImages objectAtIndex: index];
        }
    }
    return ret;
}




#pragma mark Current values

- (NSUInteger) selectedIndex {
    return [self.textFields indexOfObject: self.selectedTextField];
}

- (NSArray *) suggestionImages {
    return [suggestionImageStorage objectAtIndex: self.selectedIndex];
}

- (NSArray *) suggestibleStrings {
    return [suggestionStorage objectAtIndex: self.selectedIndex];
}

- (NSString *) itemPrototype {
    NSString *ret = [self.itemPrototypeStorage objectAtIndex: self.selectedIndex];
    if ([ret isEqualToString: @""]) {
        ret = nil;
    }
    return ret;
}




#pragma mark Utilities

- (SuggestionsWindowController *) suggestionsController {
    if (suggestionsController == nil) {
        suggestionsController = [[SuggestionsWindowController alloc] init];
        suggestionsController.target = self;
        suggestionsController.action = @selector(updateWithSelectedSuggestion:);
    }
    return suggestionsController;
}

- (NSMutableArray *) suggestionImageStorage {
    if (suggestionImageStorage == nil) {
        suggestionImageStorage = [[NSMutableArray alloc] init];
    }
    return suggestionImageStorage;
}

- (NSMutableArray *) suggestionStorage {
    if (suggestionStorage == nil) {
        suggestionStorage = [[NSMutableArray alloc] init];
    }
    return suggestionStorage;
}

- (NSMutableArray *) textFields {
    if (textFields == nil) {
        textFields = [[NSMutableArray alloc] init];
    }
    return textFields;
}

- (NSMutableArray *) itemPrototypeStorage {
    if (itemPrototypeStorage == nil) {
        itemPrototypeStorage = [[NSMutableArray alloc] init];
    }
    return itemPrototypeStorage;
}

@end