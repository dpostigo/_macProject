//
// Created by Dani Postigo on 1/22/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <NSColor-Crayola/NSColor+Crayola.h>
#import "BOBackgroundTextField.h"
#import "CALayer+ConstraintUtils.h"
#import "NSColor+NewUtils.h"
#import "NSMutableAttributedString+DPKit.h"
#import "DPBackgroundTextFieldCell.h"

@implementation BOBackgroundTextField

- (void) setDefaultBackgroundView {
    [super setDefaultBackgroundView];
    [self customizeField: self];
}

- (void) customizeField: (DPBackgroundTextField *) field {

    self.inputCell.leftOffset = 0;
    //    self.insets = NSEdgeInsetsMake(<#(CGFloat)top#>, <#(CGFloat)left#>, <#(CGFloat)bottom#>, <#(CGFloat)right#>)

    CAGradientLayer *gradient;
    gradient = [CAGradientLayer layer];
    gradient.name = @"gradient";
    gradient.colors = @[
            (__bridge id) [[NSColor crayolaMummysTombColor] mix: [NSColor whiteColor] fraction: 0.9].CGColor,
            (__bridge id) [NSColor whiteColor].CGColor,
            (__bridge id) [NSColor whiteColor].CGColor];

    CALayer *layer = field.backgroundView.layer;
    [layer addSublayer: gradient];
    gradient.delegate = layer.delegate;
    gradient.masksToBounds = YES;
    [gradient superConstrain];

    NSShadow *dropShadow = [[NSShadow alloc] init];
    dropShadow.shadowColor = [NSColor crayolaMummysTombColor];
    dropShadow.shadowOffset = NSMakeSize(0, -1);
    dropShadow.shadowBlurRadius = 2.0;
    field.backgroundView.shadow = dropShadow;

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString: @""];
    [string addAttribute: NSForegroundColorAttributeName value: [NSColor crayolaMummysTombColor]];

    NSFont *font = [NSFont fontWithName: @"HelveticaNeue" size: field.font.pointSize];
    [string addAttribute: NSFontAttributeName value: font];

    field.inputCell.attributedLabelString = string;
    //    field.stringValue = @"";

}
@end