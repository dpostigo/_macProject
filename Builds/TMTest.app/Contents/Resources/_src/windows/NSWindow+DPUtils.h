//
//  NSWindow+BlendingUtils.h
//  Carts
//
//  Created by Daniela Postigo on 10/18/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSWindow (DPUtils)

- (NSRect) bounds;
- (NSView *) contentAsView;
- (NSArray *) windowButtons;
- (NSArray *) windowButtonClones;
- (NSButton *) closeButton;
- (NSButton *) minimizeButton;
- (NSButton *) maximizeButton;
- (BOOL) isTexturedWindow;
- (void) setIsTexturedWindow: (BOOL) flag;
- (CGFloat) contentBorderThicknessForTopEdge;
- (void) setContentBorderThicknessForTopEdge: (CGFloat) thickness;
- (CGFloat) contentBorderThicknessForBottomEdge;
- (void) setContentBorderThicknessForBottomEdge: (CGFloat) thickness;
- (void) addSubviewToWindowFrame: (NSView *) aView;
- (NSView *) windowFrame;
- (NSView *) themeFrame;
- (NSString *) styleMaskAsString;
- (void) addViewToTitleBar: (NSView *) viewToAdd atXPosition: (CGFloat) x;
- (CGFloat) heightOfTitleBar;
@end