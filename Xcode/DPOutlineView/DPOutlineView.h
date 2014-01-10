//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPOutlineViewItem : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic, strong) NSImage *image;
- (instancetype) initWithTitle: (NSString *) aTitle;
- (instancetype) initWithTitle: (NSString *) aTitle image: (NSImage *) anImage;


@end


@interface DPOutlineViewSection : NSObject

@property(nonatomic, copy) NSString *title;

- (instancetype) initWithTitle: (NSString *) aTitle items: (NSMutableArray *) anItems;
- (instancetype) initWithTitle: (NSString *) aTitle;
- (NSUInteger) itemCount;
- (DPOutlineViewItem *) itemAtIndex: (NSUInteger) index1;

- (void) addItem: (DPOutlineViewItem *) item;

@end


@protocol DPOutlineViewDelegate <NSObject>

@optional
- (void) prepareDatasource;

@end


@interface DPOutlineView : NSOutlineView <NSOutlineViewDelegate, NSOutlineViewDataSource> {
    id<DPOutlineViewDelegate> outlineDelegate;
    BOOL autoExpands;
}

@property(nonatomic) BOOL autoExpands;
@property(nonatomic, strong) id <DPOutlineViewDelegate> outlineDelegate;
- (void) prepareDatasource;
- (void) clearSections;
- (DPOutlineViewSection *) sectionAtIndex: (NSUInteger) index1;
- (void) addSection: (DPOutlineViewSection *) section;
- (NSUInteger) sectionCount;
@end