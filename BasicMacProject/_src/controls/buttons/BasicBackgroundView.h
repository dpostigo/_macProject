//
//  BasicBackgroundView.h
//  Button
//
//  Created by ampatspell on 5/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BasicBackgroundView : NSView {


    CGFloat borderWidth;
    CGFloat cornerRadius;
    CGFloat shadowOpacity;
    CGFloat gradientRotation;

    NSColor *borderColor;
    NSColor *backgroundColor;
    NSGradient *gradient;
    NSShadow *shadow;
}


@property(nonatomic, strong) NSColor *borderColor;
@property(nonatomic, strong) NSGradient *gradient;
@property(nonatomic, strong) NSColor *backgroundColor;
@property(nonatomic) CGFloat cornerRadius;
@property(nonatomic) CGFloat borderWidth;
@property(nonatomic) CGFloat shadowOpacity;
@property(nonatomic, strong) NSShadow *shadow;
@property(nonatomic) CGFloat gradientRotation;
- (void) setup;
@end
