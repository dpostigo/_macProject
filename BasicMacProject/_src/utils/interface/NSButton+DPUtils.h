//
// Created by Daniela Postigo on 5/22/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSButton (DPUtils)

+ (NSButton *) buttonWithType: (NSButtonType) type;
+ (NSButton *) buttonWithImage: (NSImage *) image;
+ (NSButton *) buttonWithImage: (NSImage *) image padding: (CGFloat) padding;
+ (NSButton *) buttonWithImageType: (NSString *) imageString;
- (void) addTarget: (id) target action: (SEL) selector;
@end