//
//  NewCustomWindow.h
//  Carts
//
//  Created by Daniela Postigo on 6/24/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NewCustomWindow : NSWindow {

    BOOL showsCloseButton;
    BOOL showsMinimizeButton;
    BOOL showsMaximizeButton;
    NSMutableArray *windowButtons;

    Class frameClass;
    NSString *frameClassString;
    NSView *childContentView;


    CGFloat buttonHeight;
    CGFloat buttonPadding;
    CGFloat windowFramePadding;

}

@property(nonatomic) BOOL showsCloseButton;
@property(nonatomic) BOOL showsMinimizeButton;
@property(nonatomic) BOOL showsMaximizeButton;

@property(nonatomic, strong) Class frameClass;
@property(nonatomic, strong) NSView *childContentView;
@property(nonatomic, retain) NSString *frameClassString;
@property(nonatomic) NSMutableArray *windowButtons;
@property(nonatomic) CGFloat buttonPadding;
@property(nonatomic) CGFloat buttonHeight;
@property(nonatomic) CGFloat windowFramePadding;


@end