//
//  NSAttributedString+DPUtils.h
//  PDFUtility
//
//  Created by Daniela Postigo on 5/30/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (DPUtils)

+ (NSAttributedString *) attributedStringWithString: (NSString *) string font: (NSFont *) font;
+ (NSAttributedString *) attributedStringWithString: (NSString *) string font: (NSFont *) font textColor: (NSColor *) color;
+ (NSAttributedString *) attributedStringWithString: (NSString *) string textColor: (NSColor *) color;
+ (NSAttributedString *) attributedStringWithString: (NSString *) string font: (NSFont *) font paragraphStyle: (NSParagraphStyle *) paragraphStyle;
+ (NSAttributedString *) attributedStringWithString: (NSString *) string font: (NSFont *) font textColor: (NSColor *) color paragraphStyle: (NSParagraphStyle *) paragraphStyle;
+ (NSAttributedString *) attributedStringWithString: (NSString *) string font: (NSFont *) font textColor: (NSColor *) aColor shadow: (NSShadow *) shadow1;
+ (NSAttributedString *) attributedStringWithString: (NSString *) string font: (NSFont *) font textColor: (NSColor *) aColor shadowColor: (NSColor *) shadowColor;
+ (NSAttributedString *) stringWithString: (NSString *) string font: (NSFont *) font paragraphStyle: (NSParagraphStyle *) paragraphStyle;
+ (NSAttributedString *) attributedString: (NSAttributedString *) string1 byAppendingString: (NSAttributedString *) string2;
+ (NSAttributedString *) stringByJoiningStrings: (NSArray *) array;
@end