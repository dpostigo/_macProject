//
//  NSAttributedString+DPUtils.m
//  PDFUtility
//
//  Created by Daniela Postigo on 5/30/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSAttributedString+DPUtils.h"


@implementation NSAttributedString (DPUtils)

+ (NSAttributedString *) attributedStringWithString: (NSString *) string font: (NSFont *) font {
    return [NSAttributedString attributedStringWithString: string font: font textColor: [NSColor blackColor] paragraphStyle: [NSParagraphStyle defaultParagraphStyle]];
}

+ (NSAttributedString *) attributedStringWithString: (NSString *) string font: (NSFont *) font textColor: (NSColor *) color {
    return [NSAttributedString attributedStringWithString: string font: font textColor: color paragraphStyle: [NSParagraphStyle defaultParagraphStyle]];
}

+ (NSAttributedString *) attributedStringWithString: (NSString *) string font: (NSFont *) font textColor: (NSColor *) color paragraphStyle: (NSParagraphStyle *) paragraphStyle {
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
    [attributes setObject: font forKey: NSFontAttributeName];
    [attributes setObject: color forKey: NSForegroundColorAttributeName];
    [attributes setObject: paragraphStyle forKey: NSParagraphStyleAttributeName];
    return [[NSAttributedString alloc] initWithString: string attributes: attributes];
}


+ (NSAttributedString *) attributedStringWithString: (NSString *) string font: (NSFont *) font paragraphStyle: (NSParagraphStyle *) paragraphStyle {
    return [NSAttributedString attributedStringWithString: string font: font textColor: [NSColor blackColor] paragraphStyle: paragraphStyle];
}


+ (NSAttributedString *) attributedStringWithString: (NSString *) string font: (NSFont *) font textColor: (NSColor *) aColor shadow: (NSShadow *) shadow {
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
    [attributes setObject: font forKey: NSFontAttributeName];
    [attributes setObject: aColor forKey: NSForegroundColorAttributeName];
    [attributes setObject: shadow forKey: NSShadowAttributeName];
    return [[NSAttributedString alloc] initWithString: string attributes: attributes];
}


+ (NSAttributedString *) attributedStringWithString: (NSString *) string font: (NSFont *) font textColor: (NSColor *) aColor shadowColor: (NSColor *) shadowColor {
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowBlurRadius = 1.0;
    shadow.shadowOffset = NSMakeSize(0, -1);
    shadow.shadowColor = shadowColor;
    return [NSAttributedString attributedStringWithString: string font: font textColor: aColor shadow: shadow];
}

+ (NSAttributedString *) attributedStringWithString: (NSString *) string textColor: (NSColor *) color {
    return [NSAttributedString attributedStringWithString: string font: [NSFont boldSystemFontOfSize: [NSFont smallSystemFontSize]] textColor: color paragraphStyle: [NSParagraphStyle defaultParagraphStyle]];
}


+ (NSAttributedString *) stringWithString: (NSString *) string font: (NSFont *) font paragraphStyle: (NSParagraphStyle *) paragraphStyle {
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
    [attributes setObject: font forKey: NSFontAttributeName];
    [attributes setObject: paragraphStyle forKey: NSParagraphStyleAttributeName];
    return [[NSAttributedString alloc] initWithString: string attributes: attributes];
}

+ (NSAttributedString *) attributedString: (NSAttributedString *) string1 byAppendingString: (NSAttributedString *) string2 {
    return [self stringByJoiningStrings: [NSArray arrayWithObjects: string1, string2, nil]];

}

+ (NSAttributedString *) stringByJoiningStrings: (NSArray *) array {
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] init];
    int length = [array count];
    for (int j = 0; j < length; j++) {
        NSAttributedString *attributedString = [array objectAtIndex: j];
        [string appendAttributedString: attributedString];
    }
    return string;
}


@end