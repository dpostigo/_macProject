//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPOutlineViewItem : NSObject {
    NSString *title;
}

@property(nonatomic, copy) NSString *title;
- (instancetype) initWithTitle: (NSString *) aTitle;


@end



@interface DPOutlineViewSection : NSObject {
    NSString *title;
}

@property(nonatomic, copy) NSString *title;

- (instancetype) initWithTitle: (NSString *) aTitle items: (NSMutableArray *) anItems;
- (instancetype) initWithTitle: (NSString *) aTitle;
- (NSUInteger) itemCount;
- (DPOutlineViewItem *) itemAtIndex: (NSUInteger) index1;

- (void) addItem: (DPOutlineViewItem *) item;
@end


@interface DPOutlineView : NSOutlineView <NSOutlineViewDelegate, NSOutlineViewDataSource> {

    BOOL autoExpands;
}

@property(nonatomic) BOOL autoExpands;
- (void) prepareDatasource;
- (DPOutlineViewSection *) sectionAtIndex: (NSUInteger) index1;
- (NSUInteger) sectionCount;
@end