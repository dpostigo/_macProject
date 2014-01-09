//
//  BasicCollectionView.m
//  Carts
//
//  Created by Daniela Postigo on 11/11/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicCollectionView.h"
#import "BasicCollectionViewItem.h"

@implementation BasicCollectionView {

}

@synthesize delegate;
@synthesize itemSize;

- (void) drawRect: (NSRect) dirtyRect {
    //    [super drawRect: dirtyRect];
    //    [[NSColor clearColor] set];
    //    NSRectFill(self.frame);
}

- (BOOL) isOpaque {
    return NO;
}



#pragma mark Getters / Setters

- (Class) itemClass {
    return [self.itemPrototype class];
}

- (void) setItemClass: (Class) itemClass {
    self.itemPrototype = [[itemClass alloc] init];
}

#pragma mark Collection


- (void) setItemSize: (NSSize) itemSize1 {
    itemSize = itemSize1;

    self.minItemSize = itemSize;
    self.maxItemSize = itemSize;
    [self setNeedsDisplay: YES];

}

- (NSRect) frameForItemAtIndex: (NSUInteger) index1 withNumberOfItems: (NSUInteger) numberOfItems {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return [super frameForItemAtIndex: index withNumberOfItems: numberOfItems];
}

- (NSCollectionViewItem *) itemAtIndex: (NSUInteger) index1 {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return [super itemAtIndex: index];
}


- (NSRect) frameForItemAtIndex: (NSUInteger) index1 {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return [super frameForItemAtIndex: index];
}

- (NSCollectionViewItem *) newItemForRepresentedObject: (id) object {
    NSCollectionViewItem *ret = [super newItemForRepresentedObject: object];

    if ([ret isKindOfClass: [BasicCollectionViewItem class]]) {
        [self notifyDelegate: @selector(customizeBasicItem:object:) withObject: ret withObject: object];
    }
    [self notifyDelegate: @selector(customizeItem:object:) withObject: ret withObject: object];
    return ret;
}


- (void) notifyDelegate: (SEL) selector {
    if (delegate && [delegate respondsToSelector: selector]) {
        [delegate performSelector: selector];
    }
}

- (void) notifyDelegate: (SEL) selector withObject: (id) object {
    if (delegate && [delegate respondsToSelector: selector]) {
        [delegate performSelector: selector withObject: object];
    }
}


- (void) notifyDelegate: (SEL) selector withObject: (id) object withObject: object2 {
    if (delegate && [delegate respondsToSelector: selector]) {
        [delegate performSelector: selector withObject: object withObject: object2];
    }
}

@end