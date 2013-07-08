//
// Created by Daniela Postigo on 5/22/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSButton+DPUtils.h"


@implementation NSButton (DPUtils)


+ (NSButton *) buttonWithType: (NSButtonType) type {
    NSButton *button = [[NSButton alloc] init];
    [button setButtonType: type];
    return button;
}

+ (NSButton *) buttonWithImage: (NSImage *) image {
    return [NSButton buttonWithImage: image padding: 0];
}

+ (NSButton *) buttonWithImage: (NSImage *) image padding: (CGFloat) padding {
    NSButton *button = [[[self class] alloc] initWithFrame: NSMakeRect(0, 0, image.size.width + padding, image.size.height + padding)];
    button.width = image.size.width + padding;
    button.height = image.size.height + padding;
    button.width = MAX(button.width, button.height);
    button.height = MAX(button.width, button.height);

    NSLog(@"button.width = %f", button.width);
    NSLog(@"button.height = %f", button.height);

    button.image = image;
    button.title = @"";
    return button;
}

+ (NSButton *) buttonWithImageType: (NSString *) imageString {
    NSImage *image = [NSImage imageNamed: imageString];
    return [NSButton buttonWithImage: image];
}


- (void) addTarget: (id) target action: (SEL) selector {
    self.target = target;
    self.action = selector;
}
@end