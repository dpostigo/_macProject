//
//  BasicCollectionViewItem.m
//  Carts
//
//  Created by Daniela Postigo on 10/24/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "BasicCollectionViewItem.h"
#import "NSView+Masonry.h"
#import "BasicDisplayView+Carts.h"
#import "BasicDisplayView+SurrogateUtils.h"
#import "View+MASAdditions.h"
#import "BasicCollectionView.h"
#import "NSView+DPUtils.h"

@implementation BasicCollectionViewItem {

}

@synthesize background;

@synthesize insets;

@synthesize displayBackground;

- (void) loadView {
    [super loadView];

    self.view.frame = NSMakeRect(0, 0, 50, 50);
    self.background = [BasicCollectionViewItem displayBackground];
    //    background.borderColor = [NSColor blackColor];

}


- (void) setInsets: (NSEdgeInsets) insets1 {
    insets = insets1;

    [background mas_updateConstraints: ^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(insets);
    }];
}


- (void) setBackground: (NSView *) background1 {
    if (background) {
        if (background.superview) [background removeFromSuperview];
    }

    background = background1;

    if (background) {
        //        background.frame = self.view.bounds;
        [self.view insertSubview: background atIndex: 0];
        [background fillToSuperview];
    }

}


- (BasicDisplayView *) displayBackground {
    BasicDisplayView *ret = nil;
    if ([self.background isKindOfClass: [BasicDisplayView class]]) {
        ret = (BasicDisplayView *) self.background;
    }
    return ret;
}

+ (BasicDisplayView *) displayBackground {
    return [BasicDisplayView newWithBackgroundColor: [NSColor whiteColor]];
}

- (BasicCollectionView *) basicCollectionView {
    BasicCollectionView *ret = nil;
    if ([self.collectionView isKindOfClass: [BasicCollectionView class]]) {
        ret = (BasicCollectionView *) self.collectionView;
    }
    return ret;
}

@end